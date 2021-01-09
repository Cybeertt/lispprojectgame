;(setq *DEFAULT-PATHNAME-DEFAULTS* (pathname "D:\\LEI\\IA\\20_21\\projeto1\\"))


(defvar *base-pathname* (or *load-truename* *compile-file-truename*))

(defun asset-path (file) (merge-pathnames file *base-pathname*))

(progn
  (load (asset-path "puzzle.lisp"))
  (load (asset-path "procura.lisp")))

(defun startup ()
  #|(load "puzzle.lisp" :if-does-not-exist nil)
  (load "procura.lisp" :if-does-not-exist nil)
  ;(menu-principal filename)|#
  (menu-principal (asset-path "problemas.dat"))
)

(defun obter-problemas (file)
  (with-open-file (s file)
    (let ((problems nil))
      (do ((prob (read s) (read s nil 'eof))) ((eq prob 'eof) (reverse problems))
        (setq problems (cons prob problems))))))


(defun menu-principal (filename)
  "Menu principal com as opcรตes do programa"
  (loop
    (progn
      (format t "~%~%~%~%~%~%~%~%~%")
      (format t "~%           _______________________________________________________")
      (format t "~%          ยง                  JOGO DO PROBlEMA DO 4               ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง                 1-Resolver o jogo                    ยง")
      (format t "~%          ยง                 2-Regras do Jogo                     ยง")
      (format t "~%          ยง                 3-Sair                               ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง______________________________________________________ยง")

      (format t "~%~%~%          Option -> ")
      )
    (cond ((not (let ((escolha (read)))
               (cond 
                ((and (numberp escolha) (< escolha 5) (> escolha 0)) (case escolha
                                                    (1 (progn (tabuleiros filename) t))
                                                    (2 (progn (regras)  t))                                                                                            (3 (progn (format t "~%~%~%          PROGRAMA TERMINADO")) (return))))
                ( T (progn  (format t "~%          ESCOLHA INVALIDA~%~%          Option -> ")
                            (setf escolha (read))))))) 
))))


(defun regras ()
  "2-Menu regras com as regras do jogo"
  (format t "
________________________________________   REGRAS DO JOGO   ________________________________________
                                          (jogo do quarto)  
                                          
     1- Esta versใo do jogo consiste num tabuleiro com 4 linhas e 4 colunas (4X4)   
     2- Em que cada casa possui uma pea com 4 atributos sem pecas repetidas                               
     3- O objectivo do jogo ้ obter 4 elementos com um atributo em comum.
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
      (format t "~%          ยง                ESCOLHA O TABULEIRO                   ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง                 1-Problema A                         ยง")
      (format t "~%          ยง                 2-Problema B                         ยง")
      (format t "~%          ยง                 3-Problema C                         ยง")
      (format t "~%          ยง                 4-Problema D                         ยง")
      (format t "~%          ยง                 5-Problema E                         ยง")
      (format t "~%          ยง                 6-Problema F                         ยง")
      (format t "~%          ยง                 7-Problema G                         ยง")
      (format t "~%          ยง                 8-Problema Teste                     ยง")
      (format t "~%          ยง                 9-Home Menu                          ยง")
      (format t "~%          ยง                                                      ยง")
      (format t "~%          ยง______________________________________________________ยง")
      (format t "~%~%~%          Opcao -> ")
      )
    (let* 
      ((tabuleiros (obter-problemas filename))
       (escolha (read)))
       ;(princ tabuleiros)
	(cond 
        
	((and (> escolha 0) (< escolha 9))
         
 	(let ((tab (nth (1- escolha) tabuleiros)))
          
         
   	(cond
   	 ((null tab) (format t "Ainda nao existe tabuleiro~%~%") (tabuleiros filename))
         
    	(T (menu-algoritmos tab filename))
	)))
        (9 (menu-principal (asset-path "problemas.dat")))
	(t (format t "Escolha invalida~%~%") (ler-tabuleiro filename)))
	)
 ))

