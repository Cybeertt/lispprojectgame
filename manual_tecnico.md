# IPS ESTS
## Projeto IA 2020/21

### Docente
Joaquim Filipe

### Estudantes
150221081 - Daniela Sineiro

200221149 - Rafael Palma

# Manual Técnico
Neste manual encontram-se explicações sobre o jogo, como o iniciar, a estrutura do projeto, todas as funções utilizadas explicadas e ilustradas com exemplos e observações, e exemplos descritivos de testes com o código fonte por partes ou no global.

## Indice
* [Abstrato](#doc-abstract)
* [Extrutura do Projeto](#doc-extrutura)
* [Documentação de Funções](#doc-func)
  * [Puzzle](#f-puzzle)
    * [Tabuleiro](#f-tabuleiro)
    * [Reserva](#f-reserva)
    * [Fila](#f-fila)
    * [Coluna](#f-coluna)
    * [Celula](#f-celula)
    * [Cria-Lista-Indice](#f-cria-lista-indice)
    * [Diagonal-Esquerda](#f-diagonal-esquerda)
    * [Diagonal-Direita](#f-diagonal-direita)
    * [Casa-Vaziap](#f-casa-vaziap)
    * [Remove-Peca](#f-remove-peca)
    * [Substituir-Posicao](#f-substituir-posicao)
    * [Colunas](#f-colunas)
    * [Diagnonais](#f-diagonais)
    * [Quatro-Fila-P](#f-quatro-fila-p)
    * [Max-A-P](#f-max-a-p)
    * [Sao-Iguaisp](#f-sao-iguaisp)
    * [Jogada](#f-jogada)
    * [Casas-Vazias](#f-casas-vazias)
    * [Coordenadas](#f-coordenadas)
    * [No-Solucaop](#f-no-solucaop)
    * [Heuristic](#f-heuristic)
  * [Procura](#f-procura)
  * [Algorithm](#f-Algoritm)
  * [Projeto](#f-projeto)

## <a name="doc-abstract">Abstrato</a>
Este projeto tem com o intuito de aplicar conhecimentos adquiridos no ambito da cadeira curricular IA e realizar uma análise entre os algoritmos de procura para os diferentes estados do jogo Quatro.

Quatro, é um jogo que contém um tabuleiro 4x4 e 16 peças com quatro carateristicas. Cada carateristica de uma peça utiliza dois valores possíveis, tal como um sistema binário, permitindo fazer combinações de 16 peças. Por norma uma peça tem 14 peças com pelo menos uma carateristica em comum e 1 peça sem qualquer carateristica em comum.

Quatro, é um jogo sequêncial disputado por 2 competidores.
O jogo é realizado num tabuleiro 4x4 e 16 peças com 4 carateristicas.

A cada turno, a peça é sempre escolhida pelo adversário que tem como missão entregar a peça com menos atributos iguais às peças que atualmente se encontram no tabuleiro.

O Quatro finaliza quando um jogador consegue alinhar 4 peças com pelo menos uma carateristica em comum, seja na vertical, horizontal ou diagonal, independentemente da direção.

Nesta versão do manual, o Quatro é apenas disputado por dois competidores humanos que informam as suas jogadas através da consola.

## <a name="doc-estrutura">Estrutura do Projeto</a>
O projeto encontra-se distribuído por 3 ficheiros principais: ***projecto.LISP***, ***puzzle.LISP*** e ***procura.LISP***.

O ficheiro ***projecto.LISP*** contém o código fonte que inicializa o jogo.

O ficheiro ***puzzle.LISP*** contém o código fonte utilizado para criar e modificar o jogo e é definido como pacote **operate**.

O ficheiro ***procura.LISP*** contém todos os algoritmos de procura utilizados no jogo e é definido como pacote **algo**.

Ao abrir o ficheiro ***procura.LISP***, por este ser um pacote, o IDE LispWorks pede sempre para criar o pacote no IDE. Todo este processo é responsabilidade do IDE e é automático.

Em conjunto com os 3 ficheiros acima indicados, também se encontram em anexo os ***manual de utilizador*** e ***problemas.dat***.

O ***manual de utilizador*** apenas contém uma breve explicação sobre o jogo e como o iniciar.

O ***problemas.dat*** contém em formato de lista em Commun Lisp, uma série de tabuleiros com peças em situações diferentes. 

Este ficheiro guarda vários tabuleiros com peças pré-colocadas. Cada tabuleiro será selecionado para continuar o jogo no tabuleiro atual.

## <a name="doc-func">Documentação de Funções</a>

As seguintes funções utilizadas para desenvolver o projeto, contêm o seu corpo, breve descrição, parâmetros e exemplos de chamadas e de resultados esperados.

Excecionalmente, algumas funções contêm breves observações perante o resultado esperado, para melhor ilustrar o seu uso especifico.

### <a nome="f-puzzle">Puzzle</a>
As seguintes funções permitem definir o jogo do Problema do Quatro.

### <a name="f-tabuleiro">Tabuleiro</a>
Retorna uma lista de 4 listas com 4 elementos.

O espaço do tabuleiro é representado por 0, quando a posição encontra-se vazia.

**Parametros**

*l - Lista*

```lisp
; funcao
(defun tabuleiro (l)
 (cond 
  ((null l) nil)
  (t (car l)))
)
```

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (tabuleiro problema)
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

### <a name="f-reserva">Reserva</a>
Retorna uma lista de 16 listas com 4 elementos.

Esta lista contém todas as peças utilizadas no jogo. Cada peça é uma lista com 4 carateristicas da peça.

**Parametros**

*l - Lista*

```lisp
; funcao
(defun reserva(l) 
 (cond 
  ((null l) nil)
  (t (cadr l))
 )
)
```

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (reserva problema)
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))
```

#### <a nome="f-">Fila</a>
Retorna uma lista com elementos que se encontram numa fila.

**Parametros**

*l - Indice de fila*

*tabuleiro - Tabuleiro ou reserva*

```lisp
; funcao
(defun fila (l tabuleiro)
  (nth l tabuleiro)
)
```
Retorna a primeira peça da reserva com 16 peças.

```lisp
; reserva
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (fila 0 reserva))
(BRANCA REDONDA ALTA OCA)
````

Retorna a primeira fila do tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (fila 0 tabuleiro)
(0 0 0 0)
```

#### <a nome="f-">Coluna</a>
Retorna uma lista de elementos que se encontram numa coluna e limita-se a retornar 4 elementos.

Esta função limita-se a ser uma função redundante da função [celula](#f-celula) para aumentar legibilidade do código.

**Parametros**

*c - Indice de coluna*

*tab - Tabuleiro*

```lisp
; funcao
(defun coluna (c tabuleiro)
; e - Elemento do tabuleiro
  (mapcar #'(lambda (e) (nth c e)) tabuleiro)
)
```

Retorna a primeira coluna do tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

;chamada
CL-USER (coluna 0 tabuleiro)
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((0,0) (1,0) (2,0) (3,0))
```

#### <a nome="f-">Celula</a>
Retorna um elementos que se encontram numa fila ou coluna.

**Parametros**

*l - Indice de fila*

*c - Indice de coluna*

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun celula (l c tabuleiro)
  (nth l (nth c tabuleiro))
)
```

Retorna o valor da céluna na coordenada (0,0) do tabuleiro vazio.

```lisp
; tabuleiro

; chamada
CL-USER> (celula 0 0 tabuleiro)
0
```

#### <a nome="f-">Cria-Lista-Indice</a>
Retorna uma lista com todos os indices correspondentes do tamanho máximo da lista parameterizada.

Esta função auxilia na geração de coordenadas para as funções [diagonal-esquerda](#f-diagonal-esquerda) e [diagonal-direita](#f-diagonal-direita).

**Parâmetros**

*i - Tamanho da lista*

```lisp
; funcao
(defun cria-lista-indice (i)
  (cond 
   ((< i 1) nil)
   (t (cons (1- i) (cria-lista-indice (1- i)))))
)
```

Gera lista com indices de 4.

```lisp
; chamada
CL-USER> (cria-lista-indice 4)
(3 2 1 0)
```

Gera uma lista com indices de 0.

```lisp
; chamada
CL-USER> (cria-lista-indice 0)
NIL
```

#### <a nome="f-">Diagonal-Esquerda</a>
Retorna a diagonal esquerda do tabuleiro.

As coordenadas da diagonal esquerda são o conjunto de pares coordenados {(0,0), (1,1), (2, 2), (3,3)}.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun diagonal-esquerda (tabuleiro)
  ; e - Elemento da lista
  (mapcar #'(lambda (e) (celula e e tabuleiro)) (reverse (cria-lista-indice (length tabuleiro))))
)
```

Retorna a diagonal esquerda (0,0) a (3,3) de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
(diagonal-esquerda tabuleiro)
((0 0 0 0) (0 0 0 0))
```

Retorna a diagonal esquerda (0,3) a (3,0) de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
(diagonal-esquerda tabuleiro)
((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0)
```

Retorna a diagonal esquerda (0,0) a (3,3) de um tabuleiro NIL.

```lisp
; chamada
(diagonal-esquerda NIL)
NIL
```

#### <a nome="f-">Diagonal-Direita</a>
Retorna a diagonal direita do tabuleiro.

As coordenadas da diagonal são o conjunto de pares coordenados {(3,0), (2,1), (1, 2), (0,3)}.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun diagonal-direita (tabuleiro)
  ; i - indice
  (let ((i (1- (length tabuleiro))))
    ; e - Elemento da lista
    (mapcar #'(lambda (e) (celula e (- i e) tabuleiro)) (reverse (cria-lista-indice (length tabuleiro)))))
)
```

Retorna a diagonal direita (0,3) a (3,0) de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
(diagonal-direita tabuleiro)
((0 0 0 0) (0 0 0 0))
```

Retorna a diagonal direita (0,3) a (3,0) de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
(diagonal-direita tabuleiro)
(0 0 0 (PRETA QUADRADA BAIXA OCA))
```

Retorna a diagonal direita (0,3) a (3,0) de um tabuleiro NIL.

```lisp
; chamada
(diagonal-direita NIL)
NIL
```

#### <a nome="f-">Casa-Vaziap</a>
Verifica se uma coordenada do tabuleiro encontra-se vazia. Uma coordenada é considerada vazia se o seu valor for zero.

**Parâmetros**

*l - Coordenada da linha*

*c - Coordenada da coluna*

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun casa-vaziap (l c tabuleiro)
  (numberp (celula l c tabuleiro))
)
```
Verifica se o tabuleiro vazio encontra-se não tem peça nas coordenadas (0,0).

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (casa-vaziap 0 0 tabuleiro)
T
```

Verifica se o tabuleiro preenchido encontra-se não tem peça nas coordenadas (1,3).

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (casa-vaziap 1 3 tabuleiro)
NIL
```

Verifica se o tabuleiro preenchido encontra-se não tem peça nas coordenadas (0,3).

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (casa-vaziap 0 3 tabuleiro)
T
```

#### <a nome="f-">Remove-Peca</a>
Remove da lista uma peça igual ao da peça parametrizada. Caso existir a peça, é retornada a lista sem a peça, caso contrário não é efetuada qualquer alteração e retorna-se a lista parametrizada.

**Parâmetros**

*p - Peça*

*reserva - Reserva do Tabuleiro*

```lisp
; funcao
(defun remove-peca (p reserva)
  (let ((predp #'(lambda (p e) (equal p e))))
    (cond
     ((or (null reserva) (null p)) NIL)
     ((funcall predp p (car reserva)) (remove-peca p (cdr reserva)))
     (t (cons (car reserva) (remove-peca p (cdr reserva))))))
)
```

Remove peça (BRANCA QUADRADA ALTA CHEIA) da lista.

```lisp
; reserva
((BRANCA QUADRADA ALTA CHEIA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))

; chamada
CL-USER> (remove-peca '(BRANCA QUADRADA ALTA CHEIA) reserva)
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))
```

Remove peça (BRANCA REDONDA BAIXA CHEIA) da lista.

```lisp
; reserva
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))

; chamada
CL-USER> (remove-peca '(BRANCA REDONDA BAIXA CHEIA) reserva)
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))
```

Remove peça (BRANCA QUADRADA ALTA CHEIA) da lista. Esta peça não existe na lista.

```lisp
; reserva
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))

; chamada
CL-USER> (remove-peca '(BRANCA QUADRADA ALTA CHEIA) reserva)
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA) (BRANCA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA OCA))
```

#### <a nome="f-">Substituir-Posicao</a>
Substitui o valor de uma coordenada da fila com uma peça. Caso a coordenada da fila encontra-se vazia (com o valor zero), retorna-se o tabuleiro com a peça na coordenada parametrizada. Caso contrário retorna NIL.

**Parâmetros**

*i - Coordenada da fila*

*p - Peça*

*fila-tabuleiro - Fila do tabuleiro*

```lisp
; funcao
(defun substituir-posicao (i p fila-tabuleiro)
  (cond
   ((or (null p) (null fila-tabuleiro)) NIL)
   (t (setf (nth i fila-tabuleiro) p))
  )
)
```

Substitui posição 0 da fila 0 do tabuleiro com a peça (BRANCA REDONDA ALTA OCA).

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (substituir-posicao 0 '(BRANCA REDONDA ALTA OCA) tabuleiro)
(BRANCA REDONDA ALTA OCA)
```

Substitui posição 0 da fila 0 do tabuleiro NIL com a peça (BRANCA REDONDA ALTA OCA).

```lisp
; chamada
CL-USER> (substituir-posicao 0 '(BRANCA REDONDA ALTA OCA) NIL)
NIL
```

#### <a nome="f-">Colunas</a>
Retorna as linhas do tabuleiro reposicionadas como colunas.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun colunas (tabuleiro)
  (list (coluna 0 tabuleiro)  (coluna 1 tabuleiro) (coluna 2 tabuleiro) (coluna 3 tabuleiro))
)
```
Retorna as colunas de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (colunas tabuleiro)
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

Retorna as colunas de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (colunas tabuleiro)
(((BRANCA QUADRADA BAIXA CHEIA) 0 (BRANCA REDONDA ALTA CHEIA) 0) (0 0 0 (PRETA QUADRADA BAIXA CHEIA)) ((PRETA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA OCA) 0))
```

#### <a nome="f-">Diagnonais</a>
Retorna uma lista com todas as diagonais do tabuleiro.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun diagonais (tabuleiro)
  (list (diagonal-direita tabuleiro) (diagonal-esquerda tabuleiro))
)
```

Retorna as diagonais de um tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (diagonais tabuleiro)
((0 0 0 0) (0 0 0 0))
```

Retorna as diagonais de um tabuleiro preenchido.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

; chamada
CL-USER> (diagonais tabuleiro)
((0 0 0 (PRETA QUADRADA BAIXA OCA)) ((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA OCA) 0))
```

Retorna as diagonais de um tabuleiro cheio.

*Um tabuleiro só poderá estar cheio, se este for dado inicialmente.*

```lisp
; chamada
CL-USER> (diagonais tabuleiro)
(((PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA QUADRADA BAIXA OCA)) ((BRANCA QUADRADA BAIXA CHEIA) (BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA ALTA OCA)))
```

#### <a nome="f-">Quatro-Fila-P</a>
Verifica se no tabuleiro inteiro existem quatro peças com pelo menos um atributo em comum. Caso se verifique, retorna T, caso contrário retorna NIL.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun quatro-fila-p (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((filas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (filas-cheias (remove-if-not #'(lambda (z) 
                                             (= 4 (list-length z)))
                                         (mapcar #'(lambda (x) 
                                                     (remove-if #'(lambda (y) (eq y 0)) x))
                                                 filas))))
      (cond
       ((null filas-cheias) nil)
       (t (reduce #'(lambda (&optional x y) (or x y)) (mapcar #'sao-iguaisp filas-cheias)))))))
)
```
Encontra 4 peças com pelo menos um atributo em comum num tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (quatro-fila-p tabuleiro)
NIL
```

Encontra 4 peças com pelo menos um atributo em comum num tabuleiro com peças desalinhadas entre si.

```lisp
; tabuleiro
(((BRANCA REDONDA ALTA OCA) 0 0 0) (0 0 (PRETA REDONDA ALTA OCA) 0) (0 0 0 (BRANCA REDONDA BAIXA OCA)) (0 (PRETA REDONDA BAIXA OCA) 0 0))

; chamada
CL-USER> (quatro-fila-p tabuleiro)
NIL
```

Encontra 4 peças com pelo menos um atributo em comum num tabuleiro com peças alinhadas na diagonal.

```lisp
; tabuleiro
(((BRANCA REDONDA ALTA OCA) 0 0 0) (0 (PRETA REDONDA ALTA OCA) 0 0) (0 0 (BRANCA REDONDA BAIXA OCA) 0) (0 0 0 (PRETA REDONDA BAIXA OCA)))

; chamada
CL-USER> (quatro-fila-p tabuleiro)
T
```

Encontra 4 peças com pelo menos um atributo em comum num tabuleiro cheio.

*Um tabuleiro só poderá estar cheio, se este for dado inicialmente.*

```lisp
; chamada
CL-USER> (quatro-fila-p tabuleiro)
T
```

#### <a nome="f-">Max-A-P</a>
Retorna a contagem máxima de peças com pelo menos um atributo em comum em todo o tabuleiro. O intervalo de contágem máxima varia entre o intervalo inteiro [0, 4].

Esta função é considerada um operador do jogo, por ser utilizada como meio de gerar um estado do problema.

**Parâmetros**

*tabuleiro - Tabuleiro*

```lisp
; funcao
(defun max-p-a (tabuleiro)
  (cond
   ((null tabuleiro) nil)
   (t
    (let* ((filas (append tabuleiro (colunas tabuleiro) (diagonais tabuleiro)))
           (filas-pecas (mapcar #'(lambda (x) 
                                     (remove-if #'(lambda (y) (eq y 0)) x))
                                 filas)))
      (cond
       ((null filas-pecas) 0)
       (t (reduce #'max (mapcar #'max (remove nil (mapcar #'(lambda (em-fila len) (and em-fila len))
                                (mapcar #'sao-iguaisp filas-pecas)
                                (mapcar #'length filas-pecas))))))))))
)
```
Numero máximo de peças com pelo menos 1 atributo em comum num tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (max-p-a tabuleiro)
0
```

Numero máximo de peças com pelo menos 1 atributo em comum num tabuleiro preenchido com no máximo uma peça com o mesmo atributo.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) ((BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) ((PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (max-p-a tabuleiro)
1
```

Numero máximo de peças com pelo menos 1 atributo em comum num tabuleiro preenchido com no máximo quatro peças com o mesmo atributo.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) ((BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) ((BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))

; chamada
CL-USER> (max-p-a tabuleiro)
4
```

#### <a nome="f-">Sao-Iguaisp</a>
Verifica se existe pelo menos um atributo em comum em todas as peças da fila. Caso encontre uma peça com atributo diferente retorna NIL. Caso contrário retorna T.

**Parametros**

*fila - Fila*

```lisp
; funcao
(defun sao-iguaisp (fila)
  (labels ((eq-list (x &rest y) 
             (cond 
              ((null y) T) 
              ((eq x (car y)) (apply #'eq-list x (cdr y)))
              (t nil))))
    (cond
     ((null fila) nil)
     (t (reduce #'(lambda (&optional a b) (or a b)) (apply #'mapcar #'eq-list fila)))))
)
```

Enconta atributos iguais com uma fila de  1 peça.

```lisp
; fila filtrada
((BRANCA REDONDA ALTA OCA))

; chamada
CL-USER> (sao-iguaisp fila)
T
```

Enconta atributos iguais com uma fila de  2 peças diferentes.

```lisp
; fila filtrada
((BRANCA REDONDA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA))

; chamada
CL-USER> (sao-iguaisp fila)
NIL
```

Enconta atributos iguais com uma fila de 3 peças.

```lisp
; fila filtrada
((BRANCA REDONDA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA))

; chamada
CL-USER> (sao-iguais fila)
NIL
```

#### <a nome="f-">Jogada</a>
Efetua uma jogada em que remove a peça enviada por parâmetro da reserva do problema e insere-a na coordenada do tabuleiro.

**Parâmetros**

*l - Coordenada da linha*

*c - Coordenada da Coluna*

*p - Peça*

*problema - Problema*

```lisp
; funcao
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
```

Insere na coordenada (0, 0) do tabuleiro a peça (BRANCA REDONDA ALTA OCA).

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
(branca redonda alta oca) (preta redonda alta oca) (branca redonda baixa oca) (preta redonda baixa oca) (branca quadrada alta oca) (preta quadrada alta oca) (branca quadrada baixa oca)(preta quadrada baixa oca) (branca redonda alta cheia) (preta redonda alta cheia) (branca redonda baixa cheia) (preta redonda baixa cheia) (branca quadrada alta cheia) (preta quadrada alta cheia) (branca quadrada baixa cheia) (preta quadrada baixa cheia))

; peca
(BRANCA REDONDA ALTA OCA)

; chamada
CL-USER> (jogada 0 0 peca problema)
((((BRANCA REDONDA ALTA OCA) 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))
```

Insere na coordenada (0, 0) do tabuleiro a peça (PRETA QUADRADA BAIXA CHEIA).

*Esta função apenas tem delegada a função de substituir o valor da coordenada parameterizada pelo novo valor.*

```lisp
; problema
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
(branca redonda alta oca) (preta redonda alta oca) (branca redonda baixa oca) (preta redonda baixa oca) (branca quadrada alta oca) (preta quadrada alta oca) (branca quadrada baixa oca)(preta quadrada baixa oca) (branca redonda alta cheia) (preta redonda alta cheia) (branca redonda baixa cheia) (preta redonda baixa cheia) (branca quadrada alta cheia) (preta quadrada alta cheia) (branca quadrada baixa cheia) (preta quadrada baixa cheia))

; peca
(PRETA QUADRADA BAIXA CHEIA)

; chamada
CL-USER> (jogada 0 0 peca problema)
((((PRETA QUADRADA BAIXA CHEIA) 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA)))
```

#### <a nome="f-">Casas-Vazias</a>
Retorna uma lista com todas as coordenadas vazias num tabuleiro.

**Parâmetros**

*tab - tabuleiro*

*l - Coordenada da linha (opcional)*

```lisp
; funcao
(defun casas-vazias (tab &optional (l 0))
  (cond 
   ((null tab) nil)
    (t (append (coordenadas (car tab) l) 
     (casas-vazias (cdr tab) (1+ l)))))) 
```

Tabuleiro vazio.

```lisp
; tabuleiro
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

; chamada
CL-USER> (casas-vazias tabuleiro)
((0 0) (0 1) (0 2) (0 3) (1 0) (1 1) (1 2) (1 3) (2 0) (2 1) (2 2) (2 3) (3 0) (3 1) (3 2) (3 3))

```

Tabuleiro com 8 casas vazias.

```lisp
; tabuleiro
(((BRANCA QUADRADA BAIXA CHEIA) 0 (PRETA REDONDA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA)) (0 0 0 (BRANCA REDONDA BAIXA OCA)) ((BRANCA REDONDA ALTA CHEIA) 0 (PRETA REDONDA ALTA OCA) (BRANCA QUADRADA BAIXA OCA)) (0 (PRETA QUADRADA BAIXA CHEIA) 0 0))

;chamada
CL-USER> (casas-vazias tabuleiro)
((0 1) (1 0) (1 1) (1 2) (2 1) (3 0) (3 2) (3 3))

```
Tabuleiro com zero casas vazias. 

*Um tabuleiro só poderá estar cheio, se este for dado inicialmente.*

```lisp
; chamada
CL-USER> (casas-vazias tabuleiro)
NIL
```

#### <a nome="f-">Coordenadas</a>
Retorna uma lista com as coordenadas da fila do tabuleiro que se encontram vazias. Opcionalmente, coloca-se a coordenada da coluna.

**Parâmetros**

*fila - Fila do tabuleiro*

*l - Coordenada da fila*

*c - Coordenada da coluna (opcional)*

```lisp
; funcao
(defun coordenadas (fila l &optional (c 0))
  (cond
   ((null fila) nil)
   ((eq (car fila) 0) 
    (cons (list l c) (coordenadas (cdr fila) l (1+ c))))
   (t (coordenadas (cdr fila) l (1+ c)))))
```

Fila com um espaço vazio e a coordenada 2.

```lisp
; fila
((branca quadrada baixa cheia) 0 (preta redonda alta cheia) (preta quadrada baixa oca))

; chamada
CL-USER> (coordenadas fila 2)
((0 1))
```

Fila com dois espaços vazios e a coordenada 0.

```lisp
; fila
((preta redonda alta cheia) (preta quadrada baixa oca) 0 0)

; chamada
CL-USER> (coordenadas fila 0)
((0 2) (0 3))
```

Fila com zero espaços vazios e a coordenada 3.

```lisp
; fila
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia))

; chamada
CL-USER> (coordenadas fila 3)
NIL
```
Fila com 4 espaços vazios e a coordenada 2.

```lisp
; fila
(0 0 0 0)

; chamada
CL-USER> (coordenadas fila 1)
((1 0) (1 1))
```

#### <a nome="f-">No-Solucaop</a>
Valida se o estado do nó encontra-se com 4 peças com pelo menos um atributo em comum, retornando T caso se verifique ser verdade, case contrário retorna NIL.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-solucaop (no)
  (if (null no) nil (quatro-fila-p (tabuleiro-conteudo no))) 
)
```
Nó com o estado com 4 peças com pelo menos um atributo em comum.

```lisp
; no
((((preta quadrada alta oca) 
(preta quadrada baixa oca) 
(branca redonda baixa oca) 
(preta redonda alta oca))
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada baixa cheia)
(branca redonda alta cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(preta redonda alta cheia)
(preta redonda baixa cheia)
(preta redonda baixa oca))) 0 NIL)

; chamada
CL-USER> (no-solucaop no)
T
```

Nó com o estado com 2 peças com pelo menos um atributo em comum.

```lisp
; no
(((0 (preta quadrada baixa oca) (branca redonda baixa oca) 0)
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada alta oca)
(preta quadrada baixa cheia)
(branca redonda alta cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(preta redonda alta cheia)
(preta redonda alta oca)
(preta redonda baixa cheia)
(preta redonda baixa oca))) 0 NIL)

; chamada
CL-USER> (no-solucaop no)
NIL
```

Nó com o estado com nenhuma peça com pelo menos um atributo em comum.

```lisp
; no
(((0 (preta quadrada baixa oca) (branca redonda alta cheia) 0)
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada alta oca)
(preta quadrada baixa cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(branca redonda baixa oca)
(preta redonda alta cheia)
(preta redonda alta oca)
(preta redonda baixa cheia)
(preta redonda baixa oca)))) 0 NIL)

; chamada
CL-USER> (no-solucaop no)
NIL
```

#### <a nome="f-">Heuristic</a>
A heuristica f(x) = 4 - h(x) é utilizada no algoritmo A*.

Esta heuristica baseia-se na substração entre o número máximo de peças necessárias para ganhar o jogo e o número máximo de peças atuais no tabuleiro.

**Parâmetros**

*estado - Estado do nó*

```lisp
; funcao
(defun heuristic (estado)
  (- 4
     (max-p-a (tabuleiro estado))))
```

Estado com o tabuleiro vazio.

```lisp
; chamada
CL-USER> (heuristic estado)
4
```

Estado com o tabuleiro com três 3 pecas com o pelo menos um atributo.

```lisp
; chamada
CL-USER> (heuristic estado)
1
```

Estado com o tabuleiro com 4 pecas com o pelo menos um atributo.

```lisp
; chamada
CL-USER> (heuristic estado)
0
```

# <a nome="f-procura">Procura</a>

#### <a nome="f-">cria-no</a>

Server para criar o estado inicial dos problemas

```lisp
; funcao
(defun cria-no (estado  &optional (g 0) (pai nil))
  (list estado g pai)
)
```

#### <a nome="f-">tabuleiro-conteudo</a>
Mostra o tabuleiro do jogo

```lisp
; funcao
(defun tabuleiro-conteudo (no)
(caar no)
)
```
#### <a nome="f-">reserva-conteudo</a>
Mostra a reserva de peças do jogo

```lisp
; funcao
(defun reserva-conteudo (no)
(cdar no)
)
```
#### <a nome="f-">no-estado</a>
Mostra o estado atual do nó

```lisp
; funcao
(defun no-estado (teste)
  (car teste)
)
```

#### <a nome="f-">no-pai</a>
Mostra o nó pai

```lisp
; funcao
(defun no-pai (teste)
  (cddr teste)
)
```
#### <a nome="f-">no-profundidade</a>
Mostra a profundidade do estado do jogo

```lisp
; funcao
(defun no-profundidade (teste)
  (cadr teste)
)
```
#### <a nome="f-">novo-sucessor</a>
O novo sucessor dos nos atuais

```lisp
; funcao
(defun novo-sucessor (teste x)
  (let ((novo-estado (funcall x (no-estado teste))))
    (cond ((null novo-estado) nil)
	  (t (list novo-estado (1+ (no-profundidade teste)) teste))))
  )
```

#### <a nome="f-">sucessores-quatro</a>
Sucessores dos nos

```lisp
; funcao
(defun sucessores-quatro (no operadoresf algoritmo &optional (max-prof nil))
  (cond ((and max-prof (eq algoritmo 'dfs)
	      (>= (no-profundidade no)
		  max-prof)) nil)
	(t (remove nil
		   (mapcar #'(lambda (operador) (novo-sucessor no operador)) (funcall operadoresf (no-estado no))))))
)
```


```lisp
; chamada
CL-USER 11 > (sucessores-quatro (cria-no x) #'operadores-quatro 'bfs)
((((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA OCA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((PRETA QUADRADA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((PRETA QUADRADA BAIXA OCA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)) (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((BRANCA QUADRADA BAIXA OCA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL)))

```

###  <a name="todo">// TODO</a>
(adiciona mais aqui ...)

# <a name="Lista de Problemas">Lista de Problemas</a>

Mostra 6 tabuleiros diferentes com algumas peças em falta para jogar e com uso dos algoritmos de procura vai verificar quais as melhores jogadas para terminar o jogo. 

## <a name="Problema-A">Problema-A</a>

```lisp
(
(((branca quadrada alta oca) (preta quadrada baixa cheia) 0 (preta quadrada alta oca))
((branca redonda alta oca) (preta redonda alta oca) (branca redonda alta cheia) 0) 
(0 (preta redonda alta cheia) (preta redonda baixa cheia) 0) 
((branca redonda baixa oca) (branca quadrada alta cheia) (preta redonda baixa oca) (branca quadrada baixa cheia)))
((preta quadrada alta cheia)
(preta quadrada baixa oca)
(branca redonda baixa cheia)
(branca quadrada baixa oca))
)
````

## <a name="Problema-B">Problema-B</a>

```lisp
(
(((branca quadrada alta oca) (preta redonda baixa oca) (preta quadrada alta oca) (branca quadrada alta cheia)) 
((branca redonda alta oca) 0 (branca redonda alta cheia) 0) 
((preta quadrada baixa cheia) (preta redonda alta cheia) (branca quadrada baixa oca) 0) 
((preta quadrada baixa oca) 0 (branca quadrada baixa cheia) 0))
 ((branca redonda baixa oca)
 (preta redonda baixa cheia)
 (preta redonda alta oca)
 (preta quadrada alta cheia)
 (branca redonda baixa cheia))
)

````

## <a name="Problema-C">Problema-C</a>

```lisp
(
(((branca quadrada baixa cheia) 0 (preta redonda alta cheia) (preta quadrada baixa oca))
 (0 0 0 (branca redonda baixa oca)) 
((branca redonda alta cheia) 0 (preta redonda alta oca) 0) 
(0 (preta quadrada baixa cheia) 0 0))
((branca quadrada alta cheia)
 (branca quadrada alta oca)
 (branca quadrada baixa oca)
 (preta quadrada alta cheia)
 (preta quadrada alta oca)
 (branca redonda alta oca)
 (branca redonda baixa cheia)
 (preta redonda baixa cheia)
 (preta redonda baixa oca))
)

````

## <a name="Problema-D">Problema-D</a>

```lisp
(
(((branca quadrada baixa cheia) (branca redonda alta cheia) (preta redonda alta cheia) (preta quadrada baixa oca))
(0 0 0 0) 
(0 0 0 0) 
(0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada alta oca)
(preta quadrada baixa cheia)
(branca redonda baixa oca)
(branca redonda alta oca)
(branca redonda baixa cheia)
(preta redonda alta oca)
(preta redonda baixa cheia))
)

````

## <a name="Problema-E">Problema-E</a>

```lisp
(
 ((0 0 0 0) 
 (0 0 0 0) 
 (0 0 (preta redonda alta oca) 0)
 (0 0 0 0))
((branca quadrada alta cheia)
 (branca quadrada alta oca)
 (branca quadrada baixa oca)
 (branca quadrada baixa cheia)
 (preta quadrada alta cheia)
 (preta quadrada alta oca)
 (preta quadrada baixa oca)
 (preta quadrada baixa cheia)
 (branca redonda alta cheia)
 (branca redonda alta oca)
 (branca redonda baixa cheia)
 (branca redonda baixa oca)
 (preta redonda alta cheia)
 (preta redonda baixa cheia)
 (preta redonda baixa oca))
)

````

## <a name="Problema-F">Problema-F</a>

```lisp
(
((0 0 0 0)
 (0 0 0 0)
 (0 0 0 0)
 (0 0 0 0))
((branca quadrada alta cheia)
(branca quadrada alta oca)
(branca quadrada baixa oca)
(branca quadrada baixa cheia)
(preta quadrada alta cheia)
(preta quadrada alta oca)
(preta quadrada baixa oca)
(preta quadrada baixa cheia)
(branca redonda alta cheia)
(branca redonda alta oca)
(branca redonda baixa cheia)
(branca redonda baixa oca)
(preta redonda alta cheia)
(preta redonda alta oca)
(preta redonda baixa cheia)
(preta redonda baixa oca))
)

````

# <a name="f-Algoritm">Algoritmos</a>


## <a name="Pesquisa em Largura">Pesquisa em Largura</a>
Esta função retorna a procura de estados em largura.

```lisp
(defun bfs (no-inicial objetivop sucessoresf operadores &optional abertos fechados)
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
                      (cons no-inicial fechados)))))))

````

## <a name="Pesquisa em Comprimento">Pesquisa em Comprimento</a>
Esta função retorna a procura de estados em comprimento.

```lisp
(defun dfs (no-inicial objetivop sucessoresf operadores profundidade
            &optional (abertos nil) (fechados nil))
  (if (funcall objetivop no-inicial)
      no-inicial
      (let ((nos-succ (remove-if #'(lambda (x) (or (no-existep x abertos 'dfs)
                                                   (no-existep x fechados 'dfs)))
                                 (funcall sucessoresf
                                          no-inicial operadores 'dfs profundidade))))
        (cond ((and (null nos-succ) (null abertos)) nil)
              ((null nos-succ)
               (dfs (car abertos) objetivop sucessoresf operadores
                    profundidade (cdr abertos) (cons no-inicial fechados)))
              (t (dfs (car nos-succ) objetivop sucessoresf operadores
                      profundidade (abertos-dfs abertos (cdr nos-succ))
                      (cons no-inicial fechados)))))))

```

## <a name="Pesquisa em A Estrela">Pesquisa em A*</a>

```lisp
(defun a_star (no-inicial objetivop sucessoresf operadores profundidade
                          heuristicaf &optional pqueue)
  (if (funcall objetivop no-inicial)
      no-inicial
      (let* ((nos-succ (funcall sucessoresf no-inicial operadores 'a_star)) 
             (distances (mapcar #'heuristicaf nos-succ)))     
          (cond ((and (null nos-succ) (null pqueue)) nil)
                (+ profundidade distances)
                ((null pqueue)
                 (a_star (car nos-succ) objetivop sucessoresf operadores 
                         profundidade heuristicaf (cdr nos-succ)))
                 (t (a_star (car pqueue) objetivop sucessoresf operadores 
                         profundidade heuristicaf (cdr pqueue)))))))


```


## <a name="sim2">Simulação de Algoritmos</a>

### <a name="teste-1-bfs">Teste 1 Procura em Largura</a>

Chamar a função de Procura em Largura com o nó inicial, nó objetivo, sucessores e operadores.

```lisp
CL-USER 8 > (bfs (cria-no x) #'no-solucaop #'sucessores-quatro #'operadores-quatro)
(((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL))


```

### <a name="teste-1-dfs">Teste 1 Procura em Comprimento</a>

Chamar a função de Procura em Comprimento com o nó inicial, nó objetivo, sucessores, operadores e profundidade.

```lisp

(dfs (cria-no x) #'no-solucaop #'sucessores-quatro #'operadores-quatro 2)
(((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL))

```

### <a name="teste-1-a-star">Teste 1 Procura em A*</a>

Chamar a função de Procura em A* com o nó inicial, nó objetivo, sucessores, operadores, profundidade e heuristica.

```lisp

CL-USER 10 > (a-star (cria-no x) #'no-solucaop #'sucessores-quatro #'operadores-quatro #'heuristic)
(((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) ((BRANCA QUADRADA BAIXA OCA) (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA))) 1 (((((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA ALTA CHEIA) 0) (0 (PRETA REDONDA ALTA CHEIA) (PRETA REDONDA BAIXA CHEIA) 0) ((BRANCA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA CHEIA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA BAIXA CHEIA))) ((PRETA QUADRADA ALTA CHEIA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA BAIXA CHEIA) (BRANCA QUADRADA BAIXA OCA))) 0 NIL))


```

## <a name="doc-glossario">Glossário</a>