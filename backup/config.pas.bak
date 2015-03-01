unit Config;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Buttons, IniFiles;

type

  { TfrmConfig }

  TfrmConfig = class(TForm)
    lbFone: TLabeledEdit;
    lbUF: TLabeledEdit;
    lbCEP: TLabeledEdit;
    lbEmail: TLabeledEdit;
    lbCelular: TLabeledEdit;
    lbIE: TLabeledEdit;
    lbRazao: TLabeledEdit;
    lbCNPJ: TLabeledEdit;
    lbEnd: TLabeledEdit;
    lbBairro: TLabeledEdit;
    lbCidade: TLabeledEdit;
    PageControl1: TPageControl;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    TabSheet1: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses Principal;

{$R *.lfm}

{ TfrmConfig }

procedure TfrmConfig.SpeedButton1Click(Sender: TObject);
begin
  ZeusIni.WriteString('Geral','Razao',         lbRazao.Text);
  ZeusIni.WriteString('Geral','CNPJ',          lbCNPJ.Text);
  ZeusIni.WriteString('Geral','IE',            lbIE.Text);
  ZeusIni.WriteString('Geral','Endereco',      lbEnd.Text);
  ZeusIni.WriteString('Geral','Bairro',        lbBairro.Text);
  ZeusIni.WriteString('Geral','Cidade',        lbCidade.Text);
  ZeusIni.WriteString('Geral','UF',            lbUF.Text);
  ZeusIni.WriteString('Geral','CEP',           lbCEP.Text);
  ZeusIni.WriteString('Geral','Fone',          lbFone.Text);
  ZeusIni.WriteString('Geral','Celular',       lbCelular.Text);
  ZeusIni.WriteString('Geral','Email',         lbEmail.Text);
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  ZeusIni := TIniFile.Create('Zeus.ini');
  frmConfig.lbRazao.Text := ZeusIni.ReadString('Geral','Razao',     'Lojas Jatobá Ltda');
  frmConfig.lbCNPJ.Text :=    ZeusIni.ReadString('Geral','CNPJ',    '15.315.211/0007-86');
  frmConfig.lbIE.Text :=      ZeusIni.ReadString('Geral','IE',      '');
  frmConfig.lbEnd.Text :=     ZeusIni.ReadString('Geral','Endereco','Folha 31, Quadra 07, Lote 01A');
  frmConfig.lbBairro.Text :=  ZeusIni.ReadString('Geral','Bairro',  'Nova Marabá');
  frmConfig.lbCidade.Text :=  ZeusIni.ReadString('Geral','Cidade',  'Marabá');
  frmConfig.lbUF.Text :=      ZeusIni.ReadString('Geral','UF',      'PA');
  frmConfig.lbCEP.Text :=     ZeusIni.ReadString('Geral','CEP',     '68.507-590');
  frmConfig.lbFone.Text :=    ZeusIni.ReadString('Geral','Fone',    '94 3322 3199');
  frmConfig.lbCelular.Text := ZeusIni.ReadString('Geral','Celular', '');
  frmConfig.lbEmail.Text :=   ZeusIni.ReadString('Geral','Email',   'filial07@lojasjatoba.com.br');
end;

end.

