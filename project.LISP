(setq *DEFAULT-PATHNAME-DEFAULTS* (pathname "D:\\LEI\\IA\\20_21\\projeto1\\lispprojectgame\\"))
(defun startup ()
  (load "puzzle.lisp")
  (load "algorithm.lisp")
  (load "problemas.dat")
  ;(with-open-file (in #P"\\lispprojectgame\\puzzle.lisp")
  ;  (load "\\lispprojectgame\\puzzle.lisp"))
  ;(with-open-file (in #P"\\lispprojectgame\\algorithm.lisp")
  ;  (load "\\lispprojectgame\\algorithm.lisp"))
)
  
(startup)


