#|
IA PROJECTO FASE 1 RECURSO 2020/21

DOCENTE
Joaquim Filipe

ESTUDANTES
150221081 - Daniela Sineiro

FICHEIRO
puzzle.lisp

SOBRE


Este ficheiro contem algumas funcoes retiradas da resolucao dos guias de laboratorios da UC IA.
|#

#|PECOTE :puzzle
<breve descricao>
|#

#|
Funcoes auxiliares para teste
|#

#|NOVA-COORDENADA
Retorna um valor de coordenada entre 0 e o tamanho da lista
tamanho-linha - Tamanho da lista
|#
(defun nova-coordenada (l)
(random (length l))
)

#|TESTES

; gera coordenada linha
CL-USER> (nova-coordenada (linha 0 (tabuleiro (problema))))
3

; gera coordenada coluna
CL-USER> (nova-coordenada (coluna 0 (tabuleiro (problema))))
0

LIMITACOES
Apenas aceita uma lista com pelo menos um elemento
|#

#|SELECIONA-PECA
Retorna uma peca da reserva
reserva - Reserva
|#
(defun seleciona-peca (reserva)
(nth (random (length reserva)) reserva)
)

#|TESTES

; seleciona uma peca da reserva
CL-USER> (seleciona-peca (reserva (problema)))
(BRANCA QUADRADA BAIXA OCA)

LIMITACOES
Apenas aceita uma lista com pelo menos um elemento
|#


#|PROBELMA
Retorna uma lista com duas sublistas 
uma com 4 sublistas de 4 elementos de valor zero
e outra com 16 sublistas de 4 elementos especiais
|#
(defun problema ()
'(
(
((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) 
(0 0 0 (BRANCA REDONDA BAIXA OCA)) 
((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) 
(0 (PRETA QUADRADA BAIXA CHEIA) 0 0)
)(
(BRANCA QUADRADA ALTA CHEIA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) 
(BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA)
)
)) 

#|'(
(
((branca quadrada baixa cheia) 0 (preta redonda alta cheia) (preta quadrada baixa oca))
(0 0 0 (branca redonda baixa oca)) 
((branca redonda alta cheia) 0 (preta redonda alta oca) 0) 
(0 (preta quadrada baixa cheia) 0 0)
)
(
(branca quadrada alta cheia)
 (branca quadrada alta oca)
 (branca quadrada baixa oca)
 (preta quadrada alta cheia)
 (preta quadrada alta oca)
 (branca redonda alta oca)
 (branca redonda baixa cheia)
 (preta redonda baixa cheia)
 (preta redonda baixa oca)
)
))|#
#|(
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
))|#


#|PUZZLE
|#

#|TABULEIRO
Retorna tabuleiro
problema - Tabuleiro com reserva
|#
(defun tabuleiro (problema)
(car problema)
)

#|TESTES

; primeiro elemento de um problema vazio
CL-USER> (tabuleiro (problema))
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; primeiro elemento de uma lista vazia
CL-USER> (tabuleiro nil)
NIL
|#

#|RESERVA
Retorna pecas de reserva
problema - Tabuleiro com reserva
|#
(defun reserva (problema)
(cadr problema)
)

#|TESTES

; segundo elemento do problema
CL-USER> (reserva (problema))
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))

; segundo elemento do problema
CL-USER> (reserva nil)
NIL
|#

#|LINHA
Retorna linha
l - Linha
tabuleiro - Tabuleiro
|#
(defun linha (l tabuleiro)
(nth l tabuleiro)
)

#|TESTES

; primeira linha do tabuleiro
CL-USER> (linha 0 (tabuleiro (problema)))
(0 0 0 0)

; primeira linha do tabuleiro
CL-USER> (linha 0 nil)
NIL

LIMITACOES
-1 > l < tamanho da linha
|#

