:- dynamic municipio_de/2.
inicio :- consult('departamentos.pl'), nl,
    write('Escribe los nombres entre comillas simple, '), nl,
    write('seguidos de un punto.'), nl,
    write('escriba salir cuando desee finalizar.'), nl,
    process_a_query.

process_a_query :- write('Departamento? '),
    read(Departamento),
    respuesta(Departamento).

%Si el usuario ingresa "salir.", entonces grabar la nueva
%base de conocimientos en el fichero y salir.
respuesta(salir) :- write('Grabando la base de conocimiento... '), nl,
    tell('departamentos.pl'),
    listing(municipio_de),
    told,
    write('Listo.'), nl.

%retornar el nombre de su municipio.
respuesta(Departamento) :- municipio_de(Municipio, Departamento),
    write('El municipio de '),
    write(' es '),
    write(Municipio), nl, nl, process_a_query.


%Si el departamento no está en la base de conocimientos, entonces
%Pide el nombre de municipio e ingresar este fact a la base.
respuesta(Departamento) :- not(municipio_de(Municipio,Departamento)),
    write('No conozco el municipio de ese departamento.'), nl,
    write('Por favor, dime cual es.'), nl,
    write('Municipio? '),
    read(Municipio),
    assert(municipio_de(Municipio,Departamento)),
    write('Gracias.'), nl, nl.