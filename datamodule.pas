unit DataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mssqlconn, sqldb, db, dbf, odbcconn, FileUtil, LR_Class,
  LR_DBSet, LR_Desgn, LR_E_CSV;

type

  { TDM }

  TDM = class(TDataModule)
    dbfiliais: TDbf;
    dbfiliaisXX8_CODIGO: TStringField;
    dbfiliaisXX8_DESCRI: TStringField;
    dbfiliaisXX8_EMPR: TStringField;
    frCSVExport1: TfrCSVExport;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    ODBCConnection1: TODBCConnection;
    SQLQuery1: TSQLQuery;
    SQLQuery1D_E_L_E_T_: TStringField;
    SQLQuery1E2_BAIXA1: TStringField;
    SQLQuery1E2_FILIAL1: TStringField;
    SQLQuery1E2_FORNECE1: TStringField;
    SQLQuery1E2_NATUREZ1: TStringField;
    SQLQuery1E2_NOMFOR1: TStringField;
    SQLQuery1E2_NUM1: TStringField;
    SQLQuery1E2_PARCELA1: TStringField;
    SQLQuery1E2_TIPO1: TStringField;
    SQLQuery1E2_VALOR1: TFloatField;
    SQLQuery1E2_VENCREA: TStringField;
    SQLQuery1ED_DESCRIC: TStringField;
    SQLTransaction1: TSQLTransaction;
    procedure frDesigner1LoadReport(Report: TfrReport; var ReportName: String);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.frDesigner1LoadReport(Report: TfrReport; var ReportName: String);
begin

end;

procedure TDM.frReport1GetValue(const ParName: String; var ParValue: Variant);
begin

end;

end.

