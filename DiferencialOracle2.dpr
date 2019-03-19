program DiferencialOracle2;



uses
  Forms,
  Windows,
  UMigBenef in 'UMigBenef.pas' {FrmBeneficiario},
  UDM in 'UDM.pas' {DM: TDataModule},
  Ulogin in 'Ulogin.pas' {FrmLogin},
  uFuncoesGerais in 'uFuncoesGerais.pas',
  uBeneficiarios in 'uBeneficiarios.pas',
  uSAP in 'uSAP.pas';

//UMEscolha in 'C:\Arquivos de programas\Borland\Delphi6\Projects\QuizMakerCassi\UMEscolha.pas' {FrmPergunta};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
