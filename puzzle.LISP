;; puzzle

;;;
;;; PROJETO fase 1
;;;

(defpackage #:operate
  (:use #:cl)
  (:export :tabuleiro-e-pecas 
   :tabuleiro :reserva :linha
   :coluna :celula :diagonal-1 
   :diagonal-2 :tabuleiro-n-ocupado
   :coloca-peca-no-tabuleiro
   :tem-atributo-igual :conta-pecas-tabuleiro
   :conta-pecas :px :tabuleiro-cheio :soma-lista
   :extrai-n :remove-peca :filtra 
   :mostra-tabuleiro :mostra-linha :ler-tabuleiro 
   :ler-algoritmo-procura :ler-profundidade
   :consola :nova-jogada :seleciona-peca
))

(in-package :operate)

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
;((listp (extrai-n c (extrai-n r tab))) nil)
((listp (celula r c (tabuleiro tab))) nil)
(t 
(progn
(setf (nth 1 tab) (remove-peca #'(lambda (p x) (equal p x)) p (reserva tab)))
(setf (nth r (nth c tab)) p)
p
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

;; conta-pecas
;; l - lista
;; retorna o número de elementos com pelo menos
;; um atributo igual
(defun conta-pecas (l)
(cond 
((null l) 0)
((and (not (null (car l))) (null (cadr l)) 1))
((null (cadr l)) 0)
((tem-atributo-igual (car l) (cadr l)) (1+ (conta-pecas (cdr l))))
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

(defun tabuleiro-cheio(tab)
   (null tab)  
)

(defun soma-lista(lista)
  (cond
   ((null lista) 0)
   ( T (+(car lista) (soma-lista(cdr lista))))
  )
)

;; mostra-tabuleiro
;; tab - tabuleiro
;; retorna string com o estado atual do tabuleiro, formatada como tabela
(defun mostra-tabuleiro (tab)
(let ((seperator "_________________________________________________________________________________________________________________________"))
(format nil "~%TABULEIRO~%~A~%~A~%~A~%~A~%~A~%~A~%~%" 
seperator (mostra-linha 0 tab) (mostra-linha 1 tab) 
(mostra-linha 2 tab) (mostra-linha 3 tab) seperator)
)
)

;; mostra-linha
;; i - indice; l - lista
;; retorna uma lista formatada com separadores
(defun mostra-linha (i l)
(let* ((li (linha i l)) (rows "| ~A | ~A | ~A | ~A |"))
(format nil rows (extrai-n 0 li) (extrai-n 1 li) 
(extrai-n 2 li) (extrai-n 3 li))
)
)

(defun get-problems (file)
  (with-open-file (s file)
    (let ((problems nil))
      (do ((prob (read s) (read s nil 'eof))) ((eq prob 'eof) problems)
        (setq problems (cons prob problems))))))

(defun ler-ficheiro ()
(progn
(format t "Qual o ficheiro com problemas a usar?~%")

(let ((ficheiro (read)))
(cond
((null ficheiro) "problemas.dat")
(t ficheiro)
)
)
)
)

;; ler-tabuleiro
;; referencia: laboratorio 6
;; lê o valor inserido correspondente ao tabuleiro 
;; e retorna-o
;; caso o valor seja diferente do esperado, repete
(defun ler-tabuleiro (filename)
(progn
(format t "Selecione o tabuleiro a usar~%")
(format t "1 - Tabuleiro A~%")
(format t "2 - Tabuleiro B~%")
(format t "3 - Tabuleiro C~%")
(format t "4 - Tabuleiro D~%")
(format t "5 - Tabuleiro E~%")
(format t "6 - Tabuleiro F~%")
(format t "7 - Tabuleiro Vazio~%")
(format t "8 - Tabuleiro Teste~%")

(let* 
      ((tabuleiros (get-problems filename))
       (escolha (read)))
   
(cond 

((and (> escolha 0) (< escolha 9))
 (let ((tabuleiro (nth (1- escolha) tabuleiros)))
   (cond
    ((null tabuleiro) (format t "Ainda nao existe tabuleiro~%~%") (ler-tabuleiro filename))
    (t tabuleiro)
)))
(t (format t "Escolha invalida~%~%") (ler-tabuleiro filename)))
)
))

;; ler-algoritmo-procura
;; referencia: laboratorio 6
(defun ler-algoritmo-procura ()
(progn
(format t "Selecione o algoritmo de procura a usar~%")
(format t "1 - Procura na largura~%")
(format t "2 - Procura na profundidade~%")
(format t "3 - A*~%")

(let ((escolha (read)))
(cond
((= escolha 1) 'bfs)
((= escolha 2) 'dfs)
((= escolha 3) 'a-star)
(t (format t "Escolha invalida~%~%") (ler-algoritmo-procura))
)
)
)
)

;; ler-profundidade
;; referencia: laboratorio 6
(defun ler-profundidade ()
(progn
(format t "Insira a profundidade limite~%")
(let ((escolha (read)))
(cond
((and (numberp escolha) (and (> escolha -1) (< escolha 1000))) escolha)
(t (format t "Valor invalido~%~%") (ler-profundidade))
)
)
)
)

;; consola
;; referencia: laboratorio 6
(defun consola ()
(let* ((filename (ler-ficheiro))
       (problema (ler-tabuleiro filename))
(procura (ler-algoritmo-procura))
(profundidade (cond ((eql procura 'dfs) (ler-profundidade)) (t 999)
)))
;(princ tabuleiro)
(progn
(format t "~A" (mostra-tabuleiro (tabuleiro problema)))
(cond
((equal procura 'bfs) 'bfs) ; breath-first search
((equal procura 'dfs) 'dfs) ; depth-first search
(t 'a-star) ; a-star
)
)
))