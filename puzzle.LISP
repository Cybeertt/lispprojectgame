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

;; coloca-peca-no-tabuleiro
;; r - linha; c - coluna; p - peca; tab - tabuleiro
;; retorna nil se p e vazia ou t e vazia ou r < 0 e/ou c < 0 ou tabuleiro com peca
;; retorna t - coloca peca no tabuleiro
(defun coloca-peca-no-tabuleiro (r c p tab)
(cond
((listp (celula r c tab)) nil)
(t (setf (nth r (nth c tab)) p))
)
)

;; comparar atributos recursivo
;; p - peca 1
;; l - peca 2
(defun tem-atributo-igual (p l)
(cond
((or (null p) (null l)) nil)
((not (equal (car p) (car l))) (tem-atributo-igual (cdr p) (cdr l)))
(t T)
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