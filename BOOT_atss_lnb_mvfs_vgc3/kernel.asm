org 0x7e00
jmp 0x0000:start

data:

    inicio  db 'Voce eh um(a) estudante do ensino medio lutado contra o EaD e tentando superar esse monstro. Press 1', 0
    h1      db 'Voce encontra uma menina na biblioteca, o que fazer: 1 - Dizer bom dia \n 2 - Agredi-la', 0
    he      db 'Voce descobre que o nome da menina eh Camila, mas ao dizer bom dia ela lhe corrige com um boa tarde. 1 - Agradecer \n 2 - Discutir', 0
    hee     db 'Voce e Camila começam a se dar bem, porem descobrem que gostam da mesma pessoa. 1 - Fazer um bem bolado \n 2 - Gancho de direita', 0
    heee    db 'O amor de suas vidas diz que nao sente nada por Voces e que, na verdade, gosta de uma amiga em comum. Voces, entao, se tornam cumplices e planejam um assassinato dessa outra amiga. Press 1.', 0
    heed    db 'Depois de uma briga feroz, as duas acabam no hospital, posteriormente se encontram na penitenciaria, formando gangues opostas e lutando eternamente. Press 1.', 0
    hed     db 'A discussao se desenrola numa briga, a bibliotecaria chama a policia, que ao chegar interrompe a confusao. 1 - Resistir a prisao \n 2 - Fugir', 0
    hedd    db 'Voce viaja para Miami com o dinheiro que sua avo guardava no colchao a 67 anos (ela fica chateada), la o destino sorri para Voce, que se descobre como um coach e passa a motivar jovens que gostam de frequentar bibliotecas a vencer na vida. Press 1.',0
    hd      db 'Camila puxa uma faca da bolsa e ameaça lhe matar. 1 - Defender \n 2 - Atacar', 0
    hde     db 'Voce desvia do ataque, Camila tropeça e se fere com a propria faca. 1 - Ajudar \n 2 - Ir embora', 0
    hdee    db 'Camila sofre de uma hemorragia e sangra ate a morte, Voce ouve a noticia na televisao no dia seguinte e se sente culpado, entra numa depressao profunda, e dias depois se entrega a policia, que te prende por omissao de socorro. Press 1.', 0
    hded    db 'Voce, formado em grey's anatomy, ajuda Camila, Voces percebem um amor em comum em medicina e passam a estudar para o vestibular em conjunto.', 0
    hdd     db 'Voce da uma cabecada em Camila, a empurrando em direcao a uma janela que se quebra. Voces caem juntos(as) e Camila se fere. 1 - Ajudar Camila \n 2 - Pedir ajuda', 0
    hddd    db 'A ajuda chega, voces sao levados(as) para a enfermaria e enquanto sao tratados(as) conversam sobre a vida, o universo e tudo mais. No final, voces percebem que se gostam e que isso eh maior do que suas diferencas. Esse relacionamento se desenvolve e ambos comecam a compartilhar uma nova vida juntos(as).', 0
	
start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    ;Código do projeto...

   

jmp $