(setq *DEFAULT-PATHNAME-DEFAULTS* (pathname "D:\\LEI\\IA\\20_21\\projeto1\\lispprojectgame\\"))


(defun startup ()
  (load "puzzle.lisp" :if-does-not-exist nil)
  (use-package 'operate)
  (load "procura.lisp" :if-does-not-exist nil)
  (use-package 'algos)
)
  

(startup)

(defun get-problems (file)
  (with-open-file (s file)
    (let ((problems nil))
      (do ((prob (read s) (read s nil 'eof))) ((eq prob 'eof) problems)
        (setq problems (cons prob problems))))))

