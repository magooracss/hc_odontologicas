CREATE DOMAIN "guid"
  AS VARCHAR(38)
  CHARACTER SET ASCII
  DEFAULT '{00000000-0000-0000-0000-000000000000}' NOT NULL;


CREATE TABLE Usuarios
( 
  id		"guid" NOT NULL PRIMARY KEY
 , grupo_id "guid" DEFAULT  '{00000000-0000-0000-0000-000000000000}' 
 , nombre varchar (100)
 , usaurio  varchar (50)
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
