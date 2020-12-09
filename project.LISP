(setq *DEFAULT-PATHNAME-DEFAULTS* (pathname "D:\\LEI\\IA\\20_21\\projeto1\\lispprojectgame\\"))
(defun startup ()
  (load "puzzle.lisp")
  (load "algorithm.lisp")
  (load "problemas.dat")
  ;(with-open-file (in #P"D:\\aplicações\\Engenharia Informática\\IA\\20_21\\projeto1\\lispprojectgame\\puzzle.lisp")
  ;  (load "D:\\aplicações\\Engenharia Informática\\IA\\20_21\\projeto1\\lispprojectgame\\puzzle.lisp"))
  ;(with-open-file (in #P"D:\\aplicações\\Engenharia Informática\\IA\\20_21\\projeto1\\lispprojectgame\\algorithm.lisp")
  ;  (load "D:\\aplicações\\Engenharia Informática\\IA\\20_21\\projeto1\\lispprojectgame\\algorithm.lisp"))
)
  
(startup)