(defun Escrever-Estatistica (start-board solution-node start-time end-time algorithm)
  "Writes the statistics file with the solution and it's statistic data, for breadth first and depth first algorithms"

  (cond (
    (null solution-node) nil)
        (t 
         (with-open-file (file (asset-path "solucao.dat") :direction :output :if-exists :append :if-does-not-exist :create)
           (progn 
             (terpri)
             (format file "~%~t  Algoritmo: ~a " algorithm)
             (format file "~%~t  Inicio: ~a:~a:~a" (first start-time) (second start-time) (third start-time))
             (format file "~%~t  Fim: ~a:~a:~a" (first end-time) (second end-time) (third end-time))
             (format file "~%~t  Numero de nos gerados: ~a" (second solution-node))
             (format file "~%~t  Numero de nos expandidos: ~a" (- (second solution-node) 1))
             (format file "~%~t  Nivel de penetracao: ~F" (penetrancia solution-node))
             (if (eq algorithm 'DFS)
                 (format file "~%~t  Profundidade Maxima: ~a" (second solution-node)))
             (format file "~%~t  Tamanho da solucao: ~a" (tamanho-solucao solution-node)))
             (terpri)
             (format file "~%~t  Solucao: ~a"  (first solution-node))
             (terpri)    (format file "~%~t  Tabuleiro-inicial:")
             (print-board start-board file)
             (terpri)
             (format file "~%~t  Tabuleiro-final:")
             (print-board (first solution-node) file)
             ))))

(defun print-board(board &optional (file-stream t))
  "lista a board"
  (not (null (mapcar #'(lambda(line) 
        (format file-stream "~%~t~t ~a" line)) board)))
  )

(defun menu-algoritmos (problema filename)
  "1.3 Sub menu escolhe algoritmo "
  (princ (cria-no problema))
  (let ((temp (tempo)))
      (loop
       (progn
         (format t "~%           ______________________________________________________")
         (format t "~%          ง                                                      ง")
         (format t "~%          ง                  ESCOLHA O ALGORITMO                 ง")
         (format t "~%          ง                 (algoritmo de procura)               ง")
         (format t "~%          ง                                                      ง")
         (format t "~%          ง                 1-Procura em largura                 ง")
         (format t "~%          ง                 2-Procura em profundidade            ง")
         (format t "~%          ง                 3-Procura em A*                      ง")
    ; (format t "~%          ง                 4-Algorithm SMA*                     ง")
         (format t "~%          ง                 0-Home Menu                          ง")
         (format t "~%          ง                                                      ง")
         (format t "~%          ง______________________________________________________ง") 
         (format t "~%~%~%          Option -> ")
         )
       (cond ((not (let ((escolha (read))) 
                     (cond 
                      ((and (numberp escolha) (< escolha 5) (> escolha -1)) (case escolha
                                                                              (1 (Escrever-Estatistica problema (bfs (cria-no problema) #'no-solucaop #'sucessores-quatro #'operadores-quatro) temp (tempo) 'BFS))
                                                                              (2 (ler-profundidade problema filename))
                                                                              (3 (Escrever-Estatistica problema (a-star (cria-no problema)  #'no-solucaop #'sucessores-quatro #'operadores-quatro #'heuristic) temp (tempo) 'A-STAR))
                                                                         ;(4 (menu-memory problema 'SMA* ))
                                                                              (0 (menu-principal filename))))
                      ( T (progn  (format t "~%          Escolha Invalida~%~%          Option -> ")
                            (setf escolha (read))))))) 
              (return))))))


(defun tempo()
  "Returns the current time with the format (h m s)"
  ;;Hour-minute-second
  (multiple-value-bind (s m h) (get-decoded-time)
    (list h m s)
    )
  )


;; ler-profundidade
;; referencia: laboratorio 6
(defun ler-profundidade (problema filename)
  (let ((temp (tempo)))
  (loop
   (progn
     (format t "~%           ______________________________________________________")
     (format t "~%          ง                    PROFUNDIDADE                      ง")
     (format t "~%          ง                                                      ง")
     (format t "~%          ง                      ATENCAO                         ง")
     (format t "~%          ง                                                      ง")
     (format t "~%          ง            SO PODE USAR NUMEROS ACIMA DE 0           ง")     
     (format t "~%          ง                     0-Home Menu                      ง")
     (format t "~%          ง                                                      ง")
     (format t "~%          ง______________________________________________________ง")
     (format t "~%~%~%          Depth-> ")
     )
   (cond ((not (let ((depth (read)))
                 (cond 
                  ((and (numberp depth) (> depth -1) ) (case depth
                                                         (0 (menu-principal filename))
                                                         (t (Escrever-Estatistica problema (dfs (cria-no problema) #'no-solucaop #'sucessores-quatro #'operadores-quatro depth) temp (tempo) 'DFS) (menu-algoritmos problema filename))))
                                                         ;(t (dfs (cria-no problema) #'no-solucaop #'sucessores-quatro #'operadores-quatro depth))))
                                                         ;(t (princ (dfs (cria-no problema) #'no-solucaop #'sucessores-quatro #'operadores-quatro depth)))))

                  ( T (progn  (format t "~%          Invalid Choice~%~%          Depth ->  ")
                        (setf depth (read))))))) 
          (return))))))



