unit Principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LR_E_CSV, LR_PGrid, Forms, Controls,
  Graphics, Dialogs, ActnList, Menus, DBGrids, StdCtrls, IniFiles;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    Anuencia: TAction;
    frCSVExport1: TfrCSVExport;
    MenuItem8: TMenuItem;
    Recibos: TAction;
    CPag: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure CPagExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  ZeusIni : TIniFile;

implementation

uses SelPer, DataModule, Config, selfil;


{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.CPagExecute(Sender: TObject);
var fils : string;
    i : integer;
begin
  DM.SQLQuery1.Close;
  if frmSelPer.ShowModal = mrCancel then exit;
  if frmSelFil.ShowModal = mrCancel then exit;

  if frmSelFil.lbFils.Count <> frmSelFil.CheckGroup1.Items.Count then
     if frmSelFil.lbFils.Count=1 then fils := ' and (SE2010.E2_FILIAL = '+
        QuotedStr(frmSelFil.lbFils.Items.Strings[0])+')'

     else if frmSelFil.lbFils.Count=2 then fils := ' and ((SE2010.E2_FILIAL = '+
       QuotedStr(frmSelFil.lbFils.Items.Strings[0])+') or (SE2010.E2_FILIAL = '+
       QuotedStr(frmSelFil.lbFils.Items.Strings[1])+'))'

     else begin
       fils := frmSelFil.lbFils.Items.CommaText;
       fils := StringReplace(fils,',',''',''',[rfReplaceAll]);
       fils := '('''+fils+''')';
       fils := ' and SE2010.E2_FILIAL IN '+fils;
     end;

  DM.SQLQuery1.SQL.Clear;
  DM.SQLQuery1.SQL.Text:= 'Select SE2010.E2_FILIAL As E2_FILIAL1, '+
                          'SE2010.E2_NUM As E2_NUM1, '+
                          'SE2010.E2_PARCELA As E2_PARCELA1, '+
                          'SE2010.E2_TIPO As E2_TIPO1, '+
                          'SE2010.E2_NATUREZ As E2_NATUREZ1, '+
                          'SE2010.E2_FORNECE As E2_FORNECE1, '+
                          'SE2010.E2_NOMFOR As E2_NOMFOR1, '+
                          'SE2010.E2_VENCREA As E2_VENCREA, '+
                          'SE2010.E2_VALOR As E2_VALOR1, '+
                          'SE2010.E2_BAIXA As E2_BAIXA1, '+
                          'SE2010.D_E_L_E_T_, '+
                          'SED010.ED_DESCRIC '+
                          'From '+
                          'SE2010 Inner Join '+
                          'SED010 On SED010.ED_CODIGO = SE2010.E2_NATUREZ '+
                          'Where '+
                          '(SE2010.D_E_L_E_T_ <> ''*'') and '+
                          '(SE2010.E2_VENCREA >= :inicio) AND '+
                          '(SE2010.E2_VENCREA <= :fim) '+ fils +' '+
                          'Order By '+
                          'SE2010.E2_NATUREZ, '+
                          'SE2010.E2_NOMFOR, '+
                          'SE2010.E2_VENCREA';

                          //'((SE2010.E2_FILIAL = ''0202'') Or '+
                          //'(SE2010.E2_FILIAL = ''0107'')) And '+



  DM.SQLQuery1.ParamByName('inicio').AsString := frmSelPer.lbInicio.text;
  DM.SQLQuery1.ParamByName('fim').AsString := frmSelPer.lbFim.text;
  DM.SQLQuery1.Close;
  DM.SQLQuery1.Open;
  DM.frReport1.LoadFromFile('relCPAG.lrf');
  DM.frReport1.FindObject('Memo10').Memo.Text := 'Periodo de '+frmSelPer.Calendar1.Date+' a '+frmSelPer.Calendar2.Date;
  DM.frReport1.PrepareReport;
  DM.frReport1.ExportTo(TfrCSVExportFilter,'Relatorio.csv');
  DM.frReport1.ShowReport;
  DM.SQLQuery1.Close;

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
end;

procedure TfrmPrincipal.MenuItem4Click(Sender: TObject);
begin
  frmConfig.ShowModal;
end;

procedure TfrmPrincipal.MenuItem8Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

