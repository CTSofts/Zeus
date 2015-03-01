program Zeus;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Principal, DataModule, Funcoes, SelPer, Config, dbflaz, selfil
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TFNC, FNC);
  Application.CreateForm(TfrmSelPer, frmSelPer);
  Application.CreateForm(TfrmSelFil, frmSelFil);
  Application.Run;
end.

