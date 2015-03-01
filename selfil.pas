unit selfil;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  ExtCtrls, Buttons, CheckLst, ValEdit, StdCtrls;

type

  { TfrmSelFil }

  TfrmSelFil = class(TForm)
    CheckGroup1: TCheckGroup;
    DataSource1: TDataSource;
    lbFils: TListBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ValueListEditor1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmSelFil: TfrmSelFil;

implementation

uses DataModule;

{$R *.lfm}

{ TfrmSelFil }

procedure TfrmSelFil.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TfrmSelFil.FormCreate(Sender: TObject);
var s : string;
begin
  DM.dbfiliais.Open;

  CheckGroup1.Items.Clear;

  while Not DM.dbfiliais.EOF do
    begin
      s := DM.dbfiliaisXX8_EMPR.AsString+DM.dbfiliaisXX8_CODIGO.AsString+' '+DM.dbfiliaisXX8_DESCRI.AsString;
      CheckGroup1.Items.Add(s);
      DM.dbfiliais.Next;
    end;

  DM.dbfiliais.Close;
end;

procedure TfrmSelFil.SpeedButton1Click(Sender: TObject);
var c : integer;
begin
  lbFils.Clear;
  for c := 0 to CheckGroup1.Items.Count -1 do
    if CheckGroup1.Checked[c] then lbFils.Items.Add(Copy(CheckGroup1.Items.Strings[c],0,4));

  if lbFils.Count = 0 then ModalResult := mrCancel else ModalResult := mrOK;
end;

procedure TfrmSelFil.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelFil.ValueListEditor1Click(Sender: TObject);
begin

end;

end.

