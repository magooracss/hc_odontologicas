
CREATE TABLE Usuarios
( 
  id		"guid" NOT NULL PRIMARY KEY
 , grupo_id "guid" DEFAULT  '{00000000-0000-0000-0000-000000000000}' 
 , nombre varchar (100)
 , usuario  varchar (50)
 , clave varchar (20)
 ,bVisible smallint default 1
);

CREATE TABLE Grupos
(
  id		"guid" NOT NULL PRIMARY KEY
 , nombre varchar (100)
 ,bVisible smallint default 1
);

CREATE TABLE Permisos
(
  id "guid" NOT NULL PRIMARY KEY
  , detalle varchar (200)
  , accion varchar (50)
  ,bVisible smallint default 1
);

CREATE TABLE relPermisoGrupo
(
    id "guid" NOT NULL PRIMARY KEY
  , grupo_id  "guid" DEFAULT  '{00000000-0000-0000-0000-000000000000}' 
  , permiso_id "guid" DEFAULT  '{00000000-0000-0000-0000-000000000000}' 
);

CREATE TABLE Pacientes 
(
    id "guid" NOT NULL PRIMARY KEY
    , hc integer default  -1
    , apellidos varchar (500)
    , nombres varchar (500)
    , documentoTipo_id integer default 0
    , documento varchar (50)
    , nacionalidad_id integer default 0
    , sexo char(1) default 'X'
    , fNacimiento date
    , obraSocial_id integer default 0
    , bVisible smallint default 1
 );
 
CREATE TABLE Contactos
 ( 
    id "guid" NOT NULL PRIMARY KEY
    , tipo_id integer default 0
    , detalle varchar (500)
    , bPrincipal smallint default 1
    , categoria_id  integer default 0
    , bVisible smallint default 1 
 );

CREATE TABLE Domicilios
(
    id "guid" NOT NULL PRIMARY KEY
    , calle varchar (500)
    , numero varchar(50)
    , piso varchar(50)
    , depto varchar (50)
    , localidad_id integer default 0
    , bVisible smallint default 1
);

CREATE TABLE Paises
(
    id integer NOT NULL PRIMARY KEY 
    , pais varchar (200)
    , bVisible smallint default 1
 );

CREATE TABLE DocumentosTipos
(
    id integer NOT NULL PRIMARY KEY 
    , documentoTipo varchar (200)
    , bVisible smallint default 1    
);

CREATE TABLE ContactosTipos
(
    id integer NOT NULL PRIMARY KEY
    , contactoTipo varchar (200)
    , bVisible smallint default 1    
);

CREATE TABLE ObrasSociales
(
    id integer NOT NULL PRIMARY KEY 
    , obraSocial varchar (500)
    , bVisible smallint default 1    
);

CREATE TABLE ContactosCategorias
(
    id integer NOT NULL PRIMARY KEY 
    , contactoCategoria varchar (50)
    , bVisible smallint default 1    
);

CREATE TABLE Localidades
(
    id integer NOT NULL PRIMARY KEY 
    , localidad varchar (200)
    , codigoPostal varchar(10)
    , provincia_id integer default 0
    , bVisible smallint default 1    
);

CREATE TABLE Provincias
(
    id integer NOT NULL PRIMARY KEY 
    , provincia varchar (50)
    , pais_id integer default 0
    , bVisible smallint default 1    
);