#|COLUNA
Retorna coluna
c - Coluna
tabuleiro - Tabuleiro
|#
(defun coluna (c tabuleiro)
; e - Elemento do tabuleiro
(mapcar #'(lambda (e) (nth c e)) tabuleiro)
)

#|TESTES

; primeira coluna do tabuleiro
CL-USER (coluna 0 (tabuleiro (problema)))
(0 0 0 0)

; primeira coluna do tabuleiro
CL-USER> (coluna 0 nil)
NIL

LIMITACOES
-1 > c < tamanho da coluna
|#

#|CELULA
Retorna celula
l - Linha
c - Coluna
tabuleiro - Tabuleiro
|#
(defun celula (l c tabuleiro)
(nth l (nth c tabuleiro))
)

#|TESTES

; primeiro elemento do tabuleiro
CL-USER> (celula 0 0 (tabuleiro (problema)))
0

; primeiro elemento do tabuleiro
CL-USER> (celula 0 0 nil)
NIL

LIMITACOES
-1 > l < tamanho da linha
-1 > c < tamanho da coluna
|#

#|
CRIA-LISTA-INDICE
Retorna uma lista com inteiros de 0 a i-1
i - Indice maximo
|#
(defun cria-lista-indice (i)
(cond 
((< i 1) nil)
(t (cons (1- i) (cria-lista-indice (1- i))))
)
)

#|TESTES

; cria lista com indice ate tamanho 4
CL-USER> (cria-lista-indice 4)
(3 2 1 0)

; cria lista com indice ate tamanho -1
CL-USER> (cria-lista-indice -1)
NIL

LIMITACOES
1 > i > indice maximo
|#

#|DIAGONAL-ESQUERDA
Retorna diagonal da esquerda para a direita
tabuleiro - Tabuleiro
|#
(defun diagonal-esquerda (tabuleiro)
; e - Elemento da lista
(mapcar #'(lambda (e) (celula e e tabuleiro)) (reverse (cria-lista-indice (length tabuleiro))))
)

#|TESTES

; diagonal da esquerda no tabuleiro
CL-USER> (diagonal-esquerda (tabuleiro (problema)))
(0 0 0 0)

; diagonal da esquerda no tabuleiro
CL-USER> (diagonal-esquerda nil)
NIL
|#

#|DIAGONAL-DIREITA
Retorna a diagonal da direita para a esquerda
tabuleiro - Tabuleiro
|#
(defun diagonal-direita (tabuleiro)
; i - indice
(let ((i (1- (length tabuleiro))))
; e - Elemento da lista
(mapcar #'(lambda (e) (celula e (- i e) tabuleiro)) (reverse (cria-lista-indice (length tabuleiro))))
)
)

#|TESTES

; diagonal da direita no tabuleiro
CL-USER> (diagonal-direita (tabuleiro (problema)))
(0 0 0 0)

; diagonal da direita no tabuleiro
CL-USER> (diagonal-direita nil)
NIL
|#

#|CASA-VAZIAP
Retorna T se o valor for numero
Retorna NIL se o valor for lista
tabuleiro
|#
(defun casa-vaziap (l c tabuleiro)
(numberp (celula l c tabuleiro))
)

#|TESTES

; verifica se a linha 0 coluna 0 do tabuleiro esta vazia
CL-USER> (casa-vaziap 0 0 (tabuleiro (problema)))
T

; verifica se a linha 0 coluna 0 do tabuleiro esta vazia
CL-USER> (casa-vaziap 0 0 (tabuleiro (problema)))
NIL

; verifica se a linha 0 coluna 0 do tabuleiro esta vazia
CL-USER> (casa-vaziap 0 0 nil)
NIL

LIMITACOES
-1 > l > tamanho da linha
-1 > c > tamanho da coluna
|#

#|REMOVE-PECA
Remove peca da reserva e devolve uma nova lista sem a peca
p - Peca
reserva - Reserva
|#
(defun remove-peca (p reserva)
(let ((predp #'(lambda (p e) (equal p e))))
(cond
((or (null reserva) (null p)) NIL)
((funcall predp p (car reserva)) (remove-peca p (cdr reserva)))
(t (cons (car reserva) (remove-peca p (cdr reserva))))
)
)
)

#|TESTES

; remove primeira peca da reserva
CL-USER> (remove-peca (nth 0 (reserva (problema))) (reserva (problema)))
((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))

; remove primeira peca da reserva
CL-USER> (remove-peca (nth 0 (reserva (problema))) nil)
NIL

; remove peca NIL da reserva
CL-USER> (remove-peca nil (reserva (problema)))
NIL
|#

#|FILTRA
Retorna uma lista sem os elementos que coincidem que o criterio da funcao predp
predp - Funcao lambda boleano
p - Peca
reserva - Reserva
|#
(defun filtra (predp p reserva)
(cond 
((null reserva) nil)
((funcall predp p (car reserva)) (filtra predp p (cdr reserva)))
(t (cons (car reserva) (filtra predp p (cdr reserva))))
)
)

#|TESTES

; filtra primeira peca da reserva
CL-USER> (filtra #'(lambda (p x) (equal p x)) (nth 0 (reserva (problema))) (reserva (problema)))
((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))

; filtra primeira peca da reserva
CL-USER> (filtra #'(lambda (p x) (equal p x)) (nth 0 (reserva (problema))) nil)
NIL

; filtra peca NIL da reserva
CL-USER> (filtra #'(lambda (p x) (equal p x)) nil (reserva (problema)))
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))

LIMITACOES
Depende do parametro predp para realizar a filtracao de elementos da lista
|#

#|SUBSTITUIR-POSICAO
Retorna a peca substituida quando operacao e realizada com sucesso, caso contrario retorna NIL
i - Indice
p - Peca
linha-tabuleiro - Linha do tabuleiro
|#
(defun substituir-posicao (i p linha-tabuleiro)
(cond
((or (null p) (null linha-tabuleiro)) NIL)
(t (setf (nth i linha-tabuleiro) p))
)
)

#|TESTES

; substituir posicao 0 da linha 0 do tabuleiro com a primeira peca da reserva
CL-USER> (substituir-posicao 0 (nth 0 (reserva (problema))) (linha 0 (tabuleiro (problema))))
(BRANCA REDONDA ALTA OCA)

; substituir posicao 0 da linha 0 do tabuleiro com a primeira peca da reserva
CL-USER> (substituir-posicao 0 nil (linha 0 (tabuleiro (problema))))
NIL

; substituir posicao 0 da linha 0 do tabuleiro com a peca NIL da reserva
CL-USER> (substituir-posicao 0 (nth 0 (reserva (problema))) nil)
NIL

LIMITACOES
Ignora a ocupacao do tabuleiro na coordenada parametrizada
|#

#|CONTA-PECAS-ATRIBUTO-TABULEIRO
Retorna o numero maximo de pecas em todo o tabuleiro com pelo menos um
atributo em comum
tabuleiro - Tabuleiro
|#
(defun conta-pecas-atributo-tabuleiro (tabuleiro)
(cond
((null tabuleiro) 0)
(t
(let (
(l0 (remove-valor #'(lambda (x) (equal x 0)) (linha 0 tabuleiro)))
(l1 (remove-valor #'(lambda (x) (equal x 0)) (linha 1 tabuleiro)))
(l2 (remove-valor #'(lambda (x) (equal x 0)) (linha 2 tabuleiro)))
(l3 (remove-valor #'(lambda (x) (equal x 0)) (linha 3 tabuleiro)))
(c0 (remove-valor #'(lambda (x) (equal x 0)) (coluna 0 tabuleiro)))
(c1 (remove-valor #'(lambda (x) (equal x 0)) (coluna 1 tabuleiro)))
(c2 (remove-valor #'(lambda (x) (equal x 0)) (coluna 2 tabuleiro)))
(c3 (remove-valor #'(lambda (x) (equal x 0)) (coluna 3 tabuleiro)))
(de (remove-valor #'(lambda (x) (equal x 0)) (diagonal-esquerda tabuleiro)))
(dd (remove-valor #'(lambda (x) (equal x 0)) (diagonal-direita tabuleiro)))
)

(numero-maximo 
(append 
;linhas 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot l0))) l0)

(append 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot l1))) l1)

(append 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot l2))) l2)

(append  
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot l3))) l3)

(append 
;colunas
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot c0))) c0)

(append 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot c1))) c1)

(append 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot c2))) c2)

(append 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot c3))) c3)

(append 
; diagonal esquerda
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot de))) de)

(append 
; diagonal direita 
(mapcar #'(lambda (pivot) 
(conta-pecas-atributo (conta-atributos-l pivot dd))) dd)
nil))))))))))
)
)
)
)
)

