org 0x7e00
jmp 0x0000:start


data: ;Falas
    titulo      db ' Destiny VI', 0
    Destino     db ' Jogar Destino (1)', 0
    JogoDaVelha db ' Jogo da Velha (2)', 0
    instrucoes  db ' Sobre (3)', 0
    creditos    db ' Creditos (4)', 0

    pss     db 'Pressione 1', 0

    ini     db 'Voce eh um(a) estudante do ensino medio lutado contra o EaD e tentando', 0
    ini2    db 'superar esse monstro.', 0

    h1      db 'Voce encontra uma menina na biblioteca, o que fazer:', 0
    h11     db '1 - Dizer bom dia', 0
    h12     db '2 - Agredi-la', 0

    he      db 'Voce descobre que o nome da menina eh Camila, mas ao dizer bom dia ela', 0
    he1     db 'lhe corrige com um boa tarde.', 0
    he11    db '1 - Agradecer', 0
    he12    db '2 - Discutir', 0

    hee     db 'Voce e Camila comecam a se dar bem, porem descobrem que gostam da mesma', 0
    hee1    db 'pessoa.', 0
    hee11   db '1 - Fazer um bem bolado', 0
    hee12   db '2 - Gancho de direita', 0

    heee    db 'O amor de suas vidas diz que nao sente nada por Voces e que, na verdade,', 0
    heee1   db 'gosta de uma amiga em comum. Voces, entao, se tornam cumplices e planejam', 0
    heee2   db 'um assassinato dessa outra amiga.', 0

    heed    db 'Depois de uma briga feroz, as duas acabam no hospital, posteriormente', 0
    heed1   db 'se encontram na penitenciaria, formando gangues opostas e lutando .', 0
    heed2   db 'eternamente...', 0

    hed     db 'A discussao se desenrola numa briga, a bibliotecaria chama a policia, que', 0
    hed1    db 'chegar interrompe a confusao.', 0
    hed11   db '1 - Resistir a prisao', 0
    hed2    db '2 - Fugir', 0
    
    hedd    db 'Voce viaja para Miami com o dinheiro que sua avo guardava no colchao a 67', 0
    hedd1   db 'anos (ela fica chateada), la o destino sorri para Voce, que se descobre', 0
    hedd2   db 'um coach e passa a motivar jovens que gostam de frequentar bibliotecas', 0
    hedd3   db 'a vencer na vida.', 0
    
    hd      db 'A menina, Camila, puxa uma faca da bolsa e ameaca lhe matar.', 0
    hd1     db '1 - Defender', 0
    hd2     db '2 - Atacar', 0
    
    hde     db 'Voce desvia do ataque, Camila tropeca e se fere com a propria faca.', 0
    hde1    db '1 - Ajudar', 0
    hde2    db '2 - Ir embora', 0
    
    hdee    db 'Camila sofre de uma hemorragia e sangra ate a morte, Voce ouve a noticia', 0
    hdee1   db 'na televisao no dia seguinte e se sente culpado, entra numa depressao,', 0
    hdee2   db 'profunda e dias depois se entrega a policia, que te prende por omissao.', 0
    hdee3   db 'de socorro', 0
    
    hded    db 'Voce, formado em greys anatomy, ajuda Camila, Voces percebem um amor em', 0
    hded1   db 'comum em medicina e passam a estudar para o vestibular em conjunto.', 0
    
    hdd     db 'Voce da uma cabecada em Camila, a empurrando em direcao a uma janela que', 0
    hdd1    db 'se quebra. Voces caem juntos(as) e Camila se fere.', 0
    hdd11   db '1 - Ajudar Camila', 0
    hdd12   db '2 - Pedir ajuda', 0
    
    hddd    db 'A ajuda chega, voces sao levados(as) para a enfermaria e enquanto sao', 0
    hddd1   db 'tratados(as) conversam sobre a vida, o universo e tudo mais. No final,', 0
    hddd2   db 'voces percebem que se gostam e que isso eh maior do que suas diferencas.', 0
    hddd3   db 'Esse relacionamento se desenvolve e ambos comecam a compartilhar uma', 0
    hddd4   db 'nova vida juntos(as).', 0

    ;instrucoes
    sobre1 db 'O que eh o jogo?', 0
    sobre2 db 'Um simulador com diferentes finais sobre um ', 0
    sobre3 db 'encontro casual que ocorre em uma biblioteca. ', 0
    sobre4 db 'Escolha entre 1 ou 2 e descubra o seu final.', 0
    sobre5 db 'Para uma experiencia melhor, aperte ctrl + alt + f', 0
    sobre6 db 'Pressione Esc para retornar', 0

    ;creditos
    creditos1 db 'atss - Arthur Thierre dos Santos Silva', 0
    creditos2 db 'lnb - Lucas Nascimento Brandao', 0
    creditos3 db 'mvfs - Marcus Vinicius de Faria Santos', 0
    creditos4 db 'vgc3 - Victor Gabriel de Carvalho', 0
    creditos5 db 'Pressione Esc para retornar', 0

    ;Jogo da Velha
    instr db 'Escolha sua posicao', 0
    l1 db ' 1 | 2 | 3 ', 0
    l2 db ' 4 | 5 | 6 ', 0
    l3 db ' 7 | 8 | 9 ', 0
    ls db '-----------', 0
    x db 'X', 0
    o db 'O', 0
    nfugir    db 'Nao adianta fugir do seu destino.', 0

