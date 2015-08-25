(cl:in-package #:sicl-format)

(defun report-control-string-and-directive-start-position (condition stream)
  (format stream
	  "In the control-string \"~a\",~%~
           in the directive that starts at position ~a,~%"
	  (control-string condition)
	  (tilde-position condition)))

(defmethod cleavir-i18n:report-condition
    ((condition end-of-control-string-error)
     stream
     (language cleavir-i18n:english))
  (report-control-string-and-directive-start-position condition stream)
  (format stream
	  "~a, but reached the end of the control string"
	  (why condition)))

(defmethod cleavir-i18n:report-condition
    ((condition expected-integer-error)
     stream
     (language cleavir-i18n:english))
  (report-control-string-and-directive-start-position condition stream)
  (format stream
	  "expected an integer at index ~a,~% but found the character `~a' instead"
	  (index condition)
	  (char (control-string condition) (index condition))))

(defmethod cleavir-i18n:report-condition
    ((condition expected-parameter-start)
     stream
     (language cleavir-i18n:english))
  (report-control-string-and-directive-start-position condition stream)
  (format stream
	  "expected one of ', +, -, or a decimal digit at index ~a,~%~
              but found the character `~a' instead"
	  (index condition)
	  (char (control-string condition) (index condition))))