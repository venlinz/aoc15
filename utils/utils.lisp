(defpackage :utils
  (:use :cl)
  (:export #:read-lines #:exit))

(in-package :utils)

(defun read-lines(filepath)
  (with-open-file (filestream filepath :direction :input)
    (do (
         (line (read-line filestream nil) (read-line filestream nil))
         (lines (list))
         )
      ((null line) lines)
      (setq lines (append lines (list line)))
      )
    )
  )

(defun exit()
  #+sbcl (sb-ext:quit)
  #+clisp (ext:exit)
  )
