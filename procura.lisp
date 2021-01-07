#|(defun obter-problemas (file)
  (with-open-file (s file)
    (let ((problems nil))
      (do ((prob (read s) (read s nil 'eof))) ((eq prob 'eof) problems)
        (setq problems (cons prob problems))))))|#

(defun cria-no (estado  &optional (g 0) (pai nil))
  (list estado g pai)
)

#|TABULEIRO-CONTEUDO
no - No
|#
(defun tabuleiro-conteudo (no)
(caar no)
)

#|RESERVA-CONTEUDO
no - No
|#
(defun reserva-conteudo (no)
(cdar no)
)

(defun no-estado (teste)
  (car teste))

(defun no-pai (teste)
  (cddr teste)
  )

(defun no-profundidade (teste)
  (cadr teste)
  )


(defun novo-sucessor (teste x)
  (let ((novo-estado (funcall x (no-estado teste))))
    (cond ((null novo-estado) nil)
	  (t (list novo-estado (1+ (no-profundidade teste)) teste))))
  )

#|(defun sucessores (no operadores algoritmo &optional (max-prof nil))
  (cond ((and max-prof (eq algoritmo 'dfs)
	      (>= (no-profundidade no)
		  max-prof)) nil)
	(t (remove nil
		   (mapcar #'(lambda (operador) (novo-sucessor no operador)) operadores)))))|#

(defun sucessores-quatro (no operadoresf algoritmo &optional (max-prof nil))
  (cond ((and max-prof (eq algoritmo 'dfs)
	      (>= (no-profundidade no)
		  max-prof)) nil)
	(t (remove nil
		   (mapcar #'(lambda (operador) (novo-sucessor no operador)) (funcall operadoresf (no-estado no)))))))
  
(defun operadores-quatro (estado-jogo)
  (let ((casas (casas-vazias (tabuleiro estado-jogo)))
        (pecas (reserva estado-jogo)))
    (apply #'append (mapcar #'(lambda (casa)
                (mapcar #'(lambda (peca)
                            (lambda (estado) (jogada (car casa) (cadr casa) peca estado)))
                            pecas))
            casas))))



(defun nivel-no (no)
  (cadr no)
  )

(defun abertos-bfs (abertos sucessores)
  (append abertos sucessores)
  )

(defun abertos-dfs (abertos sucessores)
  (append sucessores abertos)
  )

(defun tamanho-solucao (node)
  "Devolve o comprimento de uma  solucao"
  (length (car node)))

(defun no-existep (no lista algoritmo)
  (cond ((null lista) nil)
	((and (or (eq algoritmo 'bfs) (<= (nivel-no (car lista)) (nivel-no no)))
	      (equal (no-estado (car lista)) (no-estado no))) t)
	(t (no-existep no (cdr lista) algoritmo))))


(defun penetrancia (solucao)
"Penetrancia"
  (/ (tamanho-solucao solucao) (second solucao))
)

;;Algoritmo de Procura em Largura
(defun bfs (no-inicial objetivop sucessoresf operadores &optional (abertos nil) (fechados nil))
  (if (funcall objetivop no-inicial)
      no-inicial
      (let ((nos-succ (remove-if #'(lambda (x) (or (no-existep x abertos 'bfs)
						   (no-existep x fechados 'bfs)))
				 (funcall sucessoresf
					  no-inicial operadores 'bfs))))
	(cond ((and (null nos-succ) (null abertos)) nil)
	      ((null abertos)
	       (bfs (car nos-succ) objetivop sucessoresf operadores
		    (cdr nos-succ) (cons no-inicial fechados)))
	      (t (bfs (car abertos) objetivop sucessoresf operadores
		      (abertos-bfs (cdr abertos) nos-succ)
		      (cons no-inicial fechados))))))
  
)


;;Algoritmo de Procura em Profundidade
(defun dfs (no-inicial objetivop sucessoresf operadores prof-max
	    &optional (abertos nil) (fechados nil))
  (if (funcall objetivop no-inicial)
      no-inicial
      (let ((nos-succ (remove-if #'(lambda (x) (or (no-existep x abertos 'dfs)
						   (no-existep x fechados 'dfs)))
				 (funcall sucessoresf
					  no-inicial operadores 'dfs prof-max))))
	(cond ((and (null nos-succ) (null abertos)) nil)
	      ((null nos-succ)
	       (dfs (car abertos) objetivop sucessoresf operadores
		    prof-max (cdr abertos) (cons no-inicial fechados)))
	      (t (dfs (car nos-succ) objetivop sucessoresf operadores
		      prof-max (abertos-dfs abertos (cdr nos-succ))
		      (cons no-inicial fechados)))))))

;;; Implementacao funcional de pairing heap
;;; para usar como priority queue em A*

(defun empty-heap-p (h)
  (null h))

(defun make-heap (&optional x (k 0))
  (cond ((null x) nil)
	(t (list x k nil nil))))

;; Junta duas heaps
(defun meld (&optional h1 h2)
  (cond ((null h1) h2)
	((null h2) h1)
	((<= (priority h1) (priority h2))
	 (list (elem h1) (priority h1)
	       (list (elem h2) (priority h2) (child h2)
		     (child h1))
	       nil))
	(t (meld h2 h1))))

;; Insere o elemento x na heap com prioridade k
(defun insert (x k heap)
  (let ((xh (make-heap x k)))
    (meld xh heap)))

(defun priority (node)
  (cadr node))

(defun elem (node)
  (car node))

;; O filho mais a esquerda do no
(defun child (node)
  (caddr node))

;; O irmao mais velho do no
(defun o-sibling (node)
  (cadddr node))

;; lista com todos os irmaos mais velhos do no
(defun siblings (node)
  (let ((sib (o-sibling node)))
    (cond ((null sib) nil)
	  (t (cons sib (siblings sib))))))

;; lista com os filhos do no
(defun children (heap)
  (if (empty-heap-p heap)
      nil
      (cons (child heap) (siblings (child heap)))))

;; junta as varias arvores par a par
(defun pairwise-link (heap-list)
  (cond ((null heap-list) nil)
	((null (cdr heap-list)) (cons (car heap-list) nil))
	(t (cons (meld (car heap-list) (cadr heap-list))
		 (pairwise-link (cddr heap-list))))))

;; retorna dois valores, a raiz da heap e a heap resultante
;; de remover a raiz
(defun remove-first (heap)
  (let ((popped (elem heap))
	(trees (children heap)))
    (values popped (reduce #'meld (pairwise-link trees) :from-end t))))



;;Algoritmo de Procura em A*
(defun a-star (no-inicial objetivop sucessoresf operadores
	       heuristicaf &optional pqueue)
  (if (funcall objetivop no-inicial)
      no-inicial
      (let* ((nos-succ (funcall sucessoresf no-inicial operadores 'a-star))
	     (dist-est (mapcar #'(lambda (no)
				   (+ (no-profundidade no)
				      (funcall heuristicaf (no-estado no)) 1))
			       nos-succ))
	     (new-pq (reduce (lambda (&optional heap no-dist)
			       (if (and (null no-dist) (null heap)) (make-heap)
				   (insert (car no-dist) (cadr no-dist) heap)))
			     (mapcar #'list
				     nos-succ dist-est)
			     :initial-value (if (empty-heap-p pqueue)
						(make-heap)
						pqueue))))
	(if (null new-pq) nil
	    (multiple-value-bind (next-node next-pq)
		(remove-first new-pq)
	      (a-star next-node objetivop sucessoresf operadores
		      heuristicaf next-pq))))))