start:
    ;Zera os registradores
    xor ax, ax
    mov ds, ax

    ;Chama função Menu
    call Menu

    jmp fim

_PrepararVideo: ;Chama o modo de video e configura o console
    mov ah, 0   ;Modo de utilização do 10h
    mov al, 12h ;Muda o modo de exibição no console
    int 10h
    ret

_PrepararTela: ; Configura o modo de utilização do 10h, no caso, usamos para trocar a cor da tela
    mov ah, 0bh ;Modo de utilização do 10h
    int 10h 
    ret

;Pré formatação das linhas na página
_LinhaPress:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf  ;Cor
	mov dh, 20   ;Linha
	mov dl, 5    ;Coluna
	int 10h
    ret

_Linha:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 8    ;Linha
	mov dl, 5    ;Coluna
	int 10h
    ret

_Linha2:
    mov ah, 02h  ;Setando a posicao do cursor	
    mov bl, 0xf
	mov dh, 10   ;Linha
	mov dl, 5    ;Coluna
	int 10h
    ret

_Linha3:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 12   ;Linha
	mov dl, 5    ;Coluna
	int 10h
    ret

_Linha4:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 14   ;Linha
	mov dl, 5    ;Coluna
	int 10h
    ret

_Linha5:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 16   ;Linha
	mov dl, 5    ;Coluna
	int 10h
    ret

printString:
    lodsb
    mov ah, 0xe
    mov bl, 0xf
    int 10h

    cmp al, 0
    jne printString
    ret

printString2:
    lodsb
    mov ah, 0xe
    mov bl, 4
    int 10h

    cmp al, 0
    jne printString2
    ret

Menu:
    ;Configura o console
    call _PrepararVideo
    mov bl, 0
    call _PrepararTela
    int 10h 

    ;Colocando o Titulo
	mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 3    ;Linha
	mov dl, 34   ;Coluna
	int 10h
    mov si, titulo
    call printString

    ;Colocando a string Destino
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 18   ;Linha
	mov dl, 31   ;Coluna
	int 10h
    mov si, Destino
    call printString

    ;Colocando a string Jogo da Velha
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 20   ;Linha
	mov dl, 31   ;Coluna
	int 10h
    mov si, JogoDaVelha
    call printString
    
    ;Colocando a string sobre
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 22   ;Linha
	mov dl, 34   ;Coluna
	int 10h
    mov si, instrucoes
    call printString
    
    ;Colocando a string creditos
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 24   ;Linha
	mov dl, 33   ;Coluna
	int 10h
    mov si, creditos
    call printString
    
    ;Selecionar a opcao do usuario
    selecao:
        ;Receber a opção
        mov ah, 0
        int 16h
        
        ;Comparando com '1' 
        cmp al, 49
        je jogoDestino
        
        ;Comparando com '2'
        cmp al, 50
        je JogodDavVelha
        
        ;Comparando com '3'
        cmp al, 51
        je sobre

        ;Comparando com '3'
        cmp al, 52
        je credito
        
        ;Caso não seja nem '1' ou '2' ou '3' ou '4' ele vai receber a string dnv
        jne selecao
     
