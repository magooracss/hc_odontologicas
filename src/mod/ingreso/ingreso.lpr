program ingreso;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  controls, //Para el login
  Forms, rxnew, zcomponent, frm_mainingreso, frm_login, dm_seguridad, dmgeneral,
  dmconexion, frm_pacienteae, dm_pacientes, frm_busquedapaciente
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Ingreso HC';
  RequireDerivedFormResource := True;

  Application.Initialize;
  Application.CreateForm(TDM_Conexion, DM_Conexion);
  Application.CreateForm(TDM_General, DM_General);
  Application.CreateForm(TDMPacientes, DMPacientes);
  Application.CreateForm(TDMSeguridad, DMSeguridad);
  Application.CreateForm(TfrmMainIngreso, frmMainIngreso);

  frmlogin:= TfrmLogin.Create (nil);
  if frmLogin.ShowModal <>  mrOK then
  begin
     Application.Terminate;
  end
  else
  begin
    frmLogin.Free;
  Application.CreateForm(TfrmBusquedaPacientes, frmBusquedaPacientes);
    Application.Run;
  end;
end.

