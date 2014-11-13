((el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :load "el-get.el"))
 (linum-ex status "installed" recipe
           (:name linum-ex :description "Display line numbers to the left of buffers" :type emacswiki :features linum-ex))
 (nodejs-repl status "installed" recipe
              (:name nodejs-repl :description "Run Node.js REPL and communicate the process" :type github :pkgname "abicky/nodejs-repl.el")))
