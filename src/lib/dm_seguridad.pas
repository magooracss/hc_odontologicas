unit dm_seguridad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset
  ,dmgeneral;

const
  USR_OK = 0;
  USR_ERROR = 1;

type

  { TDMSeguridad }

  TDMSeguridad = class(TDataModule)
    qUsuario: TZQuery;
    qUsuarioBVISIBLE: TSmallintField;
    qUsuarioCLAVE: TStringField;
    qUsuarioGRUPO_ID: TStringField;
    qUsuarioID: TStringField;
    qUsuarioNOMBRE: TStringField;
    qUsuarioUSUARIO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    _usrActivo: GUID_ID;
    _nombre: string;
  public
    property nombreUsuario: string read _nombre;
    function Acceso (nombre, clave: string): integer;
    function AccValida (accion: string): boolean;
  end;

var
  DMSeguridad: TDMSeguridad;

implementation

{$R *.lfm}

{ TDMSeguridad }

procedure TDMSeguridad.DataModuleCreate(Sender: TObject);
begin
  _usrActivo:= GUIDNULO;
end;

function TDMSeguridad.Acceso(nombre, clave: string): integer;
begin
  with qUsuario do
  begin
    if active then close;
    ParamByName('usuario').AsString:= TRIM(nombre);
    ParamByName('clave').asString:= TRIM(clave);
    Open;
    if RecordCount > 0 then
    begin
      _usrActivo:= qUsuarioID.AsString;
      _nombre:= qUsuarioNOMBRE.AsString;
      Result:= USR_OK;
    end
    else
     Result:= USR_ERROR;
  end;


end;

function TDMSeguridad.AccValida(accion: string): boolean;
begin

end;

end.

