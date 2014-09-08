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
    procedure btnCancelarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

end.

