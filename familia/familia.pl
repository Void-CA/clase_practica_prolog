parentesco(mama, idania).
parentesco(papa, fulvio).
parentesco(hermana, adriana).
parentesco(hermana, iris).
parentesco(hermano, ian).
parentesco(hermano, erick).
parentesco(hermano, fulvito).

familia :-
    write('Mi familia: '), nl,
    forall(parentesco(X, Y), (write("Mi "), write(X), write(' es '), write(Y), nl)),
    write('Fin de la lista'), nl.