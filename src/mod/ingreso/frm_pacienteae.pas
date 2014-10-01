unit frm_pacienteae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, dbdateedit, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, ExtCtrls, DBGrids, Buttons
  , dmgeneral
  ;

type

  { TfrmPacienteAE }

  TfrmPacienteAE = class(TForm)
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ds_pacientes: TDatasource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Sexo: TDBRadioGroup;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _idPaciente: GUID_ID;
  public
    property pacienteID: GUID_ID read _idPaciente write _idPaciente;
  end;

var
  frmPacienteAE: TfrmPacienteAE;

implementation
uses
  dm_pacientes
  ;

{$R *.lfm}

{ TfrmPacienteAE }

procedure TfrmPacienteAE.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
 // DMPacientes.Free;
end;

procedure TfrmPacienteAE.BitBtn1Click(Sender: TObject);
begin
  _idPaciente:= DMPacientes.Grabar;
  ModalResult:= mrOK;
end;

procedure TfrmPacienteAE.FormCreate(Sender: TObject);
begin
 // DMPacientes:= TDMPacientes.Create(self);
  _idPaciente:= GUIDNULO;
end;

procedure TfrmPacienteAE.FormShow(Sender: TObject);
begin
  if _idPaciente = GUIDNULO then
    DMPacientes.Nuevo
  else
    DMPacientes.Editar(_idPaciente);
end;

end.

