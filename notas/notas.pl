:- dynamic nota_prolog/2.  % Se declara primero la base de datos dinámica

nota_prolog(acumulado, 10).  % Ahora es una regla dinámica

agregar_notas :-
    assertz(nota_prolog(acumulado, 12)),
    assertz(nota_prolog(acumulado, 8)),
    assertz(nota_prolog(acumulado, 15)),
    assertz(nota_prolog(acumulado, 7)).

agregar_examen :-
    assertz(nota_prolog(examen, 25)).

mostrar_base :-
    listing(nota_prolog).

eliminar_tercera :-
    retract(nota_prolog(acumulado, 8)).

modificar_examen :-
    retract(nota_prolog(examen, _)),
    assertz(nota_prolog(examen, 28)).

ejecutar :-
    agregar_notas,
    agregar_examen,
    write("Base de conocimiento inicial:"), nl,
    mostrar_base,
    eliminar_tercera,
    modificar_examen,
    write("Base de conocimiento final:"), nl,
    mostrar_base.
