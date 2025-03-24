ingresar_informacion :-
    write("Digitar informacion"), nl,
    write("Curso: "), read(Curso),
    write("Profesor: "), read(Profesor),
    write("Proyecto: "), read(Proyecto),
    write("Hora: "), read(Hora),
    write("Fecha: "), read(Fecha),

    % Abrimos el archivo en modo escritura (sobreescribe todo el contenido)
    tell('cursos.txt'),

    % Escribimos los datos en el archivo
    write("Curso: "), write(Curso), nl,
    write("Profesor: "), write(Profesor), nl,
    write("Proyecto: "), write(Proyecto), nl,
    write("Hora: "), write(Hora), nl,
    write("Fecha: "), write(Fecha), nl,
    write("------------------------------"), nl,

    % Cerramos el archivo
    told,

    write("Informacion guardada correctamente en cursos.txt"), nl.

leer_informacion :-
    % Abrimos el archivo en modo lectura
    see('cursos.txt'),
    
    % Leemos y mostramos el contenido línea por línea
    repeat,
    read_line_to_string(user_input, Linea),
    (   Linea == end_of_file -> true ; write(Linea), nl, fail),

    % Cerramos el archivo
    seen.