#|

Usando o tabuleiro com problema
(2 1 2 1) - linhas
(2 1 2 2) - colunas
(1 1) - diagonais

; conta o numero maximo de pecas no tabuleiro
CL-USER> (conta-pecas-atributo-tabuleiro (tabuleiro (problema)))
3 ;(2 2 2 1 2 2 2 1 2 2 1 2 2 3 3 3 1 1 1)

; conta o numero maximo de pecas no tabuleiro vazio
CL-USER> (conta-pecas-atributo-tabuleiro (tabuleiro (problema)))
0

; conta o numero maximo de pecas no tabuleiro nil
CL-USER> (conta-pecas-atributo-tabuleiro nil)
0

LIMITES
Apenas aceita tabuleiro 4x4 e cada peca tem de ter 4 atributos
|#

#|CONTA-ATRIBUTOS-L
Retorna a contagem de atributos entre uma peca pivot e uma linha de tabuleiro com pecas
pivot - Peca
linha-tabuleiro - Linha de tabuleiro
|#
(defun conta-atributos-l (pivot linha-tabuleiro)
(cond
((or (null linha-tabuleiro) (null pivot)) (list 0))
(t
(mapcar #'(lambda (e) 
(mapcar #'(lambda (x) 
(cond 
((equal x (car pivot)) 1)
((equal x (cadr pivot)) 1)
((equal x (caddr pivot)) 1)
((equal x (cadddr pivot)) 1)
(t 0)
)) e)
) linha-tabuleiro)
)
)
)
;pivot: '(BRANCA QUADRADA BAIXA CHEIA)
;linha-tabuleiro: '((BRANCA QUADRADA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) 

