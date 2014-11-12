((el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:load "el-get.el"))
 (nodejs-repl status "installed" recipe
	      (:name nodejs-repl :description "Run Node.js REPL and communicate the process" :type github :pkgname "abicky/nodejs-repl.el")))
