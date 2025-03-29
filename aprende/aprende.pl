:- dynamic municipio_de/2.

inicio :- consult('departamentos.pl'), nl,
    write('Escribe los nombres entre comillas simples, '), nl,
    write('seguidos de un punto.'), nl,
    write('Escriba salir cuando desee finalizar.'), nl,
    write('Escriba borrar para eliminar un departamento.'), nl,
    process_a_query.

process_a_query :-
    write('Departamento? '),
    read(Departamento),
    respuesta(Departamento).

% Si el usuario ingresa "salir.", entonces grabar la base de conocimientos en el fichero y salir.
respuesta(salir) :-
    write('Grabando la base de conocimiento... '), nl,
    tell('departamentos.pl'),
    listing(municipio_de),
    told,
    write('Listo.'), nl.

% Si el usuario quiere borrar un departamento
respuesta(borrar) :-
    write('Ingrese el nombre del departamento a eliminar: '),
    read(Departamento),
    borrar_departamento(Departamento),
    nl, process_a_query.

% Retornar el nombre del municipio asociado al departamento.
respuesta(Departamento) :-
    municipio_de(Municipio, Departamento),
    write('El municipio de '),
    write(Departamento),
    write(' es '),
    write(Municipio), nl, nl, process_a_query.

% Si el departamento no está en la base de conocimientos, pedir el municipio e ingresarlo.
respuesta(Departamento) :-
    not(municipio_de(_, Departamento)),
    write('No conozco el municipio de ese departamento.'), nl,
    write('Por favor, dime cuál es.'), nl,
    write('Municipio? '),
    read(Municipio),
    assert(municipio_de(Municipio, Departamento)),
    write('Gracias.'), nl, nl, process_a_query.

% Predicado para borrar un departamento y sus municipios
borrar_departamento(Departamento) :-
    retractall(municipio_de(_, Departamento)),
    write('Departamento eliminado correctamente.'), nl.
