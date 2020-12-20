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
  * [Colunas](#f-colunas)
  * [Celula](#f-celula)
  * [Diagonal-2](#f-diagonal-1)
  * [Diagonal-1](#f-diagonal-2)
  * [Diagonais](#f-diagonais)
  * [Tabuleiro-N-Ocupado](#f-tabuleiro-ocupado)
  * [Remove-Peca](#f-remove-peca)
  * [Filtra](#f-filtra)
  * [Coloca-Peca-No-Tabuleiro](#f-coloca-peca-tabuleiro)
  * [Tem-Atributo-Igual](#f-atributo-igual)
  * [Conta-Pecas](#f-conta)
  * [Conta-Pecas-No-Tabuleiro](#f-conta-tabuleiro)
  * [Px](#f-px)
  * [Mostra-Linha](#f-mostra-linha)
  * [Mostra-Tabuleiro](#f-mostra-tabuleiro)
* [Demostrações](#demo)
  * [Inserir Peça](#demo-1)
    * [Tabuleiro Vazio](#demo-11)
    * [Posição no Tabuleiro com Peça](#demo-12)
  * [Test2](#teste-2)
  * [Teste3](#teste-3)
* [// TODO](#todo)
* [Glossário](#doc-glossario)

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

O ficheiro ***puzzle.LISP*** contém o código fonte utilizado para criar e modificar o jogo.

O ficheiro ***procura.LISP*** contém todos os algoritmos de procura utilizados no jogo e é definido como pacote **algo**.

Ao abrir o ficheiro ***procura.LISP***, por este ser um pacote, o IDE LispWorks pede sempre para criar o pacote no IDE. Todo este processo é responsabilidade do IDE e é automático.

Em conjunto com os 3 ficheiros acima indicados, também se encontram em anexo os ***manual de utilizador*** e ***problemas.dat***.

O ***manual de utilizador*** apenas contém uma breve explicação sobre o jogo e como o iniciar.

O ***problemas.dat*** contém em formato de lista em Commun Lisp, uma série de tabuleiros com peças em situações diferentes. 

Este ficheiro guarda vários tabuleiros com peças pré-colocadas. Cada tabuleiro será selecionado para continuar o jogo no tabuleiro atual.

## <a name="doc-func">Documentação de Funções</a>

As seguintes funções utilizadas para desenvolver o projeto, contêm o seu corpo, breve descrição, parâmetros e exemplos de chamadas e de resultados esperados.

Excecionalmente, algumas funções contêm breves observações perante o resultado esperado, para melhor ilustrar o seu uso especifico.

### <a nome="f-auxiliar">Funções Auxiliares</a>
As seguintes funções foram desenvolvidas para agilizar o processo de testes para todas as funções desenvolvidas do projeto que requerem receber por parâmetro peças e/ou coordenadas do tabuleiro.

#### <a name="f-nova-jogada">Nova-Jogada</a>
Esta função retorna um número aleatório consuante o tamanho da lista que recebe.

Em contexto do problema, esta função auxilia a escolha aleatória da posição do tabuleiro.

**Parâmetros**

*l - Lista*

```lisp
;; função
(defun nova-jogada (l)
 (random (length l))
)
```

```lisp
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

**Parâmetros**

*p - Peça*

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

#### <a name="f-tabuleiro-pecas">Tabuleiro-E-Pecas</a>
Retorna uma lista com duas listas.

Uma lista 4x4 com elementos de valor zero e outra com 16 elementos do tipo lista com 4 carateristicas, representando peças.

**Parâmetros**

*Nenhum*

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
```

```lisp
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

*l - Lista*

```lisp
;; função
(defun tabuleiro (l)
 (cond 
  ((null l) nil)
  (t (car l))
 )
)
```

```lisp
;; chamada
;; extrai só o tabuleiro
(tabuleiro (tabuleiro-e-pecas))

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

### <a name="f-reserva">Reserva</a>
Retorna uma lista de 16 listas com 4 elementos.

Esta lista contém todas as peças utilizadas no jogo. Cada peça é uma lista com 4 carateristicas da peça.

**Parametros**

*l - Lista*

```lisp
;; função
(defun reserva(l) 
 (cond 
  ((null l) nil)
  (t (cadr l))
 )
)
```

```lisp
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
```

### <a name="f-extrai">Extrai-N</a>
Retorna o elemento que se encontra no índice indicado. Caso o índice for inválido, retorna NIL.

Esta função tem como propósito simular a função Peek.

**Parametros**

*i - Indice*

*l - lista*

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
```

```lisp
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
```

### <a name="f-linha">Linha</a>
Retorna uma lista com elementos que se encontram numa linha.

Esta função limita-se a ser uma função redundante da função [extrai-n](#f-extrai) para aumentar legibilidade do código.

**Parametros**

*r - Indice de linha*

*tab - Tabuleiro ou reserva*

```lisp
;; função
(defun linha (r tab)
 (extrai-n r tab)
)
```

```lisp
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

*c - Indice de coluna*

*tab - Tabuleiro*

```lisp
;; função
(defun coluna (c tab)
 (cond 
  ((null tab) nil)
  (t (cons (celula 0 c tab) (cons (celula 1 0 tab) (cons (celula 2 c tab) (cons (celula 3 c tab) nil)))))
 )
)
```

```lisp
;; chamada
;; extrai coluna na posição 0
(coluna 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((0,0) (1,0) (2,0) (3,0))
```

### <a name="f-colunas">Colunas</a>
(descrição)

**Limitações**
Limita-se ao tamanho máximo 4 do número de elementos por coluna, do tabuleiro.

**parametros**

*tab - Tabuleiro*

```lisp
;; função
(defun colunas (tab)
 (cons (coluna 0 tab) (cons (coluna 1 tab) (cons (coluna 2 tab) (cons (coluna 3 tab) nil))))
)
```

```lisp
;; chamada
(colunas (tabuleiro (tabuleiro-e-pecas)))

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))
```

### <a name="f-celula">Celula</a>
Retorna um elementos que se encontram numa linha e coluna.

Esta função limita-se a ser uma função redundante da função [extrai-n](#f-extrai) para aumentar legibilidade do código.

**Parametros**

*r - Indice de linha*

*c - Indice de coluna*

*tab - Tabuleiro*

```lisp
;; função
(defun celula (r c tab)
 (extrai-n c (extrai-n r tab))
)
```

```lisp
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

*tab - Tabuleiro*

```lisp
;; função
(defun diagonal-1 (tab)
 (cond 
  ((null tab) nil)
  (t (cons (celula 0 0 tab) (cons (celula 1 1 tab) (cons (celula 2 2 tab) (cons (celula 3 3 tab) nil)))))
 )
)
```

```lisp
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

*tab - Tabuleiro*

```lisp
;; função
(defun diagonal-2 (tab)
 (cond 
  ((null tab) nil)
  (t (cons (celula 3 0 tab) (cons (celula 2 1 tab) (cons (celula 1 2 tab) (cons (celula 0 3 tab) nil)))))
 )
)
```

```lisp
;; chamada
;; retorna uma lista com as posições diagonal
;; com a orientação da fundo-esquerda para a direita
(diagonal-1 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0)

;; representação do resultado com coordenadas
;; ((3,0) (2,1) (1,2) (0,3))
```

### <a name="f-colunas">Diagonais</a>
(descrição)

**Limitações**
Limita-se ao tamanho máximo 4 do número de elementos por diagonal, do tabuleiro.

**parametros**

*tab - Tabuleiro*

```lisp
;; função
(defun diagonais (tab)
 (cons (diagonal-1 tab) (cons (diagonal-2 tab) nil))
)
```

```lisp
;; chamada
(diagonais (tabuleiro (tabuleiro-e-pecas)))

;; resultado
((0 0 0 0) (0 0 0 0))
```

### <a name="f-tabuleiro-ocupado">Tabuleiro-N-Ocupado</a>
Retorna T se encontrar uma peça na posição indicada ou NIL caso eontrário.
Uma posição encontra-se vazia, se na posição (r, c), o valor é 0.

**Parâmetros**

*r - Linha*

*c - Coluna*

*tab - Tabuleiro*

```lisp
;; função
(defun tabuleiro-n-ocupado (r c tab)
 (cond
  ((null tab) nil)
  (t (listp (celula r c tab)))
 )
)
```

```lisp
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
```

### <a nome="f-remove-peca">Remove-Peca</a>
Remove um elemento de uma lista.

Em contexto, esta função permite remover um elemento da lista de reserva desde que este seja igual ao elemento p enviado por parâmetro.

**Parâmetros**

*pred - Função que retorna T ou NIL*

*p - Peça*

*l - Lista reserva*

```lisp
;; parâmetro pred
;; avalia se duas peças são iguais
;; retorna T se verdade, caso contrário NIL
;; #'(lambda (p x) (equal p x))

;; função
(defun remove-peca (pred p l)
 (cond
  ((or (null l) (null p)) nil)
  ((funcall pred p (car l)) (remove-peca pred p (cdr l)))
  (t (cons (car l) (remove-peca pred p (cdr l))))
 )
)
```

```lisp
;; chamada
;; remove todas as peças da lista que seja igual à ;; peça do indice 0 da lista de reservas
(remove-peca #'(lambda (p x) (equal p x)) (linha 0 (reserva (tabuleiro-e-pecas))) (reserva (tabuleiro-e-pecas)))

;; resultado
((PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (PRETA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))
```

### <a name="f-filtra">Filtra</a>
Recebe uma lista e remove todos os elementos consuante a condição enviada por parâmetro.

**Limitações**

Não compatível com elementos sublista.

**Parametros**

*pred - Função que retorna T ou NIL*

*l - Lista*


```lisp
;; parâmetro pred
;; avalia se um elemento é igual a 0
;; retorna T se verdade, caso contrário NIL
;; #'(lambda (x) (equal 0 x))

;; função
(defun filtra(pred l)
 (cond 
  ((null l) nil)
  ((funcall pred (car l)) (filtra pred (cdr l)))
  (t (cons (car l) (filtra pred (cdr l))))
 )
)
```

```lisp
;; chamada
;; filtra linha 0 do tabuleiro vazio
(filtra #'(lambda (x) (equal 0 x)) (linha 0   (tabuleiro (tabuleiro-e-pecas))))

;; resultado
NIL

;; chamada
;; filtra a coluna do tabuleiro vazio
(filtra #'(lambda (x) (equal 0 x)) (coluna 0 (tabuleiro (tabuleiro-e-pecas))))

;; resultado
NIL
```

```lisp
;; lista de exemplo
(defun linha-0 ()
 '((branca quadrada alta oca) (preta quadrada baixa cheia) 0 (preta quadrada alta oca))
)

;; chamada
;; chama a lista linha-0
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) 0 (PRETA QUADRADA ALTA OCA))

;; chamada
;; remove todos os elementos iguais a zero
(filtra #'(lambda (x) (equal 0 x)) (linha-0))

;; resultado
((BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA BAIXA CHEIA) (PRETA QUADRADA ALTA OCA))
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
```

```lisp
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
```

### <a name="f-atributo-igual">Tem-Atributo-Igual</a>
Esta função retorna o valor T ou Nil consuante as peças que compara.
Em contexto do problema, esta função compara duas peças, procurando pelo menos na existencia de um atributo em comum.

**Limitações**
Todos os elementos em p e p2 são 0 ou lista.

**Parâmetros**

*p - Peça 1*
*p2 - Peça 2*

```lisp
;; função
(defun tem-atributo-igual (p p2)
 (cond
  ((or (null p) (null p2)) nil)
  ((not (equal (car p) (car p2))) (tem-atributo-igual (cdr p) (cdr p2)))
  (t T)
 )
)
```

```lisp
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

### <a nome="f-conta">Conta-Pecas</a>
Retorna a contagem de elementos sublista que partilham pelo menos um elemento em comum.

Em contexto, esta função conta quantas peças com pelo menos um atributo em comum possuem, relativamente a uma [linha](#f-linha), [coluna](#f-coluna), [diagonal-1](f-diagonal-1) e [diagonal-2](#f-diagonla-2) do tabuleiro, após aplicado o [filtro](#f-filtro).

***Limitações**

Herda as limitações da função [tem-atributo-igual](#f-atributo-igual).

**Parâmetros**

*l - Lista*

```lisp
;; função
(defun conta-pecas (l)
 (cond 
  ((null l) 0)
  ((and (not (null (car l))) (null (cadr l)) 1))
  ((null (cadr l)) 0)
  ((tem-atributo-igual (car l) (cadr l)) (1+ (conta-pecas (cdr l))))
  (t 0)
 )
)
```

```lisp
;; lista de exemplo
(defun linha-0 ()
 '((branca quadrada alta oca) (preta quadrada baixa cheia) 0 (preta quadrada alta oca))
)

;; chamada
;; conta númmero de peças que partilhe pelo menos
;; um atributo em comum
;; ao chamar a função, a lista é filtrada no perâmetro
(conta-pecas (filtra #'(lambda (x) (equal 0 x)) (cdr (pecas-1))))

;; resultado
3
```

### <a name="f-conta-pecas-tabuleiro">Conta-Pecas-Tabuleiro</a>
Retorna um lista com a contagem de todas os elementos que partilhem pelo menos um atributo em comum, por linha, coluna e as diagonais.

Em contexto, esta função pretende contar o total de peças por linha, coluna e diagonais, para verificar qual o máximo de peças alinhadas no tabuleiro, sendo o valor 0 o mínimo e o valor 4 o máximo.

**Limitações**
Esta função limita-se ao tamanho 4, defenido ser o tamanho máximo de cada linha, coluna e diagonais.

**Parâmetros**

*tab - Tabuleiro*

```lisp
;; função
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
```

```lisp
;; chamada
;; conta o número de peças no tabuleiro, por
;; linha, coluna e diagonais
(conta-pecas-tabuleiro (tabuleiro (tabuleiro-e-pecas)))

;; resultado
(0 0 0 0 0 0 0 0 0 0)
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
```

```lisp
;; chamada
;; retorna o valor maior da lista
(px '(0 1 1 2 3 0 1 3 0 1 3 4 2 2))

;; resultado
4

;; chamada
;; retorna o valor maior da lista
(px '(0 0 0))

;; resultado
0
```

### <a name="f-mostra-linha">Mostra-Linha</a>
Esta função retorna a formatação de uma lista em string.

Em contexto, esta função permite ilustrar melhor os espaços do tabuleiro com e sem peças numa linha.

**Limitações**

A função limita-se a considerar o número máximo de elementos por linha, que é 4.

**Parâmatros**

*i - Indice*

*l - Lista*

```lisp
;; função
(defun mostra-linha (i l)
 (let* ((li (linha i l)) (rows "| ~A | ~A | ~A | ~A |"))
  (format nil rows (extrai-n 0 li) (extrai-n 1 li) 
  (extrai-n 2 li) (extrai-n 3 li))
 )
)
```

```lisp
;; chamada
(mostra-linha 0 (tabuleiro (tabuleiro-e-pecas)))

;; resultado
"| 0 | 0 | 0 | 0 |"
```

### <a name="f-mostra-tabela">Mostra-Tabela</a>
Esta função retorna a formatação de uma lista com sublistas em string.

Em contexto, esta função permite ilustrar melhor os espaços de um tabuleiro com e sem peças.

**Limitações**
A função apresenta as mesmas limitações que a função [Mostrar-Linha](#f-mostra-linha).

**Parâmetros**

*tab - Tabuleiro*

```lisp
;; função
(defun mostra-tabuleiro (tab)
 (let ((seperator "_________________________________________________________________________________________________________________________"))
  (format nil "~%TABULEIRO~%~A~%~A~%~A~%~A~%~A~%~A~%~%" 
  seperator (print-row 0 tab) (print-row 1 tab) 
  (print-row 2 tab) (print-row 3 tab) seperator)
 )
)
```

```lisp
;; chamada
;; mostra tabuleiro vazio
 (mostra-tabuleiro (tabuleiro (tabuleiro-e-pecas)))

;; resultado
"
TABULEIRO
_________________________________________________________________________________________________________________________
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
_________________________________________________________________________________________________________________________

"

;; lista 
;; tabuleiro de exemplo
(defun tabuleiro-exemplo ()
 '(((branca quadrada alta oca) (preta quadrada baixa cheia) 0 (preta quadrada alta oca))
((branca redonda alta oca) (preta redonda alta oca) (branca redonda alta cheia) 0) 
(0 (preta redonda alta cheia) (preta redonda baixa cheia) 0) 
((branca redonda baixa oca) (branca quadrada alta cheia) (preta redonda baixa oca) (branca quadrada baixa cheia)))
)

;; chamada
;; mostra tabuleiro preenchido
(mostra-tabuleiro (tabuleiro-exemplo))

;; resultado
"
TABULEIRO
_________________________________________________________________________________________________________________________
| (BRANCA QUADRADA ALTA OCA) | (PRETA QUADRADA BAIXA CHEIA) | 0 | (PRETA QUADRADA ALTA OCA) |
| (BRANCA REDONDA ALTA OCA) | (PRETA REDONDA ALTA OCA) | (BRANCA REDONDA ALTA CHEIA) | 0 |
| 0 | (PRETA REDONDA ALTA CHEIA) | (PRETA REDONDA BAIXA CHEIA) | 0 |
| (BRANCA REDONDA BAIXA OCA) | (BRANCA QUADRADA ALTA CHEIA) | (PRETA REDONDA BAIXA OCA) | (BRANCA QUADRADA BAIXA CHEIA) |
_________________________________________________________________________________________________________________________

"
```

## <a name="demo">Demostrações</a>
Coloca aleatóriamente uma peça aleatória, num dos espaços do tabuleiro, três vezes.

### <a name="demo-1">Inserir Peça</a>

#### <a name="demo-11">Tabuleiro Vazio</a>
**Demostração**

Inserir uma peça aleatóreamente, numa posição aleatória no tabuleiro vazio, recorrendo às [funções auxiliares](#f-auxiliar).

**Resultado Esperado:**

O tabuleiro contém uma peça p numa dada coordenada (r, c) e é removida da reserva a peça p.

```lisp
;; chamada
;; visualização do estado do tabuleiro
(tabulerio (tabueiro-e-pecas))

;; resultado
((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

;; chamada
;; coloca peça aleatória numa coordenada aleatória
;; do tabuleiro
(coloca-peca-no-tabuleiro (nova-jogada (linha 0 (tabuleiro (tabuleiro-e-pecas)))) (nova-jogada (coluna 0 (tabuleiro (tabuleiro-e-pecas)))) (seleciona-peca (reserva (tabuleiro-e-pecas))) (tabuleiro (tabuleiro-e-pecas)))

;; resultado
;; pedra aleatóriamente selecionada
(PRETA REDONDA ALTA CHEIA)

;; chamada
;; visualização do estado do tabuleiro
(tabuleiro (tabuleiro-e-pecas))

;; resultado
((0 0 0 0) (0 0 (PRETA REDONDA ALTA CHEIA) 0) (0 0 0 0) (0 0 0 0))

;; chamada
;; visualização do estado da reserva
(reserva (tabuleiro-e-pecas))

;;resultado
((BRANCA REDONDA ALTA OCA) (PRETA REDONDA ALTA OCA) (BRANCA REDONDA BAIXA OCA) (PRETA REDONDA BAIXA OCA) (BRANCA QUADRADA ALTA OCA) (PRETA QUADRADA ALTA OCA) (BRANCA QUADRADA BAIXA OCA) (PRETA QUADRADA BAIXA OCA) (BRANCA REDONDA ALTA CHEIA) (BRANCA REDONDA BAIXA CHEIA) (PRETA REDONDA BAIXA CHEIA) (BRANCA QUADRADA ALTA CHEIA) (PRETA QUADRADA ALTA CHEIA) (BRANCA QUADRADA BAIXA CHEIA) (PRETA QUADRADA BAIXA CHEIA))
```

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

## <a name="doc-glossario">Glossário</a>