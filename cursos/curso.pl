ingresar_informacion :-
    write("Digitar informacion"), nl,
    write("Curso: "), read(Curso),
    write("Profesor: "), read(Profesor),
    write("Proyecto: "), read(Proyecto),
    write("Hora: "), read(Hora),
    write("Fecha: "), read(Fecha),

    open('cursos.txt', append, Stream),

    % Escribimos los datos en el archivo
    write(Stream, "Curso: "), write(Stream, Curso), nl(Stream),
    write(Stream, "Profesor: "), write(Stream, Profesor), nl(Stream),
    write(Stream, "Proyecto: "), write(Stream, Proyecto), nl(Stream),
    write(Stream, "Hora: "), write(Stream, Hora), nl(Stream),
    write(Stream, "Fecha: "), write(Stream, Fecha), nl(Stream),
    write(Stream, "------------------------------"), nl(Stream),

    % Cerramos el archivo
    close(Stream),

    write("Informacion guardada correctamente en cursos.txt"), nl.

leer_informacion :-
    % Abrimos el archivo en modo lectura
    open('cursos.txt', read, Stream),

    write("Contenido del archivo cursos.txt:"), nl,
    % Leemos el contenido del archivo línea por línea
    repeat,
    read_line_to_string(Stream, Line),
    (   Line == end_of_file -> !, close(Stream)
    ;   write(Line), nl,
        fail
    ).
