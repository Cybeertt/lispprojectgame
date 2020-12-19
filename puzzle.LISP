;; puzzle

;;;
;;; PROJETO fase 1
;;;

;;; funcoes auxiliares

;; nova-jogada PC random
;; l - lista
;; obter linha: (length (tabuleiro))
;; obter coluna: (length (car (tabuleiro)))
(defun nova-jogada (l)
(random (length l))
)

;; seleciona-peca PC random
;; p - peca
(defun seleciona-peca (p)
(extrai-n (random (length p)) p)
)

;;; funcoes programa

;;tabuleiro-e-pecas
;; retorna lista com 2 listas, uma lista de 4x4 e outra com 16 elementos
(defun tabuleiro-e-pecas ()
'(
(
(0 0 0 0)
(0 0 0 0)
(0 0 0 0)
(0 0 0 0)
)
(
(branca redonda alta oca)
(preta redonda alta oca)
(branca redonda baixa oca)
(preta redonda baixa oca)
(branca quadrada alta oca)
(preta quadrada alta oca)
(branca quadrada baixa oca)
(preta quadrada baixa oca) 
(branca redonda alta cheia)
(preta redonda alta cheia)
(branca redonda baixa cheia)
(preta redonda baixa cheia)
(branca quadrada alta cheia)
(preta quadrada alta cheia)
(branca quadrada baixa cheia)
(preta quadrada baixa cheia)
)
)
)

;; tabuleiro
;; l - lista de tabuleiro e pecas
;; retorna lista de 4 linhas com 4 elementos de valor 0
(defun tabuleiro (l)
(cond 
((null l) nil)
(t (car l))
)
)

;; reserva
;; l - lista de tabuleiro e pecas
;; retorna lista com 16 pecas com 4 carateristicas
(defun reserva (l)
(cond 
((null l) nil)
(t (cadr l))
)
)

;; extrai-n
;; i - indice; l - lista
;; retorna elemento caso contrario
(defun extrai-n (i l)
(cond
((null l) nil)
((= i 0) (car l))
(t (extrai-n (1- i) (cdr l)))
)
)

;; linha
;; r - linha; tab - lista tabuleiro ou reserva
;; retorna linha
(defun linha (r tab)
(extrai-n r tab)
)

;; coluna
;; r - linha, c - coluna; tab - tabuleiro
;; retorna uma lista com elementos da mesma coluna
(defun coluna (c tab)
(cond
((null tab) nil)
(t (cons (celula 0 c tab) (cons (celula 1 0 tab) (cons (celula 2 c tab) (cons (celula 3 c tab) nil)))))
)
)

;; celula
;; r - linha, c - coluna; tab - tabuleiro ou reserva
;; retorna um elemento de uma lista
(defun celula (r c tab)
(extrai-n c (extrai-n r tab))
)

;; diagonal-1
;; tab - tabuleiro
;; retorna a diagonal de um tabuleiro 4x4 : 00-11-22-33
(defun diagonal-1 (tab)
(cond 
((null tab) nil)
(t (cons (celula 0 0 tab) (cons (celula 1 1 tab) (cons (celula 2 2 tab) (cons (celula 3 3 tab) nil)))))
)
)

;; diagonal-2
;; tab - tabuleiro
;; retorna a diagonal de um tabuleiro 4x4 : 30-21-12-03
(defun diagonal-2 (tab)
(cond 
((null tab) nil)
(t (cons (celula 3 0 tab) (cons (celula 2 1 tab) (cons (celula 1 2 tab) (cons (celula 0 3 tab) nil)))))
)
)

;; colunas
;; tab - tabuleiro
;; retorna todos os elementos por colunas do tabuleiro
(defun colunas (tab)
(cons (coluna 0 tab) (cons (coluna 1 tab) (cons (coluna 2 tab) (cons (coluna 3 tab) nil))))
)

;; diagonais
;; tab - tabuleiro
;; retorna todos os elementos das diagonais do tabuleiro
(defun diagonais (tab)
(cons (diagonal-1 tab) (cons (diagonal-2 tab) nil))
)

;; tabuleiro-n-ocupado
;; r - row; c - coluna; t - tabuleiro
;; retorna nil se r inferior a 0 ou c iinferior a 0 ou tab vazia
;; retorna nil  se elemento for 0
;; retorna elemento caso contrario
(defun tabuleiro-n-ocupado (r c tab)
(cond
((null tab) nil)
(t (listp (celula r c tab)))
)
)

;; remove-peca
;; pred - função confição; p - peca; l - lista de pecas
(defun remove-peca (pred p l)
(cond
((or (null l) (null p)) nil)
((funcall pred p (car l)) (remove-peca pred p (cdr l)))
(t (cons (car l) (remove-peca pred p (cdr l))))
)
)

;; filtra
;; pred - lambda; l - lista
(defun filtra(pred l)
(cond ((null l) nil)
((funcall pred (car l)) (filtra pred (cdr l)))
(t (cons (car l) (filtra pred (cdr l))))
)
)

;; coloca-peca-no-tabuleiro
;; r - linha; c - coluna; p - peca; tab - tabuleiro
;; retorna nil se p e vazia ou t e vazia ou r < 0 e/ou c < 0 ou tabuleiro com peca
;; retorna t - coloca peca no tabuleiro
(defun coloca-peca-no-tabuleiro (r c p tab)
(cond
((listp (celula r c tab)) nil)
(t 
(progn 
(setf (nth 1 (tabuleiro-e-pecas)) (remove-peca #'(lambda (p x) (equal p x)) p (reserva (tabuleiro-e-pecas)))
)
(setf (nth r (nth c tab)) p) 
'T
)
)
)
)

;; tem-atributo-igual
;; p - peca 1
;; p2 - peca 2
(defun tem-atributo-igual (p p2)
(cond
((or (null p) (null p2)) nil)
((not (equal (car p) (car p2))) (tem-atributo-igual (cdr p) (cdr p2)))
(t T)
)
)

;; conta-peca
;; l - lista
;; retorna o número de elementos com pelo menos
;; um atributo igual
(defun conta-peca (l)
(cond 
((null l) 0)
((and (not (null (car l))) (null (cadr l)) 1))
((null (cadr l)) 0)
((tem-atributo-igual (car l) (cadr l)) (1+ (conta-peca (cdr l))))
(t 0)
)
)

;; conta-pecas-tabuleiro
;; tab - tabuleiro
;; retorna lista com contagem de pecas com pelo menos 1 attributo igual
;; limitações: tabuleiro 4x4
(defun conta-pecas-tabuleiro (tab)
(cond 
((null tab) (cons 0 nil))
(t 
(append (mapcar #'conta-pecas (mapcar #'(lambda (l) (funcall #'filtra #'(lambda (x) (equal 0 x)) l)) tab)) 
(append (mapcar #'conta-pecas (mapcar #'(lambda (l) (funcall #'filtra #'(lambda (x) (equal 0 x)) l)) (colunas tab))) 
(mapcar #'conta-pecas (mapcar #'(lambda (l) (funcall #'filtra #'(lambda (x) (equal 0 x)) l)) (diagonais tab)))))
)
)
)

;; px
;; l - lista com a contagem de pecas alinhadas com pelo menos um atributo em comum
;; retorna o valor maximo
(defun px (l)
(cond 
((null l) 0)
(t (max (car l) (px (cdr l))))
)
)