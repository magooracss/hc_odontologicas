program ingreso;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  controls, //Para el login
  Forms, rxnew, zcomponent, frm_mainingreso, frm_login, dm_login, dmgeneral,
  dmconexion
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Ingreso HC';
  RequireDerivedFormResource := True;

  Application.Initialize;
  Application.CreateForm(TDM_Conexion, DM_Conexion);
  Application.CreateForm(TDMLogin, DMLogin);
  Application.CreateForm(TfrmLogin, frmLogin);

  if frmLogin.ShowModal <>  mrOK then
  begin
     Application.Terminate;
  end
  else
  begin
    frmLogin.Free;
    Application.CreateForm(TfrmMainIngreso, frmMainIngreso);
    Application.Run;
  end;
end.

