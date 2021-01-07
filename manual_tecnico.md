# Projeto IA 2020/21 IPS ESTS

### Docente
Joaquim Filipe

### Estudantes
150221081 - Daniela Sineiro

200221149 - Rafael Palma

## Manual Técnico
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
    * [Cria-No](#f-p-cria-no)
    * [Tabuleiro-Conteudo](#f-p-tabuleiro-conteudo)
    * [Reserva-Conteudo](#f-p-reserva-conteudo)
    * [No-Estado](#f-p-no-estado)
    * [No-Pai](#f-p-no-pai)
    * [No-Profundidade](#f-p-no-profundidade)
    * [Novo-Sucessor](#f-p-no-sucessor)
    * [Sucessores-Quatro](#-f-p-sucessores-quatro)
    * [Operadores-Quatro](#f-p-operadores-quatro)
    * [Nivel-no](#f-p-nivel-no)
    * [Abertos-Bfs](#f-p-abertos-bfs)
    * [Abertos-Dfs](#f-p-abertos-dfs)
    * [No-Existep](#f-p-no-existep)
    * [Bfs](#f-p-bfs)
    * [Dfs](#f-p-dfs)
    * [Empty-Heap-P](#f-p-empty-heap-p)
    * [Make-Heap](#f-p-make-heap)
    * [Meld](#f-p-meld)
    * [Insert](#f-p-insert)
    * [Priority](#f-p-priority)
    * [Elem](#f-p-elem)
    * [child](#f-p-child)
    * [O-Sibling](#f-p-o-sibling)
    * [Siblings](#f-p-siblings)
    * [Children](#f-p-children)
    * [Paiwise-Link](#f-p-pairwise-link)
    * [A-Star](#f-p-a-star)
  * [Projeto](#f-projeto)
    * [???](#f-proj-)
* [Lista de Problemas](#lista-problemas)
  * [Problema A](#lp-a)
  * [Problema B](#lp-b)
  * [Problema C](#lp-c)
  * [Problema D](#lp-d)
  * [Problema E](#lp-e)
  * [Problema F](#lp-f)
* [Aplicação dos Algoritmos de Prócura](#aplica-algoritmos)
  * [Problema A](#aplica-algoritmos-problema-a)
    * [BFS](#aplica-algoritmos-problema-a-bfs)
    * [DFS](#aplica-algoritmos-problema-a-dfs)
    * [A-Star](#aplica-algoritmos-problema-a-a-star)
  * [Problema B](#aplica-algoritmos-problema-b)
    * [BFS](#aplica-algoritmos-problema-b-bfs)
    * [DFS](#aplica-algoritmos-problema-b-dfs)
    * [A-Star](#aplica-algoritmos-problema-b)
  * [Problema C](#aplica-algoritmos-problema-c)
    * [BFS](#aplica-algoritmos-problema-c-bfs)
    * [DFS](#aplica-algoritmos-problema-c-dfs)
    * [A-Star](#aplica-algoritmos-problema-c-a-star)
  * [Problema D](#aplica-algoritmos-problema-d)
    * [BFS](#aplica-algoritmos-problema-d-bfs)
    * [DFS](#aplica-algoritmos-problema-d-dfs)
    * [A-Star](#aplica-algoritmos-problema-d-a-star)
  * [Problema E](#aplica-algoritmos-problema-e)
    * [BFS](#aplica-algoritmos-problema-e-bfs)
    * [DFS](#aplica-algoritmos-problema-e-dfs)
    * [A-Star](#aplica-algoritmos-problema-e-a-star)
  * [Problema F](#aplica-algoritmos-problema-f)
    * [BFS](#aplica-algoritmos-problema-f-bfs)
    * [DFS](#aplica-algoritmos-problema-f-dfs)
    * [A-Star](#aplica-algoritmos-problema-f-a-star)
* [Conslusão](#conclusao)
* [Glossário](#glossario)


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

#### <a name="f-tabuleiro">Tabuleiro</a>
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

### <a nome="f-procura">Procura</a>

#### <a nome="f-p-cria-no">Cria-No</a>
Gera um nó constituído por estado (problema), profundidade e nó predecessor.

**Parâmetros**

*estado - Estado do problema*

*Profundidade - Número de profundidade (opcional)*

*pai - Nó predecessor (opcional)*

```lisp
; funcao
(defun cria-no (estado  &optional (g 0) (pai nil))
  (list estado g pai)
)
```

#### <a nome="f-p-tabuleiro-conteudo">Tabuleiro-Conteudo</a>
Retorna o tabuleiro que se encontra no estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun tabuleiro-conteudo (no)
(caar no)
)
```

#### <a nome="f-p-reserva-conteudo">Reserva-Conteudo</a>
Retorna a reserva de peças que se encontra no estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun reserva-conteudo (no)
(cdar no)
)
```

#### <a nome="f-p-no-estado">No-Estado</a>
Retorna o estado do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-estado (no)
  (car no)
)
```

#### <a nome="f-p-no-pai">No-Pai</a>
Retorna o nó predecessor do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-pai (no)
  (cddr no)
)
```

#### <a nome="f-p-no-profundidade">No-Profundidade</a>
Retorna a profundidade do nó.

**Parâmetros**

*no - Nó*

```lisp
; funcao
(defun no-profundidade (no)
  (cadr no)
)
```

#### <a nome="f-p-novo-sucessor">Novo-Sucessor</a>
Gera um novo nó sucessor, recebendo um nó por parâmetro.

**Parâmetros**

*no - Nó*

*x - Função (???)*

```lisp
; funcao
(defun novo-sucessor (no x)
  (let ((novo-estado (funcall x (no-estado no))))
    (cond ((null novo-estado) nil)
	  (t (list novo-estado (1+ (no-profundidade no)) no))))
  )
```

#### <a nome="f-p-sucessores-quatro">Sucessores-Quatro</a>
Gera sucessores de um nó especificamente desenvolvido para o  problema quatro, de acordo com um dos algoritmos de prócura, DFS ou BFS.

**Parâmetros**

*no - Nó*

*operadoresf - Função (???)*

*algoritmo - Algoritmo de prócura DFS ou BFS*

*max-prof - Máxima profundidade (opcional)*

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

#### <a nome="f-p-operadores-quatro">Operadores-Quatro</a>
Aplica a um estado todos os movimentos possíveis do jogo, designados por operadores.

**Parâmetros**

*estado-jogo - Estado do problema*

```lisp
; funcao
(defun operadores-quatro (estado-jogo)
  (let ((casas (casas-vazias (tabuleiro estado-jogo)))
        (pecas (reserva estado-jogo)))
    (apply #'append (mapcar #'(lambda (casa)
                (mapcar #'(lambda (peca)
                            (lambda (estado) (jogada (car casa) (cadr casa) peca estado)))
                            pecas))
            casas)))
)
```

#### <a nome="f-p-nivel-no">Nivel-No</a>
Retorna o nivel do nó.

**Parâmetros**

*no - Nó*

```lisp
(defun nivel-no (no)
  (cadr no)
)
```

#### <a nome="f-p-abertos-bfs">Abertos-Bfs</a>
Adiciona à lista de nós abertos os nós sucessores, segundo o algoritmo de prócura BFS.

**Parâmetros**

*abertos - Lista de nós abertos*

*sucessores - Nó sucessores*

```lisp
(defun abertos-bfs (abertos sucessores)
  (append abertos sucessores)
)
```

#### <a nome="f-p-abertos-dfs">Abertos-Dfs</a>
Adiciona à lista de nós abertos os nós sucessores, segundo o algoritmo de prócura DFS.

**Parâmetros**

*abertos - Lista de nós abertos*

*sucessores - Nó sucessores*

```lisp
(defun abertos-dfs (abertos sucessores)
  (append sucessores abertos)
)
```

#### <a nome="f-p-no-existep">No-Existep</a>
Retorna T, se o nó enviado por parâmetro encontra-se na lista de nós. Caso contrário retorna NIL.

**Parâmetros**

*no - Nó*

*lista - Lista de nós*

*algoritmo - Algoritmo de Prócura*

```lisp
(defun no-existep (no lista algoritmo)
  (cond ((null lista) nil)
	((and (or (eq algoritmo 'bfs) (<= (nivel-no (car lista)) (nivel-no no)))
	      (equal (no-estado (car lista)) (no-estado no))) t)
	(t (no-existep no (cdr lista) algoritmo)))
)
```

#### <a nome="f-p-bfs">Bfs</a>
Algoritmo de prócura em largura, que retorna todos os nós até a uma solução, sempre que possível.

**Parâmetros**

*no-inicial - Nó com o estado inicial*

*objetivop - Função que avalia se o nó contém o estado esperado*

*sucessoresf - Função que gera sucessores*

*operadores - Função com todos os operadores*

*abertos - Lista de nós abertos bfs (opcional)*

*fechados - Lista de nós fechados bfs (opcional)*

```lisp
; funcao
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
```

```lisp
; chamada
CL-USER> (bfs (cria-no (third(obter-problemas "problemas.dat"))) #'no-solucaop  #'sucessores-quatro #'operadores-quatro)
```

#### <a nome="f-p-dfs">Dfs</a>
Algoritmo de prócura em profundidade, que retorna todos os nós até a uma solução, sempre que possível.

**Parâmetros**

*no-inicial - Nó com o estado inicial*

*objetivop - Função que avalia se o nó contém o estado esperado*

*sucessoresf - Função que gera sucessores*

*operadores - Função com todos os operadores*

*prof-max - Número de profundidade máxima aceitável*

*abertos - Lista de nós abertos dfs (opcional)*

*fechados - Lista de nós fechados dfs (opcional)*

```lisp
; funcao
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
		      (cons no-inicial fechados))))))
)
```

```lisp
; chamada
CL-USER> (dfs(cria-no (third(obter-problemas "problemas.dat"))) #'no-solucaop  #'sucessores-quatro #'operadores-quatro  10)
```

#### <a nome="f-p-empty-heap-p">Empty-Heap-P</a>
Retorna T se a heap encontra-se vazia, caso contrário retorna NIL.

**Parâmetros**

*h - Heap*

```lisp
(defun empty-heap-p (h)
  (null h))
```

#### <a nome="f-p-make-heap">Make-Heap</a>
Gera uma heap, recebendo elementos com uma prioridade pré-definida opcionalmente.

**Parâmetros**

*x - Elemento (opcional)*

*k - Número de prioridade (opcional)*

```lisp
(defun make-heap (&optional x (k 0))
  (cond ((null x) nil)
	(t (list x k nil nil)))
)
```

#### <a nome="f-p-meld">Meld</a>
Retorna o produto da União entre duas heaps.

**Parâmetros**

*h1 - Heap (opcional)*

*h2 - Heap (opcional)*

```lisp
;; Junta duas heaps
(defun meld (&optional h1 h2)
  (cond ((null h1) h2)
	((null h2) h1)
	((<= (priority h1) (priority h2))
	 (list (elem h1) (priority h1)
	       (list (elem h2) (priority h2) (child h2)
		     (child h1))
	       nil))
	(t (meld h2 h1)))
)
```

#### <a nome="f-p-insert">Insert</a>
Adiciona o elemento à heap com a prioridade.

**Parâmetros**

*x - Elemento*

*k - Número de prioridade*

*heap - Heap*

```lisp
(defun insert (x k heap)
  (let ((xh (make-heap x k)))
    (meld xh heap))
)
```

#### <a nome="f-p-priority">Priority</a>
Retorna a prioridade de um nó da heap.

**Parâmetros**

*no - Nó*

```lisp
(defun priority (no)
  (cadr no)
)
```

#### <a nome="f-p-elem">Elem</a>
Retorna o elemento de um nó da heap.

**Parâmetros**

*no - Nó*

```lisp
(defun elem (no)
  (car no)
)
```

#### <a nome="f-p-elem">Elem</a>
Retorna o nó descendente mais à esquerda de um nó da heap.

**Parâmetros**

*no - Nó*

```lisp
(defun child (no)
  (caddr no)
)
```

#### <a nome="f-p-o-sibling">O-Sibling</a>
Retorna o primeiro nó dos nós descendentes do mesmo nó predecessor, de um nó da heap.

**Parâmetros**

*no - Nó*

```lisp
(defun o-sibling (no)
  (cadddr no)
)
```

#### <a nome="f-p-siblings">Siblings</a>
Retorna o todos os nós dos nós descendentes do mesmo nó predecessor, de um nó da heap.

**Parâmetros**

*no - Nó*

```lisp
(defun siblings (no)
  (let ((sib (o-sibling no)))
    (cond ((null sib) nil)
	  (t (cons sib (siblings sib)))))
)
```

#### <a nome="f-p-children">Children</a>
Retorna o todos os nós descendentes de um nó da heap.

**Parâmetros**

*heap - Heap*

```lisp
(defun children (heap)
  (if (empty-heap-p heap)
      nil
      (cons (child heap) (siblings (child heap))))
)
```

#### <a nome="f-p-pairwise-link">Pairwise-Link</a>
Retorna o produto da união em pares, de várias àrvores.

**Parâmetros**

*heap-list - Lista heap*

```lisp
(defun pairwise-link (heap-list)
  (cond ((null heap-list) nil)
	((null (cdr heap-list)) (cons (car heap-list) nil))
	(t (cons (meld (car heap-list) (cadr heap-list))
		 (pairwise-link (cddr heap-list)))))
)
```

#### <a nome="f-p-remove-first">Remove-First</a>
Remove o primeiro nó da heap e retorna a heap sem o primeiro nó.

**Parâmetros**

*heap - Heap*

```lisp
(defun remove-first (heap)
  (let ((popped (elem heap))
	(trees (children heap)))
    (values popped (reduce #'meld (pairwise-link trees) :from-end t)))
)
```

#### <a nome="f-p-a-star">A-Star</a>
Algoritmo de prócura 

**Parâmetros**

*no-inicial - Nó com o estado inicial*

*objetivop - Função que avalia se o nó contém o estado esperado*

*sucessoresf - Função que gera sucessores*

*operadores - Função com todos os operadores*

*heuristicaf - Função que comtém a heuristica que auxilia na previsão de uma prócura ótima*

*pqueue - Fila de elementos com prioridade (opcional)*

```lisp
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
		      heuristicaf next-pq)))))
)
```

```lisp
; chamada
CL-USER> (a-star (cria-no (third(obter-problemas "problemas.dat"))) #'no-solucaop  #'sucessores-quatro #'operadores-quatro #'heuristic)
```

### <a name="f-projeto">Projeto</a>

#### <a name="f-proj-">???</a>

## <a name="lista-problemas">Lista de Problemas</a>

Mostra 6 tabuleiros diferentes com algumas peças em falta para jogar e com uso dos algoritmos de procura vai verificar quais as melhores jogadas para terminar o jogo. 

### <a name="lp-a">Problema A</a>

```lisp
; problema
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
```

### <a name="lp-b">Problema B</a>

```lisp
; problema
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

```

### <a name="lp-c">Problema C</a>

```lisp
; problema
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
```

### <a name="lp-d">Problema D</a>

```lisp
; problema
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

```

### <a name="lp-e">Problema E</a>

```lisp
; problema
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

```

### <a name="lp-f">Problema F</a>

```lisp
; problema
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

```

## <a name="aplica-algoritmos">Aplicação dos Algoritmos de Prócura</a>

### <a name="aplica-algoritmos-problema-a">Problema A</a>

#### <a name="aplica-algoritmos-problema-a-bfs">BFS</a>

#### <a name="aplica-algoritmos-problema-a-dfs">DFS</a>

#### <a name="aplica-algoritmos-problema-a-a-star">A-Star</a>

### <a name="aplica-algoritmos-problema-b">Problema B</a>

#### <a name="aplica-algoritmos-problema-b-bfs">BFS</a>

#### <a name="aplica-algoritmos-problema-b-dfs">DFS</a>

#### <a name="aplica-algoritmos-problema-b-a-star">A-Star</a>

### <a name="aplica-algoritmos-problema-c">Problema C</a>

#### <a name="aplica-algoritmos-problema-c-bfs">BFS</a>

#### <a name="aplica-algoritmos-problema-c-dfs">DFS</a>

#### <a name="aplica-algoritmos-problema-c-a-star">A-Star</a>

### <a name="aplica-algoritmos-problema-d">Problema D</a>

#### <a name="aplica-algoritmos-problema-d-bfs">BFS</a>

#### <a name="aplica-algoritmos-problema-d-dfs">DFS</a>

#### <a name="aplica-algoritmos-problema-d-a-star">A-Star</a>

### <a name="aplica-algoritmos-problema-e">Problema E</a>

#### <a name="aplica-algoritmos-problema-e-bfs">BFS</a>

#### <a name="aplica-algoritmos-problema-e-dfs">DFS</a>

#### <a name="aplica-algoritmos-problema-e-a-star">A-Star</a>

### <a name="aplica-algoritmos-problema-f">Problema F</a>

#### <a name="aplica-algoritmos-problema-f-bfs">BFS</a>

#### <a name="aplica-algoritmos-problema-f-dfs">DFS</a>

#### <a name="aplica-algoritmos-problema-f-a-star">A-Star</a>

## <a name="conclusao">Conclusão</a>

## <a name="glossario">Glossário</a>