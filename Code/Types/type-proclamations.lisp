(cl:in-package #:sicl-type)

;;; FIXME: try defining some more specific types
(declaim (ftype (function (t t &optional t) (member t nil))
		typep))


