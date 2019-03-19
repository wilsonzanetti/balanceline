unit UDM;

interface

uses
  SysUtils, Classes, DBTables, DB, ADODB;

type
  TDM = class(TDataModule)
    DBSaude: TADOConnection;
    AdoQuery: TADOQuery;
    QrSaudePro: TADOQuery;
    QrGeral: TADOQuery;
    QInsBenef: TADOQuery;
    Qr_PesqMatr: TADOQuery;
    QrMatricula: TADOQuery;
    QrBeneficiario: TADOQuery;
    QrFamilia: TADOQuery;
    QrSaudePro2: TADOQuery;
    QrSaudePro1: TADOQuery;
    ADOQuery11: TADOQuery;
    QrInsAnotAdm: TADOQuery;
    QrSaudePro3: TADOQuery;
    Qr_UpFilialRegiao: TADOQuery;
    QrEndereco: TADOQuery;
    Qr_InsContaFin: TADOQuery;
    Qr_UpContaFin: TADOQuery;
    Qr_InsModulo: TADOQuery;
    Qr_UpModulo: TADOQuery;
    Qr_InsDoc: TADOQuery;
    Qr_UpDoc: TADOQuery;
    QrySaudepro2: TADOQuery;
    QrySaudePro5: TADOQuery;
    QrySaudePro3: TADOQuery;
    QrySaudePro4: TADOQuery;
    QrySaudePro10: TADOQuery;
    QrySaudePro11: TADOQuery;
    QrySaudePro13: TADOQuery;
    QrySaudePro12: TADOQuery;
    QrySaudePro14: TADOQuery;
    Qr_Geral: TADOQuery;
    Qr_InsSuspensao: TADOQuery;
    QrUpBalanceLine: TADOQuery;
    QrFindAnot: TADOQuery;
    QrComparaSusp: TADOQuery;
    QrSet: TADOQuery;
    QrFindFamiliaI: TADOQuery;
    QrySaudePro6: TADOQuery;
    QrySaudePro7: TADOQuery;
    QrySaudePro8: TADOQuery;
    QrySaudePro9: TADOQuery;
    QrDelHMigrado: TADOQuery;
    QrHMigrado: TADOQuery;
    QrInsHMigrado: TADOQuery;
    QrInsRecalculoMens: TADOQuery;
    QrInsHistMod: TADOQuery;
    QrUpNosNum: TADOQuery;
    QrUpModHis: TADOQuery;
    QrMotBloq: TADOQuery;
    QrLimitacoes: TADOQuery;
    QrInsLimitacao: TADOQuery;
    QrUpNosNumI: TADOQuery;
    QrInsFatLancMod: TADOQuery;
    QrMinHandleMod: TADOQuery;
    QrUpdateModHist: TADOQuery;
    QrMaxHandleHist: TADOQuery;
    QrMaxMod_hist: TADOQuery;
    QrySaudePro15: TADOQuery;
    QrySaudePro16: TADOQuery;
    QrySaudePro17: TADOQuery;
    QrCBO: TADOQuery;
    QrAgencia: TADOQuery;
    QrGeral2: TADOQuery;
    QrySaudePro18: TADOQuery;
    SP_HISTORICO: TADOStoredProc;
    SP_COMPLEMENTO: TADOStoredProc;
    SP_Matricula: TADOStoredProc;
    SP_Atualizar_Data_adesao: TADOStoredProc;
    SP_Cartoes: TADOStoredProc;
    SP_ESF: TADOStoredProc;
    SP_ATUALIZAR_RG: TADOStoredProc;
    SP_UpdateMatriculaInternet: TADOStoredProc;
    SP_UpdateMatriculaDependentes: TADOStoredProc;
    SPCarga_CSC: TADOStoredProc;
    ATUALIZAR_RSP_LEGAL: TADOStoredProc;
    QrTESTE: TADOQuery;
    QrGeralAux: TADOQuery;
    QrySaudePro19: TADOQuery;
    QrCODOCUP: TADOQuery;
    qAux: TADOQuery;
    qUpModuloPensionista: TADOQuery;
    Qr_handle: TADOQuery;
    QrMatriculaBen: TADOQuery;
    qAuxFam: TADOQuery;
    Qr_handleFam: TADOQuery;
    SP_DataBalanceLine: TADOStoredProc;
    SP_SECAO: TADOStoredProc;
    SP_AJUSTARMIGRACOES: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LogMessage(Mensagem: WideString);
  end;

var
  DM: TDM;

implementation

Uses

UMigBenef, Ulogin, uBeneficiarios, Math, SVCMGR, windows;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin

FrmLogin := TFrmLogin.Create(nil);
FrmLogin.EdPwdExitControlM(self);  //Pega Usuário e Pwd

FrmBeneficiario := TFrmBeneficiario.Create(nil);
FrmBeneficiario.Executar_ControlM; //Chama para executar a rotina via controlM
logMessage('Finalizou');
//FrmBeneficiario.Executar;

end;

procedure TDM.LogMessage(Mensagem: WideString);
var
  FEventLogger: TEventLogger;
begin
  FEventLogger := TEventLogger.Create(ExtractFileName(ParamStr(0)));
  FEventLogger.LogMessage(Mensagem, EVENTLOG_ERROR_TYPE, 0, 0);
  FEventLogger.Free;
end;


end.
