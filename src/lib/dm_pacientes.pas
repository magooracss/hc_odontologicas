unit dm_pacientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset
  , Variants, dmgeneral;

Const
  S_MASCULINO =  'M';
  S_FEMENINO = 'F';

type

  { TDMPacientes }

  TDMPacientes = class(TDataModule)
    Pacientes: TRxMemoryData;
    PacientesApellidos: TStringField;
    PacientesbVisible: TLongintField;
    Pacientesdocumento: TStringField;
    PacientesdocumentoTipo_id: TLongintField;
    Pacientesfnacimiento: TDateTimeField;
    PacientesHC: TLongintField;
    Pacientesid: TStringField;
    Pacientesnacionalidad_id: TLongintField;
    PacientesNombres: TStringField;
    PacientesobraSocial_id: TLongintField;
    PacientesSELAPELLIDOS: TStringField;
    PacientesSELBVISIBLE: TSmallintField;
    PacientesSELDOCUMENTO: TStringField;
    PacientesSELDOCUMENTOTIPO_ID: TLongintField;
    PacientesSELFNACIMIENTO: TDateField;
    PacientesSELHC: TLongintField;
    PacientesSELID: TStringField;
    PacientesSELNACIONALIDAD_ID: TLongintField;
    PacientesSELNOMBRES: TStringField;
    PacientesSELOBRASOCIAL_ID: TLongintField;
    PacientesSELSEXO: TStringField;
    Pacientessexo: TStringField;
    qBusPacApellido: TZQuery;
    qBusPacDocumento: TZQuery;
    qBusPacApellidoAPELLIDOS: TStringField;
    qBusPacHC: TZQuery;
    qBusPacNombreAPELLIDOS1: TStringField;
    qBusPacApellidoBVISIBLE: TSmallintField;
    qBusPacNombreAPELLIDOS2: TStringField;
    qBusPacNombreBVISIBLE1: TSmallintField;
    qBusPacApellidoDOCUMENTO: TStringField;
    qBusPacNombreBVISIBLE2: TSmallintField;
    qBusPacNombreDOCUMENTO1: TStringField;
    qBusPacApellidoDOCUMENTOTIPO_ID: TLongintField;
    qBusPacNombreDOCUMENTO2: TStringField;
    qBusPacNombreDOCUMENTOTIPO_ID1: TLongintField;
    qBusPacApellidoFNACIMIENTO: TDateField;
    qBusPacNombreDOCUMENTOTIPO_ID2: TLongintField;
    qBusPacNombreFNACIMIENTO1: TDateField;
    qBusPacApellidoHC: TLongintField;
    qBusPacNombreFNACIMIENTO2: TDateField;
    qBusPacNombreHC1: TLongintField;
    qBusPacApellidoID: TStringField;
    qBusPacNombreHC2: TLongintField;
    qBusPacNombreID1: TStringField;
    qBusPacApellidoNACIONALIDAD_ID: TLongintField;
    qBusPacNombreID2: TStringField;
    qBusPacNombreNACIONALIDAD_ID1: TLongintField;
    qBusPacApellidoNOMBRES: TStringField;
    qBusPacNombreNACIONALIDAD_ID2: TLongintField;
    qBusPacNombreNOMBRES1: TStringField;
    qBusPacApellidoOBRASOCIAL_ID: TLongintField;
    qBusPacNombreNOMBRES2: TStringField;
    qBusPacNombreOBRASOCIAL_ID1: TLongintField;
    qBusPacApellidoSEXO: TStringField;
    qBusPacNombreOBRASOCIAL_ID2: TLongintField;
    qBusPacNombreSEXO1: TStringField;
    qBusPacNombreSEXO2: TStringField;
    PacientesSEL: TZQuery;
    PacientesUPD: TZQuery;
    PacientesINS: TZQuery;
    procedure PacientesAfterInsert(DataSet: TDataSet);
  private
    procedure Buscar (consulta: TZQuery; parametro: variant);
  public
    procedure BuscarPacienteNombre (nombre: string);
    procedure BuscarPacienteDocumento (documento: string);
    procedure BuscarPacienteHC (NroHC: integer);

    function Grabar: GUID_ID;
    procedure Nuevo;
    procedure Editar (idPaciente: GUID_ID);
  end;

var
  DMPacientes: TDMPacientes;

implementation
{$R *.lfm}


{ TDMPacientes }

procedure TDMPacientes.PacientesAfterInsert(DataSet: TDataSet);
begin
  Pacientesid.AsString:= DM_General.CrearGUID;
  PacientesHC.asInteger:= -1;
  PacientesdocumentoTipo_id.asInteger:= 0;
  Pacientesnacionalidad_id.asInteger:= 0;
  PacientesobraSocial_id.AsInteger:= 0;
  Pacientessexo.AsString:= S_MASCULINO;
  PacientesbVisible.asInteger:= 1;
end;

procedure TDMPacientes.Buscar(consulta: TZQuery; parametro: Variant);
begin

  DM_General.ReiniciarTabla(Pacientes);

  with consulta do
  begin
    if active then close;
    ParamByName('parametro').Value:= parametro;
    Open;

    Pacientes.LoadFromDataSet(consulta, 0, lmAppend);
    Close;
  end;
end;

procedure TDMPacientes.BuscarPacienteNombre(nombre: string);
begin
  Buscar(qBusPacApellido, nombre);
end;

procedure TDMPacientes.BuscarPacienteDocumento(documento: string);
begin
  Buscar(qBusPacDocumento, documento);
end;

procedure TDMPacientes.BuscarPacienteHC(NroHC: integer);
begin
  Buscar(qBusPacHC, NroHC);
end;

function TDMPacientes.Grabar: GUID_ID;
var
  tmpIdPaciente: GUID_ID;
begin
  tmpIdPaciente:= PacientesSELID.AsString;
  DM_General.GrabarDatos(PacientesSEL, PacientesINS, PacientesUPD, Pacientes, 'id');
  Result:= tmpIdPaciente;
end;

procedure TDMPacientes.Nuevo;
begin
  DM_General.ReiniciarTabla(Pacientes);
  Pacientes.Insert;
end;

procedure TDMPacientes.Editar(idPaciente: GUID_ID);
begin
  DM_General.ReiniciarTabla(Pacientes);

  if PacientesSEL.Active then PacientesSEL.Close;
  PacientesSEL.ParamByName('id').asString:= idPaciente;
  PacientesSEL.Open;
  Pacientes.LoadFromDataSet(PacientesSEL, 0, lmAppend);
  PacientesSEL.Close;
  Pacientes.Edit;
end;

end.

