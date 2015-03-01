unit SelPer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtDlgs,
  ExtCtrls, Calendar, StdCtrls, Buttons;

type

  { TfrmSelPer }

  TfrmSelPer = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Calendar1: TCalendar;
    Calendar2: TCalendar;
    Label1: TLabel;
    Label2: TLabel;
    lbInicio: TLabeledEdit;
    lbFim: TLabeledEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmSelPer: TfrmSelPer;

implementation

{$R *.lfm}

{ TfrmSelPer }

procedure TfrmSelPer.FormCreate(Sender: TObject);
begin
  Calendar1.DateTime := Date() - 30;
  Calendar1.DateTime := Date() ;
end;

procedure TfrmSelPer.BitBtn1Click(Sender: TObject);
begin
  lbInicio.Text := FormatDateTime('YYYYmmdd', Calendar1.DateTime);
  lbfim.Text := FormatDateTime('YYYYmmdd', Calendar2.DateTime);
  ModalResult:= mrOK;
end;

procedure TfrmSelPer.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

