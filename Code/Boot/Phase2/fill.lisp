(cl:in-package #:sicl-boot-phase2)

(defun ld (filename environment)
  (format *trace-output* "Loading file ~a~%" filename)
  (finish-output *trace-output*)
  (sicl-extrinsic-environment:load-source-with-environments
   (asdf:system-relative-pathname :sicl-boot-phase2 filename)
   (sicl-boot-phase1:compilation-environment environment)
   environment))

(defun define-ensure-generic-function (environment)
  (setf (sicl-genv:fdefinition 'ensure-generic-function environment)
	(lambda (function-name &rest arguments)
	  (if (sicl-genv:fboundp function-name environment)
	      (sicl-genv:fdefinition function-name environment)
	      (let ((new-arguments (copy-list arguments)))
		(loop while (remf new-arguments :environment))
		(setf (sicl-genv:fdefinition function-name environment)
		      (apply #'make-instance
			     (sicl-genv:find-class
			      'standard-generic-function
			      (phase1-environment environment))
			     new-arguments)))))))

(defun fill-environment (environment)
  (define-ensure-generic-function environment)
  (sicl-genv:fmakunbound 'sicl-clos:method-function environment)
  (ld "../../CLOS/method-function-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:method-generic-function environment)
  (ld "../../CLOS/method-generic-function-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:method-lambda-list environment)
  (ld "../../CLOS/method-lambda-list-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:method-qualifiers environment)
  (ld "../../CLOS/method-qualifiers-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:method-specializers environment)
  (ld "../../CLOS/method-specializers-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:accessor-method-slot-definition environment)
  (ld "../../CLOS/accessor-method-slot-definition-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-name environment)
  (ld "../../CLOS/slot-definition-name-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-allocation environment)
  (ld "../../CLOS/slot-definition-allocation-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-type environment)
  (ld "../../CLOS/slot-definition-type-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-initargs environment)
  (ld "../../CLOS/slot-definition-initargs-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-initform environment)
  (ld "../../CLOS/slot-definition-initform-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-initfunction environment)
  (ld "../../CLOS/slot-definition-initfunction-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-readers environment)
  (ld "../../CLOS/slot-definition-readers-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-writers environment)
  (ld "../../CLOS/slot-definition-writers-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:slot-definition-location environment)
  (ld "../../CLOS/slot-definition-location-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-name environment)
  (ld "../../CLOS/class-name-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-direct-superclasses environment)
  (ld "../../CLOS/class-direct-superclasses-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-direct-slots environment)
  (ld "../../CLOS/class-direct-slots-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-direct-default-initargs environment)
  (ld "../../CLOS/class-direct-default-initargs-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-precedence-list environment)
  (ld "../../CLOS/class-precedence-list-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-slots environment)
  (ld "../../CLOS/class-slots-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-default-initargs environment)
  (ld "../../CLOS/class-default-initargs-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-finalized-p environment)
  (ld "../../CLOS/class-finalized-p-defgeneric.lisp" environment)
  (sicl-genv:fmakunbound 'sicl-clos:class-prototype environment)
  (ld "../../CLOS/class-prototype-defgeneric.lisp" environment))