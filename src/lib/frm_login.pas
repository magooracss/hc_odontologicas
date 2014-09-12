unit frm_login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edUsuario: TEdit;
    edClave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edMensaje: TStaticText;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edClaveKeyPress(Sender: TObject; var Key: char);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: char);
  private
    procedure ValidarUsuario;
  public
    { public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
{$R *.lfm}
uses
  dm_seguridad
  ;


{ TfrmLogin }

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmLogin.edClaveKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) and (edUsuario.Text <> EmptyStr) then
   btnAceptar.SetFocus
  else
    edUsuario.SetFocus;
end;

procedure TfrmLogin.edUsuarioKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) then
   edClave.SetFocus;
end;

procedure TfrmLogin.btnAceptarClick(Sender: TObject);
begin
  ValidarUsuario;
end;

procedure TfrmLogin.ValidarUsuario;
begin
  if DMSeguridad.Acceso(TRIM(edUsuario.Text), TRIM(edClave.Text)) = USR_OK then
  begin
    edMensaje.Caption:= 'Usuario Valido';
    ModalResult:= mrOK;
  end
  else
  begin
    edMensaje.Caption:= 'Usuario/Clave Incorrecto';
    edUsuario.Clear;
    edUsuario.SetFocus;
    edClave.Clear;
  end;
end;

end.

