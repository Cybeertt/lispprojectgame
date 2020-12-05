# Manual Técnico

(Identificação)

(Breve introdução ao manual...)

## Indice
* [Extrutura do Projeto](#doc-extrutura)
* [Documentação de Funções](#doc-func)
    * [Tabuleiro](#f-tabuleiro)
    * [Pecas](#f-pecas)
    * [Extrai-N](#f-extrai)
    * [Tabuleiro-N-Ocupado](#f-tabuleiro-ocupado)
    * [Coloca-Peca-No-Tabuleiro](#f-coloca-peca-tabuleiro)
    * [Nova-Jogada](#f-nova-jogada)
    * [Seleciona-Peca](#f-seleciona-peca)
* [Simulação](#sim)
    * [Teste 1](#teste-1)
    * [Test2](#teste-2)
    * [Teste3](#teste-3)
* [// TODO](#todo)

## <a name="doc-estrutura">Estrutura do Projeto</a>

(Breve descrição da estrutura e ficheiros ...)

## <a name="doc-func">Documentação de Funções</a>

(Breve descrição ...)

### <a name="f-tabuleiro">Tabuleiro</a>
Retorna uma lista de 4 listas com 4 elementos.
O espaço do tabuleiro é representado por 0, quando a posição encontra-se vazia.

```lisp
;; função
(defun tabuleiro ()
 '(
  (0 0 0 0)
  (0 0 0 0)
  (0 0 0 0)
  (0 0 0 0)
 )
)

;; chamada
(tabuleiro)

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
````

### <a name="f-pecas">Pecas</a>
Retorna uma lista de 16 listas com 4 elementos.
Esta lista contém todas as peças utilizadas no jogo. Cada peça é uma lista com 4 carateristicas da peça.

```lisp
;; função
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

;; chamada
(pecas)

;; resultado
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) 
(PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) 
(BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) 
(PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) 
(BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) 
(BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))
````

### <a name="f-extrai">Extrai-N</a>
Retorna o elemento que se encontra no índice indicado. Caso o índice for inválido, retorna NIL.
Esta função tem como propósito simular a função Peek.

```lisp
;; função
(defun extrai-n (i l)
 (cond
  ((< i 0) nil)
  ((null l) nil)
  ((= i 0) (car l))
  (t (extrai-n (1- i) (cdr l))) ; recursividade para achar o indice
 )
)

;; chamada
(extrai-n -1 (tabuleiro))

;; resultado
NIL

;; chamada
(extrai-n 0 (tabuleiro))

;; resultado
(0 0 0 0)

;; chamada
(extrai-n 0 (extrai-n 0 (tabuleiro)))

;; resultado
0

;; chamada
(extrai-n 0 (pecas))

;; resultado
(BRANCA REDONDA ALTA OCA)
````

### <a name="f-tabuleiro-ocupado">Tabuleiro-N-Ocupado</a>
Retorna T se encontrar uma peça na posição indicada ou NIL caso eontrário.
Uma posição encontra-se vazia, se na posição (r, c), o valor é 0.

```lisp
;; função
(defun tabuleiro-n-ocupado (r c tab)
 (cond
  ((null tab) nil); tab vazia
  (t (listp (extrai-n c (extrai-n r tab))))
 )
)

;; chamada
(tabuleiro-n-ocupado 0 1 (tabuleiro))

;; resultado
T
````

### <a name="f-coloca-peca-tabuleiro">Coloca-Peca-No-Tabuleiro</a>
Insere numa lista um valor

```lisp
;; função
(defun coloca-peca-no-tabuleiro (r c p tab)
 (cond
  ((listp (extrai-n c (extrai-n r tab))) nil)
  (t (setf (nth r (nth c tab)) p))
 )
)

;; chamada (usa funções auxiiliares)
(coloca-peca-no-tabuleiro 
 (nova-jogada (tabuleiro)) 
 (nova-jogada (car (tabuleiro))) 
 (seleciona-peca (pecas)) 
 (tabuleiro)
)

;; resultado
(BRANCA QUADRADA ALTA CHEIA)
````

### <a name="f-nova-jogada">Nova-Jogada</a>
Esta função retorna um número aleatório consuante o tamanho da lista que recebe.
Em contexto do problema, esta função auxilia a escolha não inteligente da posição do tabuleiro.

```lisp
;; função
(defun nova-jogada (l)
 (random (length l))
)

;; chamada
;; gera uma posição linha
(nova-jogada (tabuleiro))

;; resultado
0

;; chamada
;; gera uma posição coluna
(nova-jogada (car (tabuleiro))

;; resultado
2
```

### <a name="f-seleciona-peca">Seleciona-Peca</a>
Esta função retorna um elemento aleatório da lista que recebe.
Em contexto do problema, esta função auxilia
a escolha não inteligente de uma peça.

```lisp
;; função
(defun seleciona-peca (p)
 (extrai-n (random (length p)) p)
)

;; chamada
(seleciona-peca (pecas))

;; resultado
(BRANCA QUADRADA ALTA OCA)
```

## <a name="sim">Simulação</a>

### <a name="teste-1">Teste 1</a>
Preencher o tabuleiro pela primeira vez.

```lisp
;; chamada
(tabulerio)

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

;; chamada
(coloca-peca-no-tabuleiro 
(nova-jogada (tabuleiro)) 
(nova-jogada (car (tabuleiro))) 
(seleciona-peca (pecas)) 
(tabuleiro)
)

;; resultado
(BRANCA QUADRADA ALTA CHEIA)

;; chamada
(tabulerio)

;; resultado
((0 (BRANCA QUADRADA ALTA CHEIA) 0 0) 
(0 0 0 0) (0 0 0 0) (0 0 0 0))
````

### <a name="teste-2">Teste 2</a>
Preencher tabuleiro doo teste anterior.

```lisp
;; chamada
(tabulerio)

;; resultado
((0 (BRANCA QUADRADA ALTA CHEIA) 0 0) 
(0 0 0 0) (0 0 0 0) (0 0 0 0))

;; chamada
(coloca-peca-no-tabuleiro 
(nova-jogada (tabuleiro)) 
(nova-jogada (car (tabuleiro))) 
(seleciona-peca (pecas)) 
(tabuleiro)
)

;; resultado
(PRETA REDONDA BAIXA OCA)

;; chamada
(tabulerio)

;; resultado
((0 (BRANCA QUADRADA ALTA CHEIA) 
(PRETA REDONDA BAIXA OCA) 0) 
(0 0 0 0) (0 0 0 0) (0 0 0 0))
````

### <a name="teste-3">Teste 3</a>
Preencher tabuleiro doo teste anterior.

```lisp
;; chamada
(tabulerio)

;; resultado
((0 (BRANCA QUADRADA ALTA CHEIA) 
(PRETA REDONDA BAIXA OCA) 0) 
(0 0 0 0) (0 0 0 0) (0 0 0 0))

;; chamada
(coloca-peca-no-tabuleiro 
(nova-jogada (tabuleiro)) 
(nova-jogada (car (tabuleiro))) 
(seleciona-peca (pecas)) 
(tabuleiro)
)

;; resultado
(BRANCA QUADRADA ALTA OCA)

;; chamada
(tabulerio)

;; resultado
((0 (BRANCA QUADRADA ALTA CHEIA) 
(PRETA REDONDA BAIXA OCA) 0) 
(0 0 0 0) (0 0 0 0) 
(0 (BRANCA QUADRADA ALTA OCA) 0 0))
````

###  <a name="todo">// TODO</a>
(adiciona mais aqui ...)