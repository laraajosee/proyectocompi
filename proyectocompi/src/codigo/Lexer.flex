package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
%caseless
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
int |
if |
else |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {lexeme=yytext(); return Igual;}
"*" {lexeme=yytext(); return Asterisco;}
"{" {lexeme=yytext(); return LlaveAbierto;}
"}" {lexeme=yytext(); return LlaveCerrado;}
"#" {lexeme=yytext(); return Numeral;}
"(" {lexeme=yytext(); return ParentesisAbierto;}
")" {lexeme=yytext(); return ParentesisCerrado;}
"‘" {lexeme=yytext(); return ApostrofeAbierto;}
"'" {lexeme=yytext(); return ApostrofeCerrado;}
":" {lexeme=yytext(); return DosPuntos;}
"," {lexeme=yytext(); return Coma}
";" {lexeme=yytext(); return PuntoComa}
"“" {lexeme=yytext(); return ComillaAbierta}
"”" {lexeme=yytext(); return ComillaCerrada}
"." {lexeme=yytext(); return Punto}
"[" {lexeme=yytext(); return CorcheteAbierto}
"]" {lexeme=yytext(); return CorcheteCerrado}
"$" {lexeme=yytext(); return SignoDolar}
"DefinirGlobales" {lexeme=yytext(); return DefinirGlobales}
"GenerarReporteEstadistico" {lexeme=yytext(); return GenerarReporteEstadistico}
"Compare" {lexeme=yytext(); return Compare}
"String" {lexeme=yytext(); return String}
"Double" {lexeme=yytext(); return Double}
"GraficaBarras" {lexeme=yytext(); return GraficaBarras}
"Titulo" {lexeme=yytext(); return Titulo}
"TituloX" {lexeme=yytext(); return TituloX}
"TituloY" {lexeme=yytext(); return TituloY}
"EjeX" {lexeme=yytext(); return EjeX}
"Valores" {lexeme=yytext(); return Valores}
"GraficaPie" {lexeme=yytext(); return GraficaPie}
"GraficaLineas" {lexeme=yytext(); return GraficaLineas}
"Archivo" {lexeme=yytext(); return Archivo}
"\\" {lexeme=yytext(); return backSlash}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}