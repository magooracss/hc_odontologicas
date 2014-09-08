unit dm_login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil
  ,dmgeneral;

type

  { TDMLogin }

  TDMLogin = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    _usrActivo: GUID_ID;
  public
    function Acceso (nombre, clave: string): integer;
    function AccValida (accion: string): boolean;
  end;

var
  DMLogin: TDMLogin;

implementation

{$R *.lfm}

{ TDMLogin }

procedure TDMLogin.DataModuleCreate(Sender: TObject);
begin
  _usrActivo:= GUIDNULO;
end;

function TDMLogin.Acceso(nombre, clave: string): integer;
begin

end;

function TDMLogin.AccValida(accion: string): boolean;
begin

end;

end.

