(defun bfs (no-inicial objetivop sucessoresf operadores &optional abertos fechados)
  (let* ((nos-succ (remove-if #'(lambda (x) (or (no-existep x abertos 'bfs)
                                                (no-existep x fechados 'bfs)))
                              (funcall sucessoresf no-inicial operadores 'bfs)))
         (nos-succ-solucoes (remove-if-not objetivop nos-succ)))
    (cond (nos-succ-solucoes (car nos-succ-solucoes))
          ((and (null nos-succ) (null abertos)) nil)
          ((null abertos) (bfs (car nos-succ) objetivop sucessoresf operadores (cdr nos-succ) (cons no-inicial fechados)))
          (t (bfs (car abertos) objetivop sucessoresf operadores (append (cdr abertos) nos-succ) (cons no-inicial fechados))))))


(defun dfs (no-inicial no-objetivo no-sucessores operadores profundidade)
                      

  (cond ((equal no-inicial no-objetivo)
         (reverse (cons no-inicial no-sucessores)))
        (t (movements no-inicial no-objetivo no-sucessores operadores operadores)))
  
)

(defun movements (no-inicial no-objetivo no-sucessores operadores-teste operadores)
  (cond ((null operadores-teste) nil)
        ((member no-inicial no-sucessores :test #'equal) nil)
        (t (let ((child (funcall (car operadores-teste) no-inicial)))
             (if child
                 (or (dfs (funcall (car operadores-teste) no-inicial) no-objetivo (cons no-inicial no-sucessores) operadores)
                     (movements no-inicial no-objetivo no-sucessores (cdr operadores-teste) operadores))))))

)