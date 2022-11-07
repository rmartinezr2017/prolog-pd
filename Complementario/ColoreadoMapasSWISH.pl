%% RESOLUCIÓN EN PROLOG DEL PROBLEMA DEL COLOREADO DE MAPAS

%% DATOS DESCRIBIENDO UN PROBLEMA DE COLOREADO DE MAPAS

% regiones(?X)
% cierto si X es una lista con las regiones del plano

regiones([1,2,3,4]).

% frontera(?X,?Y)
% cierto si la región X es fronteriza con Y

frontera(1,2).
frontera(1,3).
frontera(1,4).
frontera(2,3).
frontera(2,4).

% colores(?X)
% cierto si X es una lista con los colores disponibles

colores([rojo,azul,verde]).


%% SOLUCIÓN DEL PROBLEMA DEL COLOREADO DE MAPAS

% solucion(?Asignacion)
% cierto si Asignacion es una solución a un problema de coloreado

solucion(Asignacion):-
        regiones(Regiones),
        colores(Colores),
        asignacion(Regiones,Colores,Asignacion).


% asignacion(+LR,+LC,?LA)
% cierto si LR es una lista de regiones, LC es una lista de
% colores disponsibles y LA representa una asignación de colores
% a regiones, tal que ningún par de regiones fronterizas tienen
% asignado el mismo color

asignacion([],_,[]).

asignacion([Region1|RestoRegiones],Colores,[(Region1,Color)|RestoAsignados]):-
    asignacion(RestoRegiones,Colores,RestoAsignados),
    member(Color,Colores),
    \+ ((frontera(Region1,Region2); frontera(Region2,Region1)),
         member((Region2,Color),RestoAsignados)).


% EJERCICIO:

% soluciones.
% Escribe cuántas soluciones tiene el problema y las imprime, una por línea.

soluciones :-
        findall(Asignacion, solucion(Asignacion), Soluciones),
        length(Soluciones, Cuantas),
        write('El problema tiene '),
        write(Cuantas),
        write(' soluciones, que son:'),
        nl,
        nl,
        maplist(escribe, Soluciones). 
        
escribe(A) :-
           write(A),
           nl.
       
% © 2022 Juan Manuel Serrano Hidalgo, Ana Pradera Gómez
 
% Algunos derechos reservados 
% Este documento se distribuye bajo la licencia
%``Atribución-CompartirIgual 4.0 Internacional'' de Creative Commons, disponible en
% \url{https://creativecommons.org/licenses/by-sa/4.0/deed.es}    
           

