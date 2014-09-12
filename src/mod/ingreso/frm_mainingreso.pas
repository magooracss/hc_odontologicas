unit frm_mainingreso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, Buttons;

type

  { TfrmMainIngreso }

  TfrmMainIngreso = class(TForm)
    btnBuscarPaciente: TBitBtn;
    edDocumentoPaciente: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    st: TStatusBar;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
  public

  end;

var
  frmMainIngreso: TfrmMainIngreso;

implementation
{$R *.lfm}
uses
  versioninfo
  ,dm_seguridad
  ;

{ TfrmMainIngreso }

procedure TfrmMainIngreso.FormShow(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmMainIngreso.Inicializar;
var
  NroVersion: String;
  Info: TVersionInfo;
begin
  Info := TVersionInfo.Create;
  Info.Load(HINSTANCE);
  NroVersion := IntToStr(Info.FixedInfo.FileVersion[0])+'.'
                +IntToStr(Info.FixedInfo.FileVersion[1])+'.'
                +IntToStr(Info.FixedInfo.FileVersion[2])+'.'
                +IntToStr(Info.FixedInfo.FileVersion[3]);
  Info.Free;

  st.Panels[0].Text:= 'v:' + NroVersion;
  st.Panels[1].Text:= 'Responsable: ' +  DMSeguridad.nombreUsuario;
  st.Panels[2].Text:= FormatDateTime('dd/mm/yyyy', now)+ '        ';end;

end.

