(setq *DEFAULT-PATHNAME-DEFAULTS* (pathname "D:\\LEI\\IA\\20_21\\projeto1\\"))


(defun startup (filename)
  (load "puzzle.lisp" :if-does-not-exist nil)
  ;(use-package 'operate)
  (load "procura.lisp" :if-does-not-exist nil)
  ;(use-package 'algos)
  ;(load "problemas.dat" :if-does-not-exist nil)
  (menu-principal filename)
)

(defun obter-problemas (file)
  (with-open-file (s file)
    (let ((problems nil))
      (do ((prob (read s) (read s nil 'eof))) ((eq prob 'eof) problems)
        (setq problems (cons prob problems))))))


(defun menu-principal (filename)
  "Menu principal com as opcões do programa"
  (loop
    (progn
      (format t "~%~%~%~%~%~%~%~%~%")
      (format t "~%           _______________________________________________________")
      (format t "~%          §                  JOGO DO PROBlEMA DO 4                §")
      (format t "~%          §                                                      §")
      (format t "~%          §                                                      §")
      (format t "~%          §                                                      §")
      (format t "~%          §                                                      §")
      (format t "~%          §                 1-Resolver o jogo                    §")
      (format t "~%          §                 2-Regras do Jogo                     §")
      (format t "~%          §                 3-Mostrar Tabuleiros                 §")
      (format t "~%          §                 4-Sair                               §")
      (format t "~%          §                                                      §")
      (format t "~%          §______________________________________________________§")

      (format t "~%~%~%          Option -> ")
      )
    (cond ((not (let ((escolha (read)))
               (cond 
                ((and (numberp escolha) (< escolha 5) (> escolha 0)) (case escolha
                                                    (1 (progn (tabuleiros filename) t))
                                                    (2 (progn (regras)  t))
                                                    (3 (progn (imprime-tabs) t))
                                                    (4 (progn (format t "~%~%~%          PROGRAMA TERMINADO") nil))))
                ( T (progn  (format t "~%          ESCOLHA INVALIDA~%~%          Option -> ")
                            (setf escolha (read)))))))))))


(defun regras ()
  "2-Menu regras com as regras do jogo"
  (format t "
________________________________________   REGRAS DO JOGO   ________________________________________
                                          (jogo do quarto)  
                                          
     1- Esta vers�o do jogo consiste num tabuleiro com 4 linhas e 4 colunas (4X4)   
     2- Em que cada casa possui uma pea com 4 atributos sem pecas repetidas                               
     3- O objectivo do jogo � obter 4 elementos com um atributo em comum.
        Cada jogador tem um cavalo da sua cor (branco ou preto).                                                
     4- O jogo termina quando existem 4 elementos com um atributo comum.           
                                                                                          
_________________________________________________________________________________________________
  ")
  )


(defun tabuleiros (filename)
"1- Menu para escolher o problema a resolver"
(loop
    (progn
      (format t "~%            ______________________________________________________")
      (format t "~%          §                ESCOLHA O TABULEIRO                   §")
      (format t "~%          §                                                      §")
      (format t "~%          §                 1-Problema A                         §")
      (format t "~%          §                 2-Problema B                         §")
      (format t "~%          §                 3-Problema C                         §")
      (format t "~%          §                 4-Problema D                         §")
      (format t "~%          §                 5-Problema E                         §")
      (format t "~%          §                 6-Problema F                         §")
      (format t "~%          §                 7-Problema G                         §")
      (format t "~%          §                 8-Problema Teste                     §")
      (format t "~%          §                 9-Home Menu                          §")
      (format t "~%          §                                                      §")
      (format t "~%          §______________________________________________________§")
      (format t "~%~%~%          Opcao -> ")
      )
    (let* 
      ((tabuleiros (obter-problemas filename))
       (escolha (read)))
   
	(cond 

	((and (> escolha 0) (< escolha 9))
 	(let ((tabuleiro (nth (1- escolha) tabuleiros)))
          ;(princ tabuleiro)
   	(cond
   	 ((null tabuleiro) (format t "Ainda nao existe tabuleiro~%~%") (tabuleiros filename))
    	(T (menu-algoritmos tabuleiro filename))
	)))
	(t (format t "Escolha invalida~%~%") (ler-tabuleiro filename)))
	)
 ))

(defun menu-algoritmos (problema filename)
  "1.3 Sub menu escolhe algoritmo "
  (princ (cria-no (problema)))
  (loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          �                                                      �")
     (format t "~%          �                  ESCOLHA O ALGORITMO                 �")
     (format t "~%          �                 (algoritmo de procura)               �")
     (format t "~%          �                                                      �")
     (format t "~%          �                 1-Procura em largura                 �")
     (format t "~%          �                 2-Procura em profundidade            �")
     (format t "~%          �                 3-Procura em A*                      �")
     (format t "~%          �                 4-Algorithm SMA*                     �")
     (format t "~%          �                 0-Home Menu                          �")
     (format t "~%          �                                                      �")
     (format t "~%          �______________________________________________________�") 
     (format t "~%~%~%          Option -> ")
     )
   (cond ((not (let ((escolha (read))) 
                 (cond 
                  ((and (numberp escolha) (< escolha 5) (> escolha -1)) (case escolha
                                                                         (1 (bfs (cria-no problema) #'no-solucaop  #'sucessores-quatro #'operadores-quatro))
                                                                         (2 (ler-profundidade problema filename))
                                                                         (3 (menu-heuristic problema  'A*))
                                                                         (4 (menu-memory problema 'SMA* ))
                                                                         (0 (menu-principal filename))))
                  ( T (progn  (format t "~%          Escolha Invalida~%~%          Option -> ")
                        (setf escolha (read))))))) 
          (return)))))



;; ler-profundidade
;; referencia: laboratorio 6
(defun ler-profundidade (problema filename)

(loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          �                    PROFUNDIDADE                      �")
     (format t "~%          �                                                      �")
     (format t "~%          �                      ATENCAO                         �")
     (format t "~%          �                                                      �")
     (format t "~%          �            SO PODE USAR NUMEROS ACIMA DE 0           �")     
     (format t "~%          �                     0-Home Menu                      �")
     (format t "~%          �                                                      �")
     (format t "~%          �______________________________________________________�")
     (format t "~%~%~%          Depth-> ")
     )
(cond ((not (let ((depth (read)))
                 (cond 
                  ((and (numberp depth) (> depth -1) ) (case depth
                                                         (0 (menu-principal filename))
                                                         (t (dfs (cria-no (problema)) #'no-solucaop  #'sucessores-quatro #'operadores-quatro depth ))))
                  ( T (progn  (format t "~%          Invalid Choice~%~%          Depth ->  ")
                        (setf depth (read))))))) 
          (return)))))


(defun escrever-estatisticas ( node algoritmo  )
"Escreve o Resultado no ficheiro Solu��o "
  (with-open-file (str ("solucao.dat") 
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)

    (cond 
     ((eq node nil) (progn (format str "~%~%~%~%                          � SOLUTION NOT FOUND � ~% ~%")))
     (t (progn 
          (format str "~% ______________STATS______________ ~%")
          (format str "~% _______ ~A _______ ~%" (date-time))
          (format str "~%~% Final State: ~%")
          (pprint  (no-estado (first node)) str)
          (format str "~% ___________________________________~%")
          (format str "~%          Algorithm: ~a " algoritmo)
          (format str "~%          G (Depth): ~a " (no-profundidade (first node)))
          (format str "~%          H (Heuristic): ~a" (no-H (first node)))
          (format str "~%          Solution Length: ~a" (solution-length node)) 
          (format str "~%          Generated Nodes: ~a" (second node))
          (format str "~%          Expanded Nodes: ~a" (third node))
          (format str "~%          Penetration: ~f" (float (/ (no-profundidade (first node)) (second node))))
          (format str "~%          Points: ~d" (number-of-points node) )
          (format str "~%          Objective: ~d" (objetivo) )
          (format str "~%          Average branching factor: ~f" (branching-factor node) )
          (cond 
           ((>= (number-of-points node) (objetivo))   (format str "%~%          OBJECTIVE REACHED  ~%~%"  ))
           (T  (format str "%~%          OBJECTIVE NOT REACHED  ~%~%"  )))
          (format str "~%~%~%~%~%~%")
          ))))
  (escreve-no node)
  (menu-path node)
  )






