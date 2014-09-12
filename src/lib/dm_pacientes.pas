unit dm_pacientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds;

type

  { TDMPacientes }

  TDMPacientes = class(TDataModule)
    Pacientes: TRxMemoryData;
    PacientesApellidos: TStringField;
    PacientesbVisible: TLongintField;
    Pacientesdocumento: TStringField;
    PacientesdocumentoTipo_id: TLongintField;
    Pacientesfnacimiento: TField;
    PacientesHC: TLongintField;
    Pacientesid: TStringField;
    Pacientesnacionalidad_id: TLongintField;
    PacientesNombres: TStringField;
    PacientesobraSocial_id: TLongintField;
    Pacientessexo: TStringField;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DMPacientes: TDMPacientes;

implementation

{$R *.lfm}

end.