;Destino (1)
jogoDestino:

    ;Carregando o video para limpar a tela
    call _PrepararVideo

    ;Mudando a cor do background
    mov ah, 0bh
    mov bl, 7
    int 10h 

    call _PrepararVideo
    mov bl, 7
    call _PrepararTela
    
    call _Linha
    mov si, ini
    call printString

    call _Linha2
    mov si, ini2
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _selecao:
        ;Receber a opção
        mov ah, 0
        int 16h ;Interrupção de entrada 
        
        ;Comparando com '1'
        cmp al, 49
        je _fala1
        jne _selecao

PrintCampo:
    mov ah, 02h  ;Setando a posicao do cursor
	
    mov bl, 0xf
	mov dh, 5    ;Linha
	mov dl, 10   ;Coluna
	int 10h
    mov si, instr
    call printString

    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 8    ;Linha
	mov dl, 35   ;Coluna
	int 10h
    mov si, l1
    call printString

    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 10   ;Linha
	mov dl, 35   ;Coluna
	int 10h
    mov si, ls
    call printString

    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 12   ;Linha
	mov dl, 35   ;Coluna
	int 10h
    mov si, l2
    call printString

    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 14   ;Linha
	mov dl, 35   ;Coluna
	int 10h
    mov si, ls
    call printString

    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 16   ;Linha
	mov dl, 35   ;Coluna
	int 10h
    mov si, l3
    call printString

    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 20   ;Linha
	mov dl, 10   ;Coluna
	int 10h
    mov si, sobre6
    call printString

    EscolhaCampo:

        cmp ch, 3
        je _telaDestino
        jne continue

        cmp cl, 2
        je reset
        jne continue

        reset:
            mov cl, 0
        continue:

        ;Para receber o caractere
        mov ah, 0
        int 16h

        cmp al, 49
        je mark1

        cmp al, 50
        je mark2

        cmp al, 51
        je mark3

        cmp al, 52
        je mark4

        cmp al, 53
        je mark5

        cmp al, 54
        je mark6

        cmp al, 55
        je mark7

        cmp al, 56
        je mark8

        cmp al, 57
        je mark9

        ;Apos receber 'Esc' volta pro menu
        cmp al, 27
        je Menu
        jne EscolhaCampo

mark1:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 8   ;Linha
	mov dl, 36   ;Coluna
	int 10h

    call Cond
    call printString
    call EscolhaCampo   

mark2:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 8   ;Linha
	mov dl, 40   ;Coluna
	int 10h
    
    call Cond
    call printString
    call EscolhaCampo   

mark3:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 8   ;Linha
	mov dl, 44   ;Coluna
	int 10h
    
    call Cond
    call printString
    call EscolhaCampo 

mark4:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 12   ;Linha
	mov dl, 36   ;Coluna
	int 10h

    call Cond 
    call printString
    call EscolhaCampo  

mark5:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 12   ;Linha
	mov dl, 40   ;Coluna
	int 10h

    call Cond
    call printString
    call EscolhaCampo    

mark6:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 12   ;Linha
	mov dl, 44   ;Coluna
	int 10h
    
    call Cond
    call printString
    call EscolhaCampo   

mark7:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 16   ;Linha
	mov dl, 36   ;Coluna
	int 10h
    
    call Cond
    call printString
    call EscolhaCampo 

mark8:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 16   ;Linha
	mov dl, 40   ;Coluna
	int 10h

    call Cond
    call printString
    call EscolhaCampo   

mark9:
    mov ah, 02h  ;Setando a posicao do cursor
    mov bl, 0xf
	mov dh, 16   ;Linha
	mov dl, 44   ;Coluna
	int 10h
    
    call Cond
    call printString
    call EscolhaCampo   

Cond:
    cmp cl, 0
    je cond1
    jne cond2

    cond1:
        mov si, x
        jmp end1
    cond2:
        mov si, o

    end1:
    inc cl
    inc ch
    ret 