#|TESTES

; conta o numero de pecas com atributos de uma linha de um tabuleiro vazio
CL-USER> (conta-atributos-l '(0 0 0 0))
NIL

; conta o numero de pecas com atributos de uma linha de um tabuleiro vazio
CL-USER> (conta-atributos-l '(0 0 0 0))
NIL

; conta o numero de pecas com atributos na linha 0 do tabuleiro
CL-USER> (conta-atributos-l (linha 0 (tabuleiro (problema))))
((1 1 1 1) (0 0 0 1) (0 1 1 0))

LIMITES
Apenas aceita uma peca pivot com 4 atributos
|#

#|CONTA-PECAS-ATRIBUTO
Retorna a soma das pecas com atributos em comum de uma lista de sublistas com 4 
elementos de valores 0 e 1
contagem - Lista com sublistas de 4 elementos com valores 0 e 1
|#
(defun conta-pecas-atributo (contagem)
(cond
((null contagem) 0)
(t (numero-maximo
(cons (reduce #'+ (mapcar #'car contagem)) 
(cons (reduce #'+ (mapcar #'cadr contagem)) 
(cons (reduce #'+ (mapcar #'caddr contagem)) 
(cons (reduce #'+ (mapcar #'cadddr contagem)) nil)))))
)
)
)

#|TESTES

; conta o maximo numero de pecas na linha 0 do tabuleiro
CL-USER> (conta-pecas-atributo (conta-atributos-l (linha 0 (tabuleiro (problema)))))
2

; conta o maximo numero de pecas de uma linha de um tabuleiro vazio
CL-USER> (conta-pecas-atributo (conta-atributos-l '(0 0 0 0)))
0

LIMITACOES
Apenas aceita sublistas de 4 elementos com os valores 0 ou 1
|#

#|NUMERO-MAXIMO
Retorna o valor maior da lista
l - Lista de numeros
|#
(defun numero-maximo (l)
(cond
((null l) 0)
(t (reduce 'max l))
)
)

#|TESTES

; calcula valor maximo de (list 0 0 0 0)
CL-USER> (numero-maximo '(0 0 0 0))
0

; calcula valor maximo de lista vazia
CL-USER> (numero-maximo nil)
0

; calcula valor maximo de (list 4 0 6 1)
CL-USER> (numero-maximo '(4 0 6 1))
6

LIMITACOES
Listas simples
|#

#|REMOVE-VALOR
Retorna a lista com todos os valores que retornam NIL na condicao do perdicado
predp - Funcao booleana
l - Lista
|#
(defun remove-valor (predp l)
(cond
((null l) NIL)
((funcall predp (car l)) (remove-valor predp (cdr l)))
(t (cons (car l) (remove-valor predp (cdr l))))
)
)

#|

; remove o valor 0 da linha 0 do tabuleiro vazio
; predp -> (lambda (x) (equal x 0))
CL-USER> (remove-valor #'(lambda (x) (equal x 0)) (linha 0 (tabuleiro (problema))))
NIL

; remove o valor 0 da linha 0 do tabuleiro nao vazio
; linha 0 -> ((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA))
; predp -> (lambda (x) (equal x 0))
CL-USER> (remove-valor #'(lambda (x) (equal x 0)) (linha 0 (tabuleiro (problema))))
((BRANCA QUADRADA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA))

; remove o valor 0 da lista vazia
; predp -> (lambda (x) (equal x 0))
CL-USER> (remove-valor #'(lambda (x) (equal x 0)) nil)


LIMITACOES
Lista simples
|#

#|COLUNAS
Retorna uma lista com todas as colunas possiveis de um tabuleiro
tabuleiro - Tabuleiro
|#
(defun colunas (tabuleiro)
(cons (coluna 0 tabuleiro) (cons (coluna 1 tabuleiro) (cons (coluna 2 tabuleiro) (cons (coluna 3 tabuleiro) nil))))
)
#|TESTES

; colunas de um tabuleiro vazio
CL-USER> (colunas (tabuleiro (problema)))
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; colunas de uma lista vazia
CL-USER> (colunas nil)
(NIL NIL NIL NIL)

LIMITACOES
Apenas aceita um tabuleiro 4x4
|#

#|DIAGONAIS
Retorna uma lista com as duas diagonais possiveis de um tabuleiro
tabuleiro - Tabuleiro
|#
(defun diagonais (tabuleiro)
(cons (diagonal-direita tabuleiro) (cons (diagonal-esquerda tabuleiro) nil))
)

#|TESTES

; diagonais de um tabuleiro vazio
CL-USER> (diagonais (tabuleiro (problema)))
((0 0 0 0) (0 0 0 0))

; diagonais com lista vazia
CL-USER> (diagonais nil)
(NIL NIL)

LIMITACOES
Apenas aceita um tabuleiro 4x4, cujo as diagonais sao duas
|#


#|JOGADA
Remove peca da reserva e coloca-a nas coordenadas do tabuleiro, verificando se nao se encontra ocupado. Se a coordenada do tabuleiro encontra-se ocupada retorna NIL, caso contrario retorna o problema alterado. Se a peca for NIL, ignora a operacao e retorna NIL.
l - Linha
c - Coluna
p - Peca
problema - Problema
|#
(defun jogada (l c p problema)
(cond
((not (casa-vaziap l c (tabuleiro problema))) NIL)
(t 
(let* ((novo-problema problema) (novo-tabuleiro (tabuleiro novo-problema)) (nova-reserva (reserva novo-problema)))
(substituir-posicao c p (linha l novo-tabuleiro))
(setf (nth 1 novo-problema) (remove-peca p nova-reserva))
novo-problema
)
)
)
)

#|TESTES

; coloca na linha 0 coluna 0 do tabuleiro, a primeira peca
CL-USER> (operador 0 0 (nth 0 (reserva (problema))) (problema))


; coloca na linha 0 coluna 0 ocupada do tabuleiro, a primeira peca
CL-USER> (operador 0 0 (nth 0 (reserva (problema))) (problema))
NIL

; coloca na linha 0 coluna 0 do tabuleiro, a primeira peca
CL-USER> (operador 0 0 (nth 0 (reserva (problema))) nil)
NIL

; coloca na linha 0 coluna 0 do tabuleiro, a peca NIL
CL-USER> (operador 0 0 nil (problema))
NIL
|#

#|NOVA-JOGADA
Retorna NIL se movimento invalido, caso contrario retorna um problema novo
com a peca colocada no tabuleiro e removida da reserva
problema - Problema
|#
(defun nova-jogada (problema)
(jogada 
(nova-coordenada (linha 0 (tabuleiro problema))) 
(nova-coordenada (coluna 0 (tabuleiro problema))) 
(seleciona-peca (reserva problema)) 
problema)
)

#|

; coloca peca na coordenada do tabuleiro ocupada
CL-USER> (nova-jogada (problema))
NIL

; coloca peca na coordenada do tabuleiro nao ocupada
CL-USER> (nova-jogada (problema))
; retorna um novo problema com a peca colocada

LIMITACOES
Apenas aceita uma lista com sublistas, uma com um tabuleiro 4x4 e outra reserva
|#

(defun no-solucaop (no)
  
  (COND 
   ((null no) nil)
   ((or (reserva-conteudo no)
    (= 4 (conta-pecas-atributo-tabuleiro (tabuleiro-conteudo no))))
         T) 
   (T NIL)
   )
  ;(princ (car no))
)