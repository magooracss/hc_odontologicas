unit frm_busquedapaciente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, DBGrids
  , dmgeneral
  ;

type

  { TfrmBusquedaPacientes }

  TfrmBusquedaPacientes = class(TForm)
    BitBtn1: TBitBtn;
    btnOK: TBitBtn;
    btnNuevoPaciente: TBitBtn;
    btnBuscar: TBitBtn;
    ds_grillaPacientes: TDatasource;
    DBGrid1: TDBGrid;
    edCriterioBusqueda: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    rgCriterio: TRadioGroup;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNuevoPacienteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edCriterioBusquedaKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    _documento: string;
    _idPaciente: GUID_ID;
    procedure Buscar;
  public
    property idPaciente: GUID_ID read _idPaciente write _idPaciente;
    property Documento: string write _documento;
  end;

var
  frmBusquedaPacientes: TfrmBusquedaPacientes;

implementation
{$R *.lfm}
uses
  dm_pacientes
  ,frm_pacienteae
  ;

{ TfrmBusquedaPacientes }

procedure TfrmBusquedaPacientes.btnBuscarClick(Sender: TObject);
begin
  Buscar;
end;

procedure TfrmBusquedaPacientes.btnNuevoPacienteClick(Sender: TObject);
var
  pant: TfrmPacienteAE;
begin
  pant:= TfrmPacienteAE.Create(self);
  try
    pant.ShowModal;
  finally
    _idPaciente:= Pant.pacienteID;
    pant.Free;
    ModalResult:= mrOK;
  end;
end;

procedure TfrmBusquedaPacientes.btnOKClick(Sender: TObject);
begin
  _idPaciente:= DMPacientes.Pacientesid.asString;
  ModalResult:= mrOK;
end;

procedure TfrmBusquedaPacientes.edCriterioBusquedaKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
    Buscar;
end;

procedure TfrmBusquedaPacientes.FormCreate(Sender: TObject);
begin
  _documento:= EmptyStr ;
end;

procedure TfrmBusquedaPacientes.FormShow(Sender: TObject);
begin
  if _documento <> EmptyStr then
  begin
    edCriterioBusqueda.Text:= _documento;
    rgCriterio.ItemIndex:= 1;
    Buscar;
  end;
end;

procedure TfrmBusquedaPacientes.Panel2Click(Sender: TObject);
begin

end;


procedure TfrmBusquedaPacientes.Buscar;
begin
  case rgCriterio.ItemIndex of
   0: DMPacientes.BuscarPacienteNombre(TRIM(edCriterioBusqueda.Text));
   1: DMPacientes.BuscarPacienteDocumento(TRIM(edCriterioBusqueda.Text));
   2: DMPacientes.BuscarPacienteHC(StrToIntDef(edCriterioBusqueda.Text, -1));
  end;
end;

end.

