(setq *DEFAULT-PATHNAME-DEFAULTS* (pathname "D:\\LEI\\IA\\20_21\\projeto1\\lispprojectgame\\"))

(defun startup ()
  (load "puzzle.lisp" :if-does-not-exist nil)
  (use-package 'operate)
  (load "procura.lisp" :if-does-not-exist nil)
  (use-package 'algos)
)
  

(startup)


(defun string-to-list (str)
        (if (not (streamp str))
           (string-to-list (make-string-input-stream str))
           (if (listen str)
                (cons (read str) (string-to-list str))
               nil)))


(defun loadfile(file)
   (let (doc (read-line file))
        (print do
)
)

