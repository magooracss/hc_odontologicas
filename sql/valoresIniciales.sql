SET GENERATOR  nroHC TO 1;


SET GENERATOR  paisesID TO 1;

INSERT INTO Paises (id, Pais, bVisible)
  VALUES (0, 'Desconocido', 0);

INSERT INTO Paises (id, Pais, bVisible)
  VALUES (1, 'Argentina', 1);
 
SET GENERATOR  documentosTiposID TO 2;

INSERT INTO DocumentosTipos (id, DocumentoTipo, bVisible)
  VALUES (0, 'Desconocido', 0);

INSERT INTO DocumentosTipos (id, DocumentoTipo, bVisible)
  VALUES (1, 'DNI', 1);

INSERT INTO DocumentosTipos (id, DocumentoTipo, bVisible)
  VALUES (2, 'Pasaporte', 1);
  
SET GENERATOR  contactosTiposD TO 3;

INSERT INTO ContactosTipos (id, contactoTipo, bVisible)
  VALUES (0, 'Desconocido', 0);

INSERT INTO ContactosTipos (id, contactoTipo, bVisible)
  VALUES (1, 'Telefono', 1);
  
INSERT INTO ContactosTipos (id, contactoTipo, bVisible)
  VALUES (2, 'Correo electronico', 1);
  
INSERT INTO ContactosTipos (id, contactoTipo, bVisible)
  VALUES (3, 'Celular', 1);  
  
SET GENERATOR  obrasSocialesID TO 1;

INSERT INTO obrasSociales (id, ObraSocial, bVisible)
  VALUES (0, 'Desconocida', 0);
  
INSERT INTO obrasSociales (id, ObraSocial, bVisible)
  VALUES (1, 'IOMA', 1);
    

SET GENERATOR  contactosCategoriasID TO 3;

INSERT INTO contactosCategorias (id, contactoCategoria, bVisible)
  VALUES (0, 'Desconocida', 0);
  
INSERT INTO contactosCategorias (id, contactoCategoria, bVisible)
  VALUES (1, 'Particular', 1);
  
INSERT INTO contactosCategorias (id, contactoCategoria, bVisible)
  VALUES (2, 'Laboral', 1);
  
INSERT INTO contactosCategorias (id, contactoCategoria, bVisible)
  VALUES (3, 'Familiar', 1);
 
SET GENERATOR  localidadesID TO 1;

INSERT INTO localidades (id, localidad, codigoPostal, provincia_id, bVisible)
VALUES (0, 'Desconocida', '0', 0, 0);

INSERT INTO localidades (id, localidad, codigoPostal, provincia_id, bVisible)
VALUES (1, 'La Plata', '1900', 1, 1);

SET GENERATOR  provinciasID TO 1;

INSERT INTO provincias (id, provincia, pais_id, bVisible)
VALUES (0, 'Desconocida',  0, 0);

INSERT INTO provincias (id, provincia, pais_id, bVisible)
VALUES (1, 'Buenos Aires',  1, 1);
