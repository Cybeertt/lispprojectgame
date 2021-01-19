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

#|PACOTE :puzzle
<breve descricao>
|#

#|
Funcoes auxiliares para teste
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

#|FILA
Retorna fila
l - Fila
tabuleiro - Tabuleiro
|#
(defun fila (l tabuleiro)
  (nth l tabuleiro)
)

#|TESTES

; primeira fila do tabuleiro
CL-USER> (fila 0 (tabuleiro (problema)))
(0 0 0 0)

; primeira fila do tabuleiro
CL-USER> (fila 0 nil)
NIL

LIMITACOES
-1 > l < tamanho da fila
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
l - Fila
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
-1 > l < tamanho da fila
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
;
; verifica se a fila 0 coluna 0 do tabuleiro esta vazia
CL-USER> (casa-vaziap 0 0 (tabuleiro (problema)))
T

; verifica se a fila 0 coluna 0 do tabuleiro esta vazia
CL-USER> (casa-vaziap 0 0 (tabuleiro (problema)))
NIL

; verifica se a fila 0 coluna 0 do tabuleiro esta vazia
CL-USER> (casa-vaziap 0 0 nil)
NIL

LIMITACOES
-1 > l > tamanho da fila
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

#|SUBSTITUIR-POSICAO
Retorna a peca substituida quando operacao e realizada com sucesso, caso contrario retorna NIL
i - Indice
p - Peca
fila-tabuleiro - Fila do tabuleiro
|#
(defun substituir-posicao (i p fila-tabuleiro)
  (cond
   ((or (null p) (null fila-tabuleiro)) NIL)
   (t (setf (nth i fila-tabuleiro) p))
   )
)

#|TESTES

; substituir posicao 0 da fila 0 do tabuleiro com a primeira peca da reserva
CL-USER> (substituir-posicao 0 (nth 0 (reserva (problema))) (fila 0 (tabuleiro (problema))))
(BRANCA REDONDA ALTA OCA)

; substituir posicao 0 da fila 0 do tabuleiro com a primeira peca da reserva
CL-USER> (substituir-posicao 0 nil (fila 0 (tabuleiro (problema))))
NIL

; substituir posicao 0 da fila 0 do tabuleiro com a peca NIL da reserva
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

#|COLUNAS
Retorna uma lista com todas as colunas possiveis de um tabuleiro
tabuleiro - Tabuleiro
|#
(defun colunas (tabuleiro)
  (list (coluna 0 tabuleiro)  (coluna 1 tabuleiro) (coluna 2 tabuleiro) (coluna 3 tabuleiro)))
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
(list (diagonal-direita tabuleiro) (diagonal-esquerda tabuleiro)))


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

;;NO-SOLUCAOP
(defun quatro-linha-p (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((linhas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (linhas-cheias (remove-if-not #'(lambda (z) 
                                             (= 4 (list-length z)))
                                         (mapcar #'(lambda (x) 
                                                     (remove-if #'(lambda (y) (eq y 0)) x))
                                                 linhas))))
      (cond
       ((null linhas-cheias) nil)
       (t (reduce #'(lambda (&optional x y) (or x y)) (mapcar #'sao-iguaisp linhas-cheias))))))))


(defun max-p-a (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((linhas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (linhas-pecas (remove-if #'(lambda (z) 
                                             (null z))
                                    (mapcar #'(lambda (x) 
                                                  (remove-if #'(lambda (y) (eq y 0)) x))
                                 linhas))))
      (cond
       ((null linhas-pecas) 0)
       (t (reduce #'max (mapcar #'max (remove nil (mapcar #'(lambda (em-linha len) (and em-linha len))
                                (mapcar #'sao-iguaisp linhas-pecas)
                                (mapcar #'length linhas-pecas)))))))))))


(defun sao-iguaisp (linha)
  (labels ((eq-list (x &rest y) 
             (cond 
              ((null y) T) 
              ((eq x (car y)) (apply #'eq-list x (cdr y)))
              (t nil))))
    (cond
     ((null linha) nil)
     (t (reduce #'(lambda (&optional a b) (or a b)) (apply #'mapcar #'eq-list linha))))))


#|JOGADA
Remove peca da reserva e coloca-a nas coordenadas do tabuleiro, verificando se nao se encontra ocupado. Se a coordenada do tabuleiro encontra-se ocupada retorna NIL, caso contrario retorna o problema alterado. Se a peca for NIL, ignora a operacao e retorna NIL.
l - Fila
c - Coluna
p - Peca
problema - Problema
|#
(defun jogada (l c p problema)
  (cond
   ;((null (reserva problema)) nil)
   ((not (casa-vaziap l c (tabuleiro problema))) nil)
   (t 
    (let ((novo-tabuleiro (copy-tree (tabuleiro problema))))
      (substituir-posicao c p (fila l novo-tabuleiro))
      (list novo-tabuleiro (remove-peca p (reserva problema)))
    )
   ))
  
)

(defun casas-vazias (tab &optional (l 0))
  (labels ((coordenadas (fila l &optional (c 0))
    (cond
      ((null fila) nil)
      ((eq (car fila) 0)
        (cons (list l c) (coordenadas (cdr fila) l (1+ c))))
      (t (coordenadas (cdr fila) l (1+ c))))))
    (cond 
      ((null tab) nil)
        (t (append (coordenadas (car tab) l) 
        (casas-vazias (cdr tab) (1+ l)))))))

#|TESTES

; coloca na fila 0 coluna 0 do tabuleiro, a primeira peca
CL-USER> (operador 0 0 (nth 0 (reserva (problema))) (problema))


; coloca na fila 0 coluna 0 ocupada do tabuleiro, a primeira peca
CL-USER> (operador 0 0 (nth 0 (reserva (problema))) (problema))
NIL

; coloca na fila 0 coluna 0 do tabuleiro, a primeira peca
CL-USER> (operador 0 0 (nth 0 (reserva (problema))) nil)
NIL

; coloca na fila 0 coluna 0 do tabuleiro, a peca NIL
CL-USER> (operador 0 0 nil (problema))
NIL
|#

(defun no-solucaop (no)
  (if (null no) nil (quatro-linha-p (tabuleiro-conteudo no)))
  
)

(defun heuristic (estado)
  (- 4
     (max-p-a (tabuleiro estado))))