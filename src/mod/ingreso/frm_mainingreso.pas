unit frm_mainingreso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, Buttons, DbCtrls;

type

  { TfrmMainIngreso }

  TfrmMainIngreso = class(TForm)
    btnBuscarPaciente: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ds_Paciente: TDatasource;
    DBEdit1: TDBEdit;
    edDocumentoPaciente: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    st: TStatusBar;
    StaticText1: TStaticText;
    procedure btnBuscarPacienteClick(Sender: TObject);
    procedure edDocumentoPacienteKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
    procedure BuscarPaciente (cadena: string);
  public

  end;

var
  frmMainIngreso: TfrmMainIngreso;

implementation
{$R *.lfm}
uses
   versioninfo
  ,dm_seguridad
  ,frm_busquedapaciente
  ;

{ TfrmMainIngreso }

procedure TfrmMainIngreso.FormShow(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmMainIngreso.btnBuscarPacienteClick(Sender: TObject);
begin
  BuscarPaciente(EmptyStr);
end;

procedure TfrmMainIngreso.edDocumentoPacienteKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
   BuscarPaciente(Trim(edDocumentoPaciente.Text));
end;

procedure TfrmMainIngreso.FormCreate(Sender: TObject);
begin

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

procedure TfrmMainIngreso.BuscarPaciente(cadena: string);
var
  pant: TfrmBusquedaPacientes;
begin
  pant:= TfrmBusquedaPacientes.Create(self);
  try
    pant.documento:= cadena;
    pant.ShowModal;
  finally
    pant.Free;
  end;
end;

end.

