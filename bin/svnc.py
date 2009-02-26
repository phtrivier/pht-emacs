#!/usr/bin/env python
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2008 David Sveningsson
# 
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO. 
#  1. That's what i did with your script (C) 2008 Pierre Coquentin
#

import sys
import select
import socket
import platform

from subprocess import *

DarkRed = "\033[00;31m"
Red = "\033[01;31m"
Green = "\033[01;32m"
Brown = "\033[00;33m"
Yellow = "\033[01;33m"
Blue = "\033[01;34m"
Purple = "\033[00;35m"
Cyan = "\033[00;36m"
White = "\033[01;37m"
Grey = "\033[00;37m"
Reset = "\033[0m"

color_table = { 
        'C': DarkRed,
        'G': Yellow,
        'M': Brown,
        'U': Green,
        'A': Purple,
        'D': Blue,
        '?': Cyan,
        '!': Red
}

def set_color(color, target):
    if color == None:
            target.write(Reset)
            return

    target.write(color)
        
def data_in_pipe(pipe):
    a,b,c = select.select([pipe], [], [], 0)
    return len(a) > 0

class Connector:
        def __init__(self, inp, out, cmd):
                self.inp = inp
                self.out = out
                self.content = ""
                self.cmd = cmd

        def read(self):
                char = self.inp.read(1)

                if len(char) == 0:
                        return True

                self.content += char

                if char[0] == "\n":
                        self.output()
                        self.content = ""
                        return False

        def output(self):
                color = None
                line = self.content
                if self.cmd == "help":
                    self.out.write(line)
                else:
                    stripped = line.strip()
                    if len(stripped) > 2:
                            if stripped[1].isspace() or stripped[2].isspace():
                                try:
                                    color = color_table[ stripped[0] ]
                                except:
                                    pass
                    try:
                            if color:
                                    set_color(color, self.out)
                                    self.out.write(line[:-1])
                                    set_color(None, self.out)
                                    self.out.write("\n")
                            else:
                                    self.out.write(line)
                    except:
                            set_color(None, self.out)

if __name__ == '__main__':
        cmd = ['svn']
        cmd += sys.argv[1:]
   
        try:
                process = Popen(cmd, stdout=PIPE, stderr=PIPE)
        except OSError, e:
                print e
                print cmd
                sys.exit(1)

        stdout = Connector(process.stdout, sys.stdout, sys.argv[1])
        stderr = Connector(process.stderr, sys.stderr, sys.argv[1])

        while True:
                ret = process.poll()

                while data_in_pipe(process.stdout):
                        stdout_eof = stdout.read()
                        if stdout_eof:
                                break

                while data_in_pipe(process.stderr):
                        stderr_eof = stderr.read()
                        if stderr_eof:
                                break

                if ret != None and stdout_eof and stderr_eof:
                        break

        if ret < 0:
                print 'Terminated with code: %d' % (-ret)
                sys.exit(-ret)
        else:
                sys.exit(ret)