JogodDavVelha:
    xor cx, cx
    call _PrepararVideo
    mov bl, 3
    call _PrepararTela
    call PrintCampo


ESCjogo:
    ;Para receber o caractere
    mov ah, 0
    int 16h

    ;Apos receber 'Esc' volta pro menu
    cmp al, 27
	je Menu
	jne ESCjogo

;Sobre (2)
sobre:
    ;Carregando o video para limpar a tela
    call _PrepararVideo

    ;Mudando a cor do background
    mov ah, 0bh
    mov bl, 0
    int 10h 

    ;Colocando a string sobre1
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 3    ;Linha
	mov dl, 32   ;Coluna
	int 10h
    mov si, sobre1
    call printString

    ;Colocando a string sobre2
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 7    ;Linha
	mov dl, 18   ;Coluna
	int 10h
    mov si, sobre2
    call printString

    ;Colocando a string sobre3
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 9   ;Linha
	mov dl, 18   ;Coluna
	int 10h
    mov si, sobre3
    call printString

    ;Colocando a string sobre4
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 11   ;Linha
	mov dl, 18   ;Coluna
	int 10h
    mov si, sobre4
    call printString

    ;Colocando a string sobre5
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 13   ;Linha
	mov dl, 16   ;Coluna
	int 10h
    mov si, sobre5
    call printString

    ;Colocando a string sobre6
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 20   ;Linha
	mov dl, 10   ;Coluna
	int 10h
    mov si, sobre6
    call printString

ESCsobre:    
    ;Para receber o caractere
    mov ah, 0
    int 16h

    ;Apos receber 'Esc' volta pro menu
    cmp al, 27
	je Menu
	jne ESCsobre

;Credits (3)
credito:
    ;Carregando o video para limpar a tela
    call _PrepararVideo

    ;Mudando a cor do background
    mov ah, 0bh
    mov bl, 0
    int 10h 

    ;Colocando o titulo
	mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 3    ;Linha
	mov dl, 34   ;Coluna
	int 10h
    mov si, creditos
    call printString

    ;Colocando a string creditos1
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 7    ;Linha
	mov dl, 20   ;Coluna
	int 10h
    mov si, creditos1
    call printString

    ;Colocando a string creditos2
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 9    ;Linha
	mov dl, 20   ;Coluna
	int 10h
    mov si, creditos2
    call printString

    ;Colocando a string creditos3
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 11   ;Linha
	mov dl, 20   ;Coluna
	int 10h
    mov si, creditos3
    call printString

	;Colocando a string creditos4
    mov ah, 02h  ;Setando a posicao do cursor
	mov dh, 13   ;Linha
	mov dl, 20   ;Coluna
	int 10h
    mov si, creditos4
    call printString

    ;Colocando a string creditos5
    mov ah, 02h  ;Setando a posicao do cursor

	mov dh, 20   ;Linha
	mov dl, 10   ;Coluna
	int 10h
    mov si, creditos5
    call printString

ESCcreditos:
	;Para receber o caractere
    mov ah, 0
    int 16h

    ;Apos receber 'Esc' volta pro menu
    cmp al, 27
	je Menu
	jne ESCcreditos

;Sequencia das falas para dada decisao, h = 2, e = 1
_fala1: 
    call _PrepararVideo
    mov bl, 8
    call _PrepararTela
    
    call _Linha
    mov si, h1
    call printString

    call _Linha2
    mov si, h11
    call printString

    call _Linha3
    mov si, h12
    call printString

    _comp1:;Função de leitura do teclado, no 0 é pra ler tecla pressionada
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falahe

    cmp al, 50
    je _falahd

    jne _fala1

    mov ah, 0
    int 16h

_falahe: 
    call _PrepararVideo
    mov bl, 9
    call _PrepararTela

    call _Linha
    mov si, he
    call printString

    call _Linha2
    mov si, he1
    call printString

    call _Linha3
    mov si, he11
    call printString

    call _Linha4
    mov si, he12
    call printString

    _comp2:
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falahee

    cmp al, 50
    je _falahed

    jne _falahe

