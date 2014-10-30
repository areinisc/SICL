(cl:in-package #:sicl-direct-extrinsic-compiler)

(defun compile-function-form (form processor os)
  (let* ((environment sicl-extrinsic-environment:*environment*)
	 (sicl-env:*global-environment* environment)
	 (ast (cleavir-generate-ast:generate-ast form environment))
	 (hir (cleavir-ast-to-hir:compile-toplevel ast))
	 (mir (cleavir-ir:hir-to-mir sicl processor os)))
    mir))
