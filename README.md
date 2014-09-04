hc_odontologicas
================

Programa para la administración de Historias Clínicas de pacientes odontológicos

Información técnica
================

Hasta ahora el programa está escrito en Lazarus/Free Pascal usando como base de datos Firebird.
Cada sector/modulo/zona tiene su propio ejecutable


Estructura de directorios
================

src  Codigo fuente
   lib  Funciones, librerias de uso general en todos los módulos
   mod   Cada uno de los módulos involucrados
       ingreso   Maneja el ingreso del paciente a las clínicas
       fichero    Administra el area  que archiva las historias clinicas fisicamente
       administracion  Utilidad para la administracion de usuarios, tablas generales, etc.       
sql  Consultas SQL. Fundamentalmente creación de objetos en la BD 


Autor
================

Para cualquier consulta o comentario, pueden encontrarme :

Carlos Enrique Rodriguez
lw4dbf@gmail.com
@magooracss
www.cerodriguez.com.ar