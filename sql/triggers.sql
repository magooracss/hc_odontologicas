SET TERM ^ ;

CREATE TRIGGER nroHC FOR Pacientes
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.hc = -1) then
   New.hc = GEN_ID(nroHC,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idPaises FOR Paises
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(paisesID,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idDocumentosTipos FOR DocumentosTipos
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(documentosTiposID,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idContactosTipos FOR ContactosTipos
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(contactosTiposID,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idObrasSociales FOR ObrasSociales
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(obrasSocialesID,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idContactosCategorias FOR ContactosCategorias
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(contactosCategoriasID,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idLocalidades FOR Localidades
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(localidadesID,1);
END^

SET TERM ; ^


SET TERM ^ ;

CREATE TRIGGER idProvincias FOR Provincias
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(provinciasID,1);
END^

SET TERM ; ^