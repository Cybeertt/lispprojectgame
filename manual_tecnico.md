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
  * [Funções Auxiliares](#f-auxiliar)
    * [Nova-Jogada](#f-nova-jogada)
    * [Seleciona-Peca](#f-seleciona-peca)
  * [Tabuleiro-E-Pecas](#f-tabuleiro-pecas)
  * [Tabuleiro](#f-tabuleiro)
  * [Reserva](#f-reserva)
  * [Extrai-N](#f-extrai)
  * [Linha](#f-linha)
  * [Coluna](#f-coluna)
  * [Celula](#f-celula)
  * [Diagonal-2](#f-diagonal-1)
  * [Diagonal-1](#f-diagonal-2)
  * [Tabuleiro-N-Ocupado](#f-tabuleiro-ocupado)
  * [Remove-Peca](#f-remove-peca)
  * [Coloca-Peca-No-Tabuleiro](#f-coloca-peca-tabuleiro)
  * [Tem-Atributo-Igual](#f-atributo-igual)
  * [Px](#f-px)
* [Demostrações](#demo)
  * [Inserir Peça](#demo-1)
    * [Tabuleiro Vazio](#demo-11)
    * [Posição no Tabuleiro com Peça](#demo-12)
  * [Test2](#teste-2)
  * [Teste3](#teste-3)
* [// TODO](#todo)

## <a name="doc-abstract">Abstrato</a>
(sobre o jogo e o propósito do projeto e o contexto na cadeira)



## <a name="doc-estrutura">Estrutura do Projeto</a>
O projeto encontra-se distribuído por 3 ficheiros principais: project.LISP, puzzle.LISP e algorithm.LISP.

O ficheiro "project.LISP" contém o código fonte que inicializa o jogo.

O ficheiro "puzzle.LISP" contém o código fonte utilizado para criar e modificar o jogo.

O ficheiro "algorithm.LISP" contém todos os algoritmos de procura utilizados no jogo.

Em conjunto com os 3 ficheiros acima indicados, também encontram-se em anexo os Manuais de Utilizador e este manual.

O manual de utilizador apenas contém uma breve explicação sobre o jogo e como o iniciar.

## <a name="doc-func">Documentação de Funções</a>

As seguintes funções utilizadas para desenvolver o projeto, contêm o seu corpo, breve descrição, parâmetros e exemplos de chamadas e de resultados esperados.

Excecionalmente, algumas funções contêm breves observações perante o resultado esperado, para melhor ilustrar o seu uso especifico.

### <a nome="f-auxiliar">Funções Auxiliares</a>
As seguintes funções foram desenvolvidas para agilizar o processo de testes para todas as funções desenvolvidas do projeto que requerem receber por parâmetro peças e/ou coordenadas do tabuleiro.

#### <a name="f-nova-jogada">Nova-Jogada</a>
Esta função retorna um número aleatório consuante o tamanho da lista que recebe.

Em contexto do problema, esta função auxilia a escolha aleatória da posição do tabuleiro.

```lisp
;; função
(defun nova-jogada (l)
 (random (length l))
)

;; chamada
;; gera uma posição linha
(nova-jogada (tabuleiro (tabuleiro-e-pecas)))

;; resultado
0

;; chamada
;; gera uma posição coluna
(nova-jogada (tabuleiro (tabuleiro-e-pecas))

;; resultado
2
```

#### <a name="f-seleciona-peca">Seleciona-Peca</a>
Esta função retorna um elemento aleatório da lista que recebe.

Em contexto do problema, esta função auxilia
a escolha aleatória de uma peça.

```lisp
;; função
(defun seleciona-peca (p)
 (extrai-n (random (length p)) p)
)

;; chamada
(seleciona-peca (reserva (tabuleiro-e-pecas)))

;; resultado
(BRANCA QUADRADA ALTA OCA)

;; chamada
(seleciona-peca (reserva (tabuleiro-e-pecas)))

;; resultado
(PRETA REDONDA ALTA CHEIA)
```

### <a name="f-tabuleiro-pecas">Tabuleiro-E-Pecas</a>
Retorna uma lista com duas listas.

Uma lista 4x4 com elementos de valor zero e outra com 16 elementos do tipo lista com 4 carateristicas, representando peças.

```lisp
;; função
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

;; chamada
;; retorna tabuleiro e peças
(tabuleiro-e-pecas)

;; resultado
(((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0)) ((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA)))
```

### <a name="f-tabuleiro">Tabuleiro</a>
Retorna uma lista de 4 listas com 4 elementos.

O espaço do tabuleiro é representado por 0, quando a posição encontra-se vazia.

**Parametros**

tab - lista

```lisp
;; função
(defun tabuleiro (l)
 (cond 
  ((null l) nil)
  (t (car l))
 )
)

;; chamada
;; extrai só o tabuleiro
(tabuleiro (tabuleiro-e-pecas))

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
````

### <a name="f-reserva">Reserva</a>
Retorna uma lista de 16 listas com 4 elementos.

Esta lista contém todas as peças utilizadas no jogo. Cada peça é uma lista com 4 carateristicas da peça.

**Parametros**

l - Lista

```lisp
;; função
(defun reserva(l) 
 (cond 
  ((null l) nil)
  (t (cadr l))
 )
)

;; chamada
;; extrai só as peças
(reserva (tabuleiro-e-pecas))

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

**Parametros**

i - Indice

l - lista

```lisp
;; função
(defun extrai-n (i l)
 (cond
  ((< i 0) nil)
  ((null l) nil)
  ((= i 0) (car l))
  (t (extrai-n (1- i) (cdr l)))
 )
)

;; chamada
;; extrai do tabuleiro a posição -1
(extrai-n -1 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
NIL

;; chamada
;; extrai do tabuleiro a posição 0
(extrai-n 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)

;; chamada
;; extrai do tabuleiro a coordenada (0,0)
(extrai-n 0 (extrai-n 0 (tabuleiro (tabuleiro-e-pecas))))

;; resultado
0

;; chamada
;; extrai a peça na posição 0
(extrai-n 0 (reserva (tabuleiro-e-pecas)))

;; resultado
(BRANCA REDONDA ALTA OCA)
````

### <a name="f-linha">Linha</a>
Retorna uma lista com elementos que se encontram numa linha.

Esta função limita-se a ser uma função redundante da função [extrai-n](#f-extrai-n) para aumentar legibilidade do código.

**Parametros**

r - Indice de linha

tab - Tabuleiro ou reserva

```lisp
;; função
(defun linha (r tab)
 (extrai-n r tab)
)

;; chamada
;; extrai a peça na linha 0
(linha 0 (reserva (tabuleiro-e-pecas)))

;; resultado
(BRANCA REDONDA ALTA OCA)

;; explicação do resultado
;; as peças são elementos únicos, por isso ao chamar esta função, a peça na posição 0 da lista de peças é retornada

;; chamada
;; extrai do tabuleiro a linha 0
(linha 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)
```

### <a name="f-coluna">Coluna</a>
Retorna uma lista de elementos que se encontram numa coluna e limita-se a retornar 4 elementos.

Esta função limita-se a ser uma função redundante da função [celula](#f-celula) para aumentar legibilidade do código.

**Parametros**

c - Indice de coluna

tab - Tabuleiro

```lisp
;; função
(defun coluna (c tab)
 (cond 
  ((null tab) nil)
  (t (cons (celula 0 c tab) (cons (celula 1 0 tab) (cons (celula 2 c tab) (cons (celula 3 c tab) nil)))))
 )
)

;; chamada
;; extrai coluna na posição 0
(coluna 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((0,0) (1,0) (2,0) (3,0))
```

### <a name="f-celula">Celula</a>
Retorna um elementos que se encontram numa linha e coluna.

Esta função limita-se a ser uma função redundante da função [extrai-n](#f-extrai-n) para aumentar legibilidade do código.

**Parametros**

r - Indice de linha

c - Indice de coluna

tab - Tabuleiro

```lisp
;; função
(defun celula (r c tab)
 (extrai-n c (extrai-n r tab))
)

;; chamada
;; extrai das peças, o elemento na coordenada (0,0)
(celula 0 0 (reserva (tabuleiro-e-pecas)))
;; resultado
BRANCA

;; explicação do resultado
;; as peças são elementos únicos, por isso ao chamar esta função, é extraida o elemento na posição 0 da peça na posição 0

;; chamada
;; extrai do tabuleiro o elemento na coordenada (0,0)
(celula 0 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
0
```

### <a name="f-diagonal-1">Diagonal-1</a>
Retorna uma lista com elementos que se encontram na diagonal, desde da coordenada (0,0) à coordenada (3,3).

Em contexto, esta função é utilizada para retornar uma diagonal de um tabuleiro 4x4.

**Parametros**

tab - Tabuleiro

```lisp
;; função
(defun diagonal-1 (tab)
 (cond 
  ((null tab) nil)
  (t (cons (celula 0 0 tab) (cons (celula 1 1 tab) (cons (celula 2 2 tab) (cons (celula 3 3 tab) nil)))))
 )
)

;; chamada
;; retorna uma lista com as posições diagonal
;; com a orientação da topo-esquerda para a direita
(diagonal-1 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((0,0) (1,1) (2,2) (3,3))
```

### <a name="f-diagonal-2">Diagonal-2</a>
Retorna uma lista com elementos que se encontram na diagonal, desde da coordenada (3,0) à coordenada (0,3).

Em contexto, esta função é utilizada para retornar uma diagonal de um tabuleiro 4x4.

**Parametros**

tab - Tabuleiro

```lisp
;; função
(defun diagonal-2 (tab)
 (cond 
  ((null tab) nil)
  (t (cons (celula 3 0 tab) (cons (celula 2 1 tab) (cons (celula 1 2 tab) (cons (celula 0 3 tab) nil)))))
 )
)

;; chamada
;; retorna uma lista com as posições diagonal
;; com a orientação da fundo-esquerda para a direita
(diagonal-1 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((3,0) (2,1) (1,2) (0,3))
```

### <a name="f-tabuleiro-ocupado">Tabuleiro-N-Ocupado</a>
Retorna T se encontrar uma peça na posição indicada ou NIL caso eontrário.
Uma posição encontra-se vazia, se na posição (r, c), o valor é 0.

```lisp
;; função
(defun tabuleiro-n-ocupado (r c tab)
 (cond
  ((null tab) nil)
  (t (listp (celula r c tab)))
 )
)

;; chamada
;; verifica se o tabuleiro nas coordenadas (0,1) 
;; encontra-se ocupado
(tabuleiro-n-ocupado 0 1 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
T

;; chamada
;; verifica se o tabuleiro nas coordenadas (0,0) 
;; encontra-se ocupado
(tabuleiro-n-ocupado 0 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
NIL
````

### <a nome="f-remove-peca">Remove-Peca</a>
Remove um elemento de uma lista.

Em contexto, esta função permite remover um elemento da lista de reserva desde que este seja igual ao elemento p enviado por parâmetro.

```lisp
;; função
(defun remove-peca (pred p l)
 (cond
  ((or (null l) (null p)) nil)
  ((funcall pred p (car l)) (remove-peca pred p (cdr l)))
  (t (cons (car l) (remove-peca pred p (cdr l))))
 )
)

;; chamada
;; remove todas as peças da lista que seja igual à ;; peça do indice 0 da lista de reservas
(remove-peca #'(lambda (p x) (equal p x)) (linha 0 (reserva (tabuleiro-e-pecas))) (reserva (tabuleiro-e-pecas)))

;; resultado
((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))
```

### <a name="f-coloca-peca-tabuleiro">Coloca-Peca-No-Tabuleiro</a>
Insere numa lista um valor nas coordenadas enviadas por parâmetro. Quando o elemento da lista é substituído, a função retorna T, caso contrário NIL.

Em contexto, esta função permite substituir um elemento do tabuleiro que se encontre com o valor zero e remove a peça da lista de reserva. Caso não encontrar o valor zero, a operação é ignorada e nada é alterado. 

```lisp
;; função
(defun coloca-peca-no-tabuleiro (r c p tab)
 (cond
  ((listp (celula r c tab)) nil)
  (t 
   (progn 
    (setf (nth 1 (tabuleiro-e-pecas)) (remove-peca #'(lambda (p x) (equal p x)) p (reserva (tabuleiro-e-pecas))))
    (setf (nth r (nth c tab)) p) 
    'T
   )
  )
 )
)

;; chamada
;; insere peça na posição 0 nas coordenadas (0,0)
;; do tabuleiro
(coloca-peca-no-tabuleiro 0 0 (extrai-n 0 (reserva (tabuleiro-e-pecas))) (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(BRANCA QUADRADA ALTA CHEIA)

;; chamada
;; insere novamente peça na posição 0 nas 
;;coordenadas (0,0) do tabuleiro
(coloca-peca-no-tabuleiro 0 0 (extrai-n 0 (reserva (tabuleiro-e-pecas))) (tabuleiro (tabuleiro-e-pecas)))

;; resultado
NIL
````
### <a name="f-atributo-igual">Tem-Atributo-Igual</a>
Esta função retorna o valor T ou Nil consuante as peças que compara.
Em contexto do problema, esta função compara duas peças, procurando pelo menos na existencia de um atributo em comum.

```lisp
;; função
(defun tem-atributo-igual (p p2)
 (cond
  ((or (null p) (null p2)) nil)
  ((not (equal (car p) (car p2))) (tem-atributo-igual (cdr p) (cdr p2)))
  (t T)
 )
)

;; chamada
(tem-atributo-igual (tem-atributo-igual (extrai-n 0 (reserva (tabuleiro-e-pecas))) (extrai-n 0 (reserva (tabuleiro-e-pecas)))))

;; resultado
T

;; chamada
;; tabuleiro vazio
(tem-atributo-igual (tem-atributo-igual (extrai-n 0 (reserva (tabuleiro-e-pecas))) (extrai-n 0 (extrai-n 0 (tabuleiro (tabuleiro-e-pecas))))))

;; resultado
NIL
```

### <a name="f-px">Px</a>
Esta função retorna o valor mais alto de uma lista.
Em contexto do problema, esta função retorna a contagem máxima de peças com pelo menos um atributo em comum.

```lisp
;; função
(defun px (l)
 (cond 
  ((null l) 0)
  (t (max (car l) (px (cdr l))))
 )
)

;; chamada
(px '(0 1 1 2 3 0 1 3 0 1 3 4 2 2))

;; resultado
4

;; chamada
(px '(0 0 0))

;; resultado
0
```

## <a name="demo">Demostrações</a>
Coloca aleatóriamente uma peça aleatória, num dos espaços do tabuleiro, três vezes.

### <a name="demo-1">Inserir Peça</a>

#### <a name="demo-11">Tabuleiro Vazio</a>
Inserir uma peça aleatóreamente, numa posição aleatória no tabuleiro vazio.

Resultado Esperado:
* O tabuleiro contém uma peça numa dada posição.

```lisp
;; chamada
;; visualização do estado do tabuleiro
(tabulerio (tabueiro-e-pecas))

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

;; chamada
;; ???? remover
(coloca-peca-no-tabuleiro 
(nova-jogada (tabulerio (tabueiro-e-pecas)) 
(nova-jogada (car (tabulerio (tabueiro-e-pecas)))) 
(seleciona-peca (reserva (tabuleiro-e-pecas))) 
(tabulerio (tabueiro-e-pecas))
)

;; resultado
;; peça removida da reserva e inserida no tabuleiro
(BRANCA QUADRADA ALTA CHEIA)

;; chamada
;; visualização do estado do tabuleiro
(tabulerio (tabueiro-e-pecas))

;; resultado
;; 
((0 (BRANCA QUADRADA ALTA CHEIA) 0 0) 
(0 0 0 0) (0 0 0 0) (0 0 0 0))
````

#### <a name="demo-12">Posição no Tabuleiro com Peça</a>
(Descrição aqui)

```lisp
;; chamada
(tabulerio)

;; resultado
((0 (BRANCA QUADRADA ALTA CHEIA) 0 0) 
(0 0 0 0) (0 0 0 0) (0 0 0 0))

;; chamada
(coloca-peca-no-tabuleiro 
(nova-jogada (tabulerio (tabueiro-e-pecas)) 
(nova-jogada (car (tabulerio (tabueiro-e-pecas)))) 
(seleciona-peca (reserva (tabuleiro-e-pecas))) 
(tabulerio (tabueiro-e-pecas))
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
(nova-jogada (tabulerio (tabueiro-e-pecas)) 
(nova-jogada (car (tabulerio (tabueiro-e-pecas)))) 
(seleciona-peca (reserva (tabuleiro-e-pecas))) 
(tabulerio (tabueiro-e-pecas))
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

# <a name="Lista de Algoritmos">Lista de Algoritmos</a>


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



```

### <a name="teste-1-dfs">Teste 1 Procura em Comprimento</a>

Chamar a função de Procura em Comprimento com o nó inicial, nó objetivo, sucessores, operadores e profundidade.

```lisp



```

### <a name="teste-1-a-star">Teste 1 Procura em A*</a>

Chamar a função de Procura em A* com o nó inicial, nó objetivo, sucessores, operadores, profundidade e heuristica.

```lisp



```