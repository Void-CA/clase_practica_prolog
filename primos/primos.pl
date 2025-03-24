detectar_primos :-
    see('valores.txt'), % Abrimos el archivo en modo lectura
    repeat,
    read_line_to_string(current_input, Linea), % Leer desde el archivo
    (   Linea == end_of_file -> true ;
        atom_number(Linea, Numero), % Convertimos la línea a número
        es_primo(Numero, true), % Evaluamos si es primo
        write(Numero), nl,
        fail
    ),
    seen. % Cerramos el archivo

escribir_primos :-
    tell('primos.txt'), % Abrimos el archivo en modo escritura
    detectar_primos, % Detectamos los números primos
    told. % Cerramos el archivo

es_primo(2, true) :- !.
es_primo(N, false) :- N < 2, !.
es_primo(N, Primo) :-
    N > 2,
    not(tiene_divisores(N, 2)),
    Primo = true, !.
es_primo(_, false).

tiene_divisores(N, D) :-
    D * D =< N,
    (N mod D =:= 0 -> true ; D2 is D + 1, tiene_divisores(N, D2)).
