unit frm_mainadministracion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    st: TStatusBar;
    procedure FormShow(Sender: TObject);
  private
    procedure Inicializar;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.lfm}
uses
  versioninfo
  ;

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
begin
  Inicializar;
end;

procedure TForm1.Inicializar;
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
  st.Panels[1].Text:= FormatDateTime('dd/mm/yyyy', now)+ '        ';
end;

end.