_falahd: 
    call _PrepararVideo
    mov bl, 2
    call _PrepararTela
    
    call _Linha
    mov si, hd
    call printString

    call _Linha2
    mov si, hd1
    call printString

    call _Linha3
    mov si, hd2
    call printString

    _comp3:
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falahde

    cmp al, 50
    je _falahdd

    jne _falahd

_falahee:
    call _PrepararVideo
    mov bl, 3
    call _PrepararTela
    
    call _Linha
    mov si, hee
    call printString

    call _Linha2
    mov si, hee1
    call printString

    call _Linha3
    mov si, hee11
    call printString

    call _Linha4
    mov si, hee12
    call printString

    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falaheee

    cmp al, 50
    je _falaheed

    jne _falahee

_falahed:
    call _PrepararVideo
    mov bl, 6
    call _PrepararTela
    
    call _Linha
    mov si, hed
    call printString

    call _Linha2
    mov si, hed1
    call printString

    call _Linha3
    mov si, hed11
    call printString

    call _Linha4
    mov si, hed2
    call printString

    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falaheed

    cmp al, 50
    je _falahedd

    jne _falahed

_falahde:
    call _PrepararVideo
    mov bl, 5
    call _PrepararTela
    
    call _Linha
    mov si, hde
    call printString

    call _Linha2
    mov si, hde1
    call printString

    call _Linha3
    mov si, hde2
    call printString


    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falahded

    cmp al, 50
    je _falahdee

    jne _falahde

_falahdd:
    call _PrepararVideo
    mov bl, 4
    call _PrepararTela
    
    call _Linha
    mov si, hdd
    call printString

    call _Linha2
    mov si, hdd1
    call printString

    call _Linha3
    mov si, hdd11
    call printString

    call _Linha4
    mov si, hdd12
    call printString

    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je _falahded

    cmp al, 50
    je _falahddd

    jne _falahdd

_falaheee:
    call _PrepararVideo
    mov bl, 6
    call _PrepararTela
    
    call _Linha
    mov si, heee
    call printString

    call _Linha2
    mov si, heee1
    call printString

    call _Linha3
    mov si, heee2
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _compf1:
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je credito
    jne _compf1

_falaheed:
    call _PrepararVideo
    mov bl, 2
    call _PrepararTela
    
    call _Linha
    mov si, heed
    call printString

    call _Linha2
    mov si, heed1
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _compf2:
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je credito
    jne _compf2

_falahedd:
    call _PrepararVideo
    mov bl, 12
    call _PrepararTela
    
    call _Linha
    mov si, hedd
    call printString

    call _Linha2
    mov si, hedd1
    call printString

    call _Linha3
    mov si, hedd2
    call printString

    call _Linha4
    mov si, hedd3
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _compf3:
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je credito
    jne _compf3

_falahdee:
    call _PrepararVideo
    mov bl, 13
    call _PrepararTela
    
    call _Linha
    mov si, hdee
    call printString

    call _Linha2
    mov si, hdee1
    call printString

    call _Linha3
    mov si, hdee2
    call printString

    call _Linha4
    mov si, hdee3
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _compf4
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je credito
    jne _compf4

_falahded:
    call _PrepararVideo
    mov bl, 4
    call _PrepararTela
    
    call _Linha
    mov si, hded
    call printString

    call _Linha2
    mov si, hded1
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _compf5
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je credito
    jne _compf5

_falahddd:
    call _PrepararVideo
    mov bl, 5
    call _PrepararTela
    
    call _Linha
    mov si, hddd
    call printString

    call _Linha2
    mov si, hddd1
    call printString

    call _Linha3
    mov si, hddd2
    call printString

    call _Linha4
    mov si, hddd3
    call printString

    call _Linha5
    mov si, hddd4
    call printString

    call _LinhaPress
    mov si, pss
    call printString

    _compf6:
    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je credito
    jne _compf6

_telaDestino:
    call _PrepararVideo
    mov bl, 0
    call _PrepararTela
    
    call _Linha
    mov si, nfugir
    call printString2

    call _LinhaPress
    mov si, pss
    call printString

    mov ah, 0
    int 16h
        
    ;Comparando com '1' ou '2'
    cmp al, 49
    je Menu
    jne _telaDestino

fim:
    jmp $