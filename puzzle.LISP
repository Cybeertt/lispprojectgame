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

;; tabuleiro
;; retorna lista de 4 linhas com 4 elementos de valor 0
(defun tabuleiro ()
'(
(0 0 0 0)
(0 0 0 0)
(0 0 0 0)
(0 0 0 0)
)
)

;; pecas
;; retorna lista com 16 pecas com 4 carateristicas
(defun pecas() 
'(
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

;; extrai-n
;; i - indice; l - lista de pecas
;; retorna nil se i < 0 ou l vazio
;; retorna elemento caso contrario
(defun extrai-n (i l)
(cond
((< i 0) nil) ; i superior ou igual a 0
((null l) nil) ; l vazia
((= i 0) (car l)) ; retorna valor esperado
(t (extrai-n (1- i) (cdr l))) ; recursividade para achar o indice
)
)

;; tabuleiro-n-ocupado
;; r - row; c - coluna; t - tabuleiro
;; retorna nil se r inferior a 0 ou c iinferior a 0 ou tab vazia
;; retorna nil  se elemento for 0
;; retorna elemento caso contrario
(defun tabuleiro-n-ocupado (r c tab); redundante?
;; verificar melhor retorno pois se der nil mas for por validacao
;; pode dar bronca no final
(cond
((null tab) nil); tab vazia
;(() nil); row ou coluna falha -> verificacao antes desta funcao
;((or (> r -1) (> c -1)) nil) ; r ou c inferior a 0
(t (listp (extrai-n c (extrai-n r tab))))
)
)

;; coloca-peca-no-tabuleiro
;; r - linha; c - coluna; p - peca; tab - tabuleiro
;; retorna nil se p e vazia ou t e vazia ou r < 0 e/ou c < 0 ou tabuleiro com peca
;; retorna t - coloca peca no tabuleiro
(defun coloca-peca-no-tabuleiro (r c p tab)
(cond
;((null (x-and-y-positivo r c)) nil) ; r ou c inferior a 0 
;((null (listas-vazias p tab)) nil) ; p ou tab vazia
((listp (extrai-n c (extrai-n r tab))) nil)
(t (setf (nth r (nth c tab)) p))
)
)
