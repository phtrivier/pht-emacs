;; Usefull functions for cpp
(defun file-name ()
  (let ((tokens (split-string (buffer-name) "\\.")))
    (car tokens)))

(defun class-name-elements ()
  (split-string (file-name) "_"))

(defun class-name ()
  (mapconcat 'capitalize (class-name-elements) ""))
    
(defun class-define-clause ()
  (concat "_" (mapconcat 'upcase (class-name-elements) "_") "_HPP_"))

(define-skeleton class-header-file
  "Insert the beginning of a class header file"
  "Describe the class : "
  "#ifndef " (class-define-clause) "\n"
  "#define " (class-define-clause) "\n"
  "\n"
  "\n"
  "/**\n"
  " * " str "\n"
  " */\n"
  "class " (class-name) " { \n"
  _
  "\n"
  "public:\n"
  "};\n"
  "\n"
  "#endif // " (class-define-clause) "\n")

(define-skeleton gmock-test
  "Insert an empty Gmock Test skeleton"
  "Header file : "
  "#include \"" str "\"\n"
  "#include <gtest/gtest.h>\n"
  "#include <gmock/gmock.h>\n"
  "#include <stdexcept>\n"
  "using namespace std;\n"
  "\n"
  "namespace {\n"
  "  class " (class-name) " : public ::testing::Test {\n"
  "  protected:\n"
  "    " (class-name) "() {\n"
  "    }\n"
  "\n"
  "    virtual ~" (class-name) "() {\n"
  "    }\n"
  "\n"
  "    virtual void SetUp() {\n"
  "    }\n"
  "\n"
  "    virtual void TearDown() {\n"
  "    }\n"
  "\n"
  "  };\n"
  "\n"
  "  TEST_F(" (class-name) ", DoesSomethingCool) {\n"
  "    " _ "\n"
  "  }\n"
  "\n"
  "} // Namespace\n")

(define-skeleton gtest-f
  "Includes a TEST_F macro"
  "Test name : "
  "TEST_F(" (class-name) ", " str ") {\n"
  "    " _ "\n"
  "  }\n")

(define-skeleton method-comments
  "Include empty method comments"
  ""
  "/**\n"
  "   * " _ "\n"
  "   */")

(define-skeleton cpp-prevent-copying
  "Include empty copy-constructor and equal operator"
  ""
  "  // Prevents copying of the class\n"
  "  " (class-name) "(const " (class-name) " & other) { } \n"
  "  " (class-name) " & operator = (const " (class-name) " & other) { } \n")

(provide 'cpp-stuff)