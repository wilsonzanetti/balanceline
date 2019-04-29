unit UMigBenef;
{Versão dia 02/09/2004 - Inclusão do Union na query da família II para carregar os beneficiários
                         PDE que ultrapassaram a data para pagamento de mensalidade.
                         Regra.:(data atual >= Data de Adesão no PDE + 366 dias)
 Versão dia 22/09/2004 - Inclusão da Procedure para atualizar ESF e População Prioritária
 Versão dia 17/11/2004 - Alteração do motivo de cancelamento - Sem vínculo com a CASSI --de-->para 32=28
 Versão dia 23/03/2005 - Chamada da procedure para atuliazar as seções nas famílias e fazer a inclusão de novas seções.
 Versão dia 31/05/2005 - Inclusão do contrato Paraguaios na migração
 Versão dia 09/06/2005 - Inclusão do procedimento para fazer a migração dos beneficiários do Plano PAQ para o Família
 Versão dia 06/09/2005 - Parâmetros para inclusão do Plano ALUMAR - balance line diário
 Versão dia 21/11/2005 - Incluídos 2 novos motivos de cancelamentos que foram criados no CSC
 Versão dia 22/12/2005 - Inclusão dos campos DIACOBRANCAORIGINAL E PROXIMOVENCIMENTO na tabela sam_família
 Versão dia 16/01/2006 - Inclusão da função RetornaDepFunciCassi.Inclusão de dependentes da CASSI com número dep já existente.
 Versão dia 15/02/2006 - Regra para evitar atualização das contas-correntes de PSF I/II que tenham
                         tipo de Recebimento=título e Pagamento=Conta-corrente. S.C. 109235
 Versão dia 16/03/06   - Nova implementação para a migração dos beneficiários incluídos no SAP
 Versão dia 26/04/06   - Ajustes nos registros do mod_histórico do beneficiário
 Versão dia 02/05/2006 - Novo De-para do tipos de dependentes femininos
 Versão dia 21/06/2006 - Inclusão dos parâmetros para o contrato FIRJAN
 Versão dia 07/07/2006 - Inclusão da carência no beneficiário para os contratos FIRJAN e BACEN
 Versão dia 28/08/2006 - Inserir o Sequence das tabelas SFN_FATURA_LANC_MOD,SAM_BENEFICIARIO_MOD_HISTORICO
                         SAM_BENEFICIARIO_MOD E SAM_BENEFICIARIO_HISTORICO - SC 134924 - JULIANO
                       - De-para de Dependente Indireto - Incluído o código 431  equivalente ao cód. 46 no CSC.
 Versão dia 23/11/2006 - Validação do campo PERMITEREEMBOLSO de acordo com o parâmetro do contrato
 Versão dia 05/02/2007 - Atualizar o campo SERVICOPROPRIO dos dependentes de acordo com o valor do
                         campo no registro do Titular
 Versão dia 23/03/2007 - Implementação do campo INFORMATIVO E CORREIO para o PSF II - Matrícula 150 na sam_familia
 Versão dia 02/08/2007 - Inclusão da regra de busca do campo PARENTESCO para preencher a tabela SAM_BENEFICIARIO
 Versão dia 17/10/2007 - Inclusão da procedure Atualizar_matricula_funcional_CASSI para atualizar o campo matriculafuncional dos func CASSI - S.C. 187930
 Versão dia 08/11/2007 - Migração dos beneficiários do contrato Associado para Aposentado
 Versão dia 11/01/2008 - Parametrização do contrato 140 - Família III - Campanha 2008 - Não está em produção
 Versão dia 18/02/2008 - Cancelamento de Associados Exonerados.
 Versão dia 11/03/2008 - Cancelar toda a FAmília D.I. quando morte for por óbito. Parametrizar o
                         campo atendimentoate como datacancelamento + 60 dias para permitir o
                         atendimento até esta data. S.C. 204538
 Versão dia 18/03/2008 - Correção dos tipos de dependentes dos contratos func cassi. S.C.-> 203621
 Versão dia 10/04/2008 - bloqueio de alterações de conta-corrente para os planos PSF e Dep. Ind
 Versão dia 18/04/2008 - Criação da procedure ATUALIZAR_TIPODEP_FUNCCASSI
 Versão dia 25/04/2008 - Parametrização para migração dos beneficiários do contrato FASCAL
 Versão dia 28/04/2008 - Inclusão dos motivos de cancelamento 72 e 73 no de-para  - S.C - 210.609
 Versão dia 11/06/2008 - Regra para a data de adesão quando beneficiário migra do PDE e PAQ para o PCF II - sc. 216038 e 216040
 Versão dia 21/07/2008 - Inclusão da chamada da procedure ATUALIZAR_CAMPOS_RESP_LEGAL
            21/07/2008 - Procedure para criação dos registros na SAM_BENEFICIARIO_PFEVENTO - dep. indiretos
 Versão dia 04/08/2008 - S.C. 222985 e 222134 - inclusão de tipo de dependente e correção do cancelamento dos dep. diretos
 Versão dia 12/08/2008 - S.C  224423 - Regra para não atualizar o dia de pagamento para os PCF I e II.
 Versão dia 27/08/2008 - S.C 226.972 - Inclusão de novos motivos de cancelamento - implementação dos motivos em tabela
 Versão dia 01/09/2008 - S.C 227.139 - Inclusão do contrato PAQ na migração para o contrato Família II
 Versão dia 29/09/2008 - Correção do erro gerado pela atualização dos beneficiários oriundos de PAQ, PDE e Novo PAQ nos campos data de adesão e nosso número
 Versão dia 12/11/2008 - Fechamento de campos nas tabelas SAM_BENEFICIARIO, SAM_MATRICULA, SAM_ENDERECO para update através de arquivos horiundos do CSC
 Versão dia 12/01/2009 - Correção para bloqueio de update no CPF para Associados Titular
 Versão dia 09/03/2009 - Alteração para inclusão do contrato CASEMBRAPA
 Versão dia 09/03/2009 - Inclusão de alteração de CPF via CSC somente para TITULAR dos plano ASSOCIADO,vPENSINISTA, APOSENTADO, PARAGUAIOS, ASSOCIADO EXONERADO, DEPENDENTES INDIRETOS
 Versão dia 14/05/2009 - Alteração da Carência dos planos Familia II migrados do Familia I
 Versão dia 14/05/2009 - Alteração para bloqueio das alterações de FunciCassi oriundas da Internet
 Versão dia 19/05/2009 - Inclusão do campo CBO da SAM_BENEFICIARIO somente para inclusão
 Versão dia 01/07/2009 - Inclusão do campo RECEBIMENTOINSS da SAM_BENEFICIARIO
 Versão dia 08/07/2009 - Inclusão do campo AGENCIAINCLUSAO da SAM_BENEFICIARIO
 Versão dia 17/07/2009 - Retirada do contrato ECONOMUS no select da  CBOCONTRATO
 Versão dia 17/07/2009 - Inclusão da validação do campo CARTAOIDENTIFICACAO  na tabela SAM_FAMILIA
 Versão dia 13/08/2009 - Inclusão Try Except na procedure ATUALIZAR_TIPOPDEP_FUNCCASSI
 Versão dia 08/09/2009 - Alteração de execeção de update para endereço oriundo do CSC
 Versão dia 08/09/2009 - Inserção do campo datamovimentoativacao na inclusão do Módulo Histórico com SYSDATE
 Versão dia 29/09/2009 - Retirados os contrato 2,4 do update_matricula_cpf
 Versão dia 29/09/2009 - Incluido data e motivo de bloqueiona inclusão do contrato Familia II e Familia III
 Versão dia 02/10/2009 - Retirada de todos os contratos de reciprocidade.
 Versão dia 07/10/2009 - Retirada de bloqueio migrados de PFI para PFII
 Versão dia 23/11/2009 - Retirada do TO_NUMBER do select de contafinanceira
 Versão dia 18/01/2010 - Retirado o contrato FunciCassi do sistema, inclusão e alteração direto via SAP
 Versão dia 28/01/2010 - Inserção dos campos Complemento e Numero para Endereços e Responsável Financeiro e CPF Responsável Financeiro
 Versão dia 03/08/2010 - Feito o de-para do parentesco
 Versão dia 04/08/2010 - Alteração da senha do SOC, devido a habilitação do case-sensitive no oracle11g
 Versão dia 12/08/2010 - Alteração na geração da sequence da tabela SFN_CONTAFIN, sendo chamada pelo NextVal.
 Versão dia 14/08/2010 - Alteração na busca pela sequence da tabela SFN_CONTAFIN, passando para pegar já na inclusão ao invés de ficar adicionando mais um.
 dos participantes do contrato Familia
 Versão dia 21/09/2010 - Retirada do campo RECEBIMENTOINSS da SAM_BENEFICIARIO na atualização de beneficiarios, somente ficando na inclusão.
 Versão dia 27/09/2010 - Alteração na chamada do NextVal da Conta_financeira.
 Versão dia 21/09/2011 - Adicionado o nextval para a anotação administrativa SEQ_SAM0167.NEXTVAL IM106461
 Versão dia 23/09/2011 - Alteração de regra de migração de beneficiários CSC para o SOC, não cancelando participante com motivos 55, 60, 61 e 63;
 Versão dia 20/07/2012 - Adicionada regra para a data de cancelamento do módulo;
 Versão dia  24/07/2012 - Adicionada a regra para reativação do módulo principal;
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Grids, ExtCtrls, DB, DateUtils;

type
  TFrmBeneficiario = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    Shape1: TShape;
    Shape3: TShape;
    Label5: TLabel;
    lblhorasI: TLabel;
    Label7: TLabel;
    lblhorasF: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    lblquery: TLabel;
    lblProcess: TLabel;
    lblImp: TLabel;
    Shape4: TShape;
    Label2: TLabel;
    lblReg: TLabel;
    StaticText1: TStaticText;
    SGGrade: TStringGrid;
    BtnDoc: TBitBtn;
    MEData: TMaskEdit;
    CboContrato: TComboBox;
    BtnMigrar: TBitBtn;
    CBEnd: TCheckBox;
    CBCartoes: TCheckBox;
    CBTEmp: TCheckBox;
    chkselcontrato: TCheckBox;
    procedure BtnMigrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Executar;
    procedure BtnDocClick(Sender: TObject);
    procedure Executar_ControlM;
  private
    { Private declarations }
  public
    { Public declarations }
    nHandleContrato,nPlano,nSituacao,nLotacaoDef,nSecaoDef,nMaxHandleSusp,
    nGrupo,nContrato,nContrato_Old,nNrImport,nErro,nTpDep,nMaxContafin,nMaxhandleRecalcMens,nMaxHandleHistMod,
    nMaxHandleModulos,nMaxHandleDoc,nMaxHandleAnotacao,nMaxHandleAgencia,nFamiliaDepInd,nContVet,nNrDepInd,nMaxHLimite:Integer;
    cDataUltImp,cContrato,cMemoAnotacao,cEHTitular,cDataAdesaoContrato,cDescontoEscalonado,
    cCobrancaDef,cCarenciaDef,cFamiliaTit,cSqlF,cMatAtual,cMatAnterior,cCartaoAntigo,cNaoFaturarModulos,cParentesco:string;
    lInseriuBeneficiario:boolean;
    //Contadores da StringGrid
    nIM,nUM,nIB,nUB,nIF,nUF,nEM,nEB,nEF,nICF,nUCF,
    nECF,nIMod,nUMod,nEMod,nIDoc,nUDoc,nEDoc,nSexoVinculo,nCodVincFamiliaII{,cEstrutura}:integer;
    nHandleFamilia,retorno,cNumero,cMotCSC,cCBOHandle: Integer;
    //Campos do Balance Line*************************************//
    cNome,cSexo,cCpf,cDataNasc,cDataCad,cDataArquivo,cDataComp,cTitu,cCivil,cCarencia,cMascaraBenef,cBenfIndicadorAntigo,
    cDataAdesao,cData1Adesao,{cDataAtenAte,}cMotCancel,cCelular,cMail,cTipoDep,cEstrutura,
    cCodAfinidade,cSitRH,cDireitoAdto,cLimiteAdto,cDataAdocao,cMatriculaFuncional,
    cHandleFamilia,cDataAdesaoFam,cDiaCobranca,{cDataUltReaj,}cDataAlter,cDataCancF,
    cIncBenef,cMotCancF,cFamilia,cCep,cMunicipio,cTelefone1,cTelefone2,cFax,
    cComplemento,cCodTabPreco,cDataMinAdesao,cNomeMae,cPermiteReembolso,cInformativoCorreioEmail,cInformativo,
    cAgenciaGravadora,cAgenciaCSC:string;
    cUsuario,cSenha:string;
    nMotCancel,nLotacaoFam,nMaxCarencia,nDiaCobrancaOracle,nDiaCobrancaOrigOracle,nDiaProximoVencimento,nContaLoopPSFIII:integer;
    lIncluiHistoricoNovo:boolean;
    nSecaoFam,nCODIGOOCUPACAO,nCodDep,Tp_Doc, Contador: integer;
    //***********************************************************//

    Procedure Tratar_CBO;
    Procedure InsertFamilia_Novo;
    Procedure InsertUpdate_Matricula(cTipo:Char);
    Procedure Update_Matricula_Internet(cTipo:Char);
    Procedure Update_Matricula_CPF(cTipo:Char);
    Procedure InsertUpdate_Beneficiario(pInsertUpdate: String);
    procedure InsertUpdate_Beneficiario_Familia;
    Procedure Update_Beneficiario_Internet;
    Procedure InsertUpdate_Familia(cAcao,cTitular:String);
    Function Tratar_Beneficiario_Indicador_Antigo:String;
    Procedure Inserir_AnotAdm_Beneficiario(vCase:integer);
    Function Tratar_MotivoCancelamento:Integer;
    Procedure FechaLog(NroImportacao : integer);
    Procedure RegistraLog (nNroImportacao:Integer;cRegistro,cObservacao:String);
    Function AbreLog(tabela:String):Integer;
    function RetornaPlanoGrupo(nContrato : integer):String;
    Function RepeatChar(nVezes:integer;cChar:string):String;
    Procedure LoadQuerys(cTipo,cTable:String);
    Procedure LoadStringQuery(cTextoSql:string);
    Procedure LoadStringQueryAux(cTextoSql:string);
    Function RetornaMascaraBenef(cFamily,cContrato,cDependente:string):string;
    Function Find_CodVinculo(nVinculo:integer):integer;
    Procedure Filial_Regiao_Endereco(nHandleTit,nHandleDep:integer);
    Function Validou_Funci_Cassi(cBenef:string):boolean;
    Procedure Preparar_Campos_Registro;
    Procedure InsertUpdate_Sam_Endereco;
    Procedure Enderecos_Beneficiario_Titular;
    Function Balance_line(cTipo:String):boolean;
    procedure Conta_Financeira(nHandle:integer);
    Procedure Modulos_Beneficiario(nHandle,contrato:integer);
    Procedure Documentos_Entregues(nHandle:integer);
    Function CartaoAntigo(cCartaoCSC:String;nNrDep:Integer):String;
    Function GerarDVCartao(Cartao:string):String;
    Procedure CancelarFamilia(nTipoContrato:integer);
    Procedure InserirCarencia(handlecar,Beneficiario,carencia,dia:integer);
    Procedure ResetHandle;
    Procedure RecalculoMensalidade(cTipo:string;beneficiario:integer);
    Procedure Inserir_limitacao(vBeneficiario:integer);
    Function MaxHandleCarencia:integer;
    Procedure Cancelar_PDE_PAQ(nTipoPlano:integer);
    Procedure Atualizar_Cartoes_Atuais;
    Function RetornaDepFunciCassi(ehTitFunc,matriculacassi:string):integer;
    Procedure Atualizar_Funci_Adm;
    Function ProcurarParentesco(CodigoVinculo:String):String;
    Procedure Atualizar_Salario_FunciCassi;
    Procedure Atualizar_matricula_funcional_CASSI;
    Procedure CancelarAssociadoExonerado(hBenefExonerado:integer);
    Procedure CancelarDependentesDiretosObito;
    Procedure CancelarMotivoObito(dataCancelamento, dataFalecimento: tDateTime; motivoCancel,HandleBenf, HandleMatricula, HandleFamilia:integer);
    Procedure VerificarDependentesObito(dataCancelamento, dataFalecimento: tDateTime; HandleFamilia:integer);
    Procedure CancelarBeneficiario(dataCancelamento: tDateTime; motivoCancel,HandleBenf:integer);
    procedure AtualizaMotivoCancelamento(handleBenef, motivocancelamento: integer; dataCancelamentoAnt: tDateTime);
    Procedure ATUALIZAR_TIPOPDEP_FUNCCASSI;
    Procedure AtualizarRG;
    Procedure SAM_BENEFICIARIO_PFEVENTO;
    Procedure RetornaTipoDocumento;
    Procedure Grava_log(Tipo,nHandleD,Tabela,nTipo:string);

    Procedure CancelarHistoricoBen(dataCancelamento, motivoCancel:String; HandleBenf:integer);
    Procedure AcertoContaFinanceira;


  end;

var
  FrmBeneficiario: TFrmBeneficiario;
  cRegistroCSC,cRegistroBenner:TStringList;


implementation

uses UDM, Ulogin, uBeneficiarios, Math;

var
    BeneficiarioClass: TBeneficiarios;
    BeneficiarioObj: TBeneficiario;

{$R *.dfm}

procedure TFrmBeneficiario.ATUALIZAR_TIPOPDEP_FUNCCASSI;
var MatriculaCASSI: Integer;
    Change: Boolean;
begin
 try
   LoadStringQuery('SELECT HANDLE,SUBSTR(MATRICULACASSI,1,9) MATRICULACASSI, TIPODEPENDENTE FROM SOCPRO.SAM_BENEFICIARIO WHERE CONTRATO IN (28,35) AND DATACANCELAMENTO IS NULL ORDER BY MATRICULACASSI');
   DM.QrGeral.Open;
   while not DM.QrGeral.Eof do
   begin
       MatriculaCASSI := DM.QrGeral.FieldByName('MATRICULACASSI').Value;
       Change := BeneficiarioClass.FindBeneficiario(MatriculaCASSI, BeneficiarioObj);
       Change := BeneficiarioObj.SAM_CONTRATO_TPDEP > 0;
       Change := Change and (BeneficiarioObj.SAM_CONTRATO_TPDEP <> DM.QrGeral.FieldByName('TIPODEPENDENTE').AsInteger);
       //Ignorar mudança de titular para outro tipo não titular
       Change := Change and (((DM.QrGeral.FieldByName('TIPODEPENDENTE').AsInteger <> 33) and (BeneficiarioObj.SAM_CONTRATO_TPDEP <> 262)) or
                             ((DM.QrGeral.FieldByName('TIPODEPENDENTE').AsInteger = 262) and (BeneficiarioObj.SAM_CONTRATO_TPDEP =  33 )) or
                             ((DM.QrGeral.FieldByName('TIPODEPENDENTE').AsInteger = 33)  and (BeneficiarioObj.SAM_CONTRATO_TPDEP =  262)));
       if Change then
      // try    // Alterado em 13/08/2009
       begin
          DM.QrySaudePro14.SQL.Clear;
          DM.QrySaudePro14.SQL.Add('update sam_beneficiario set tipodependente=' + IntToStr(BeneficiarioObj.SAM_CONTRATO_TPDEP) + ' where handle='+ DM.QrGeral.FieldByName('handle').AsString);
          DM.QrySaudePro14.ExecSQL;
       end;
       DM.QrGeral.Next;
   end;
    DM.QrGeral.Close;
   Except
      On E:Exception do
         Begin
           Grava_Log('2',DM.QrGeral.Fieldbyname('HANDLE').AsString,'B','I');
           RegistraLog(nNrImport,'Numero HANDLE-Benef:' + Inttostr(DM.QrGeral.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'ERRO ATUALIZAR_TIPOPDEP_FUNCCASSI');
           lInseriuBeneficiario:=false;
        End;
   End;
End;

procedure TFrmBeneficiario.CancelarBeneficiario(dataCancelamento: tDateTime; motivoCancel, HandleBenf: integer);
begin
  Try
    Begin
      Dm.QrySaudePro14.Close;
      Dm.QrySaudePro14.SQL.Clear;
      Dm.QrySaudePro14.SQL.Add('UPDATE SAM_BENEFICIARIO SET DATACANCELAMENTO =:DATACANCEL, MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE HANDLE = :BENEFICIARIO');
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').DataType := ftDateTime;
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').Value := dataCancelamento;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := motivoCancel;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Value := Handlebenf;
      Dm.QrySaudePro14.execsql;
    End;
  Except
    On E:Exception do
      Grava_Log('2',IntToStr(Handlebenf),'B','U');
  End;

  Try
    Begin
      if (Handlebenf = 3008909) or (Handlebenf = 3012867) or (Handlebenf = 1882272) or (Handlebenf = 3013333) or (Handlebenf = 3013332) or (Handlebenf = 3013328) or (Handlebenf = 3013326) or (Handlebenf = 3013334) then
        Grava_Log('2',IntToStr(Handlebenf),'BM','U');

      Dm.QrySaudePro14.Close;
      Dm.QrySaudePro14.SQL.Clear;
      Dm.QrySaudePro14.SQL.Add('UPDATE SAM_BENEFICIARIO_MOD SET DATACANCELAMENTO =:DATACANCEL, MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE BENEFICIARIO= :BENEFICIARIO');
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').Datatype := ftDateTime;
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').value := dataCancelamento;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Datatype := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := motivoCancel;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Datatype := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').value := Handlebenf;

      Dm.QrySaudePro14.execsql;
    End;
  Except
    On E:Exception do
      Grava_Log('2',IntToStr(Handlebenf),'BM','U');
  End;

  Try
    Begin
      Dm.QrySaudePro14.Close;
      Dm.QrySaudePro14.SQL.Clear;
      Dm.QrySaudePro14.SQL.Add('UPDATE SAM_BENEFICIARIO_MOD_HISTORICO SET DATACANCELAMENTO =:DATACANCEL, DATAMOVIMENTO = :DATACANCEL, MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE BENEFICIARIOMOD IN (SELECT HANDLE FROM SOCPRO.SAM_BENEFICIARIO_MOD WHERE BENEFICIARIO = :BENEFICIARIO)');
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').Datatype := ftDateTime;
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').value := dataCancelamento;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Datatype := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := motivoCancel;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Datatype := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Value := Handlebenf;


      Dm.QrySaudePro14.execsql;
    End;
  Except
    On E:Exception do
      Grava_Log('2',IntToStr(Handlebenf),'BMH','U');
  End;

  Try
    Begin
      Dm.QrySaudePro14.Close;
      Dm.QrySaudePro14.SQL.Clear;
      Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO_HISTORICO SET DATACANCELAMENTO =:DATACANCEL, DATAMOVIMENTOCANCELAMENTO = :DATACANCEL, MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE HANDLE = ');
      Dm.QrySaudePro14.SQL.Add('  (SELECT MAX(HANDLE) FROM SOCPRO.SAM_BENEFICIARIO_HISTORICO WHERE BENEFICIARIO=:BENEFICIARIO)');
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').Datatype := ftDateTime;
      DM.QrySaudePro14.Parameters.ParamByName('datacancel').Value := dataCancelamento;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Datatype := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := motivoCancel;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Datatype := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Value := Handlebenf;


      Dm.QrySaudePro14.execsql;
    End;
  Except
     On E:Exception do
       Grava_Log('2',IntToStr(Handlebenf),'BH','U');
  End;

end;

Procedure TFrmBeneficiario.CancelarMotivoObito(dataCancelamento, dataFalecimento:tDateTime; motivoCancel,Handlebenf, HandleMatricula, HandleFamilia:integer);
Begin
  //cancelando beneficiário falecido
  CancelarBeneficiario(dataCancelamento, MotivoCancel, HandleBenf);
  //atualizando matricula para falecido
  Try
    Begin
      Dm.QrySaudePro14.Close;
      Dm.QrySaudePro14.SQL.Clear;
      Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_MATRICULA SET DATAFALECIMENTO = :FALECIMENTO WHERE HANDLE= :HANDLE');
      Dm.QrySaudePro14.Parameters.ParamByName('FALECIMENTO').Datatype := ftDateTime;
      Dm.QrySaudePro14.Parameters.ParamByName('FALECIMENTO').value := dataFalecimento;
      Dm.QrySaudePro14.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
      Dm.QrySaudePro14.Parameters.ParamByName('HANDLE').Value := HandleMatricula;
      Dm.QrySaudePro14.execsql;
    End;
  Except
   On E:Exception do
     Grava_Log('2',IntToStr(Handlebenf),'F','U');
  End;

  VerificarDependentesObito(dataCancelamento,  dataFalecimento,  HandleFamilia);

End;


procedure TFrmBeneficiario.CancelarDependentesDiretosObito;
begin
  //pegar os titulares com código RH = 850 Falecidos
  LoadStringQuery('Select TRUNC(SYSDATE) DATAAGORA,'+
                  '       A.HANDLE,'+
                  '       B.DATACANCELAMENTO,'+
                  '       (B.DATACANCELAMENTO+60) ATENDIMENTOATE,'+
                  '       B.FAMILIA,'+
                  '       B.MOTIVOCANCELAMENTO,'+
                  '       C.DATAFALECIMENTO,'+
                  '       B.MATRICULA,'+
                  '       TO_DATE(A.CSC037WDMAFIMYDRTO, ''YYYYMMDD'') FALECIMENTO'+
                  '  FROM SOCPRO.TCSC037_DIFF A'+
                  '  JOIN SOCPRO.SAM_BENEFICIARIO B On B.HANDLE = A.HANDLE'+
                  '  JOIN SOCPRO.SAM_MATRICULA C ON C.HANDLE = B.MATRICULA'+
                  ' Where B.CONTRATO In (2,4,5,6)'+
                  '   And CSC037WCODSITU = 850 And EHTITULAR = ''S'''+
                  '   And CSC037WINDSITY > 0 ');
  DM.QrGeral.Open;
  //VERIFICANDO OS TITULARES COM O MOTIVO = 5 ÓBITO

  While not DM.QrGeral.Eof do
  begin
    if DM.QrGeral.FieldByName('DATAFALECIMENTO').IsNull or (DM.QrGeral.FieldByName('MOTIVOCANCELAMENTO').AsInteger = 44) then
    begin
      if DM.QrGeral.FieldByName('DATACANCELAMENTO').IsNull then
      begin
        //cancelar beneficiario
        CancelarMotivoObito(DM.QrGeral.FieldByName('DATAAGORA').AsDateTime,DM.QrGeral.FieldByName('FALECIMENTO').AsDateTime,5,DM.QrGeral.fieldbyName('handle').AsInteger, DM.QrGeral.fieldbyName('MATRICULA').AsInteger, DM.QrGeral.fieldbyName('familia').AsInteger);
      end
      else
      begin
        if (DM.QrGeral.FieldByName('MOTIVOCANCELAMENTO').AsInteger <> 5) then
        begin
          //atualizar motivo cancelamento
          AtualizaMotivoCancelamento(DM.QrGeral.fieldbyName('handle').AsInteger, 5, DM.QrGeral.FieldByName('DATACANCELAMENTO').AsDateTime);

          if DM.QrGeral.FieldByName('DATAFALECIMENTO').IsNull then
          begin
            Dm.QrySaudePro14.Close;
            Dm.QrySaudePro14.SQL.Clear;
            Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_MATRICULA SET DATAFALECIMENTO = :FALECIMENTO WHERE HANDLE = :HANDLE');
            Dm.QrySaudePro14.Parameters.ParamByName('FALECIMENTO').Datatype := ftDateTime;
            Dm.QrySaudePro14.Parameters.ParamByName('FALECIMENTO').value := DM.QrGeral.fieldbyName('FALECIMENTO').AsDateTime;
            Dm.QrySaudePro14.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
            Dm.QrySaudePro14.Parameters.ParamByName('HANDLE').value := DM.QrGeral.fieldbyName('MATRICULA').AsInteger;
            Dm.QrySaudePro14.execsql;
          end;

          //verificar os dependentes
          VerificarDependentesObito(DM.QrGeral.FieldByName('DATACANCELAMENTO').AsDateTime,  DM.QrGeral.FieldByName('DATAFALECIMENTO').AsDateTime, DM.QrGeral.FieldByName('FAMILIA').AsInteger);

        end;
      end;
    end;
    DM.QrGeral.next;
  end;
end;


Procedure TFrmBeneficiario.CancelarAssociadoExonerado(hBenefExonerado: integer);
VAR datacancelExon,setCampo,cAno,cMes,cDIA:string;
Begin
   //obter a data de cancelamento
   LoadStringQuery('SELECT DATACANCELAMENTO FROM SOCPRO.SAM_BENEFICIARIO WHERE HANDLE=:HANDLE');
   Dm.QrGeral.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
   Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
   DM.QrGeral.Open;
   datacancelExon:='';
   If (DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger <> 55) And (DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger <> 60) And
      (DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger <> 61) And (DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger <> 63) THEN //tem direito ao plano - não cancela
   Begin
     If (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger > 19000101) and
        (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger < 22000101) then //validar a data
     Begin
         cAno:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),1,4);
         cMes:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),5,2);
         cDia:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),7,2);
         datacancelExon:=(cDia+'/'+cMes+'/'+cAno);
         //datacancelExon:=FormatDateTime('dd/mm/yyyyhh:nn:ss',StrToDateTime(datacancelExon));
     End;
   End;

   If trim(datacancelExon)<>'' then
      setCampo:=' set datacancelamento='''+dataCancelExon + ''',motivocancelamento=50 ';

   If (not DM.QrGeral.fieldbyName('DATACANCELAMENTO').IsNull) And (TRIM(Datacancelexon)<>'') then //Alterado em 08/02/2012
      Try
         Begin
            //setCampo:=' set datacancelamento=null, motivocancelamento=null ';
            //cancelar sam_beneficiario
            Dm.QrySaudePro10.Close;
            Dm.QrySaudePro10.SQL.Clear;
            Dm.QrySaudePro10.SQL.Text:='UPDATE SOCPRO.SAM_beneficiario '+ setcampo + ' where handle='+IntToStr(hBenefExonerado);
            Dm.QrySaudePro10.ExecSQL;
         End;
      Except
         On E:Exception do
           Grava_Log('2',IntToStr(hBenefExonerado),'B','U');
      End;

      Try
         Begin
            //cancelar sam_familia
            Dm.QrySaudePro10.Close;
            Dm.QrySaudePro10.SQL.Clear;
            Dm.QrySaudePro10.SQL.Text:='UPDATE SOCPRO.SAM_familia '+ setcampo + ' where handle='+IntToStr(hBenefExonerado);
            Dm.QrySaudePro10.ExecSQL;
         End;
      Except
         On E:Exception do
           Grava_Log('2',IntToStr(hBenefExonerado),'F','U');
      End;

      Try
         Begin
            //cancelar sam_beneficiario_historico
            Dm.QrySaudePro10.Close;
            Dm.QrySaudePro10.SQL.Clear;
            Dm.QrySaudePro10.SQL.Text:='UPDATE SOCPRO.SAM_beneficiario_historico '+ setcampo + ' where beneficiario='+IntToStr(hBenefExonerado);
            Dm.QrySaudePro10.ExecSQL;
         End;
      Except
         On E:Exception do
           Grava_Log('2',IntToStr(hBenefExonerado),'BH','U');
      End;

      Try
         Begin
           if (hBenefExonerado = 3008909) or (hBenefExonerado = 3012867) or (hBenefExonerado = 1882272) or (hBenefExonerado = 3013333) or (hBenefExonerado = 3013332) or (hBenefExonerado = 3013328) or (hBenefExonerado = 3013326) or (hBenefExonerado = 3013334) then
              Grava_Log('2',IntToStr(hBenefExonerado),'BM','U');
            //cancelar sam_beneficiario_mod
            Dm.QrySaudePro10.Close;
            Dm.QrySaudePro10.SQL.Clear;
            Dm.QrySaudePro10.SQL.Text:='UPDATE SOCPRO.SAM_beneficiario_mod '+ setcampo + ' where beneficiario='+IntToStr(hBenefExonerado);
            Dm.QrySaudePro10.ExecSQL;
         End;
      Except
         On E:Exception do
           Grava_Log('2',IntToStr(hBenefExonerado),'BM','U');
      End;

      Try
         Begin
            //cancelar sam_beneficiario_mod_historico
            Dm.QrySaudePro10.Close;
            Dm.QrySaudePro10.SQL.Clear;
            Dm.QrySaudePro10.SQL.Text:='UPDATE SOCPRO.SAM_beneficiario_mod_historico '+ setcampo + ',datamovimento=sysdate where beneficiariomod in (select handle FROM SOCPRO.SAM_beneficiario_mod where beneficiario='+IntToStr(hBenefExonerado)+')';
           Dm.QrySaudePro10.ExecSQL;
         End;
      Except
         On E:Exception do
           Grava_Log('2',IntToStr(hBenefExonerado),'BMH','U');
      End;
End;

Procedure TFrmBeneficiario.Atualizar_Funci_Adm;
var v_servico:String;
//Atualizar o campo servicoproprio existente na tabela tcsc037_diff e tcsc037
begin
    LoadStringQuery('select handle,csc037wmtrbenf FROM SOCPRO.TCSC037_diff where csc037wcodgrpobenf=7');
    Dm.QrGeral.Open;
    While not Dm.qrgeral.Eof do
    begin
       Dm.QrySaudePro14.Close;
       Dm.QrySaudePro14.SQL.Clear;
       Dm.QrySaudePro14.SQL.Text:='select count(*) qtd FROM SOCPRO.SAM_beneficiario where handle='+Dm.QrGeral.fieldbyName('handle').AsString;
       Dm.QrySaudePro14.open;
       if DM.qrysaudepro14.fieldbyName('qtd').value = 0 then //não existe no SOC
       begin
         if BeneficiarioClass.FindBeneficiario(Dm.QrGeral.fieldbyname('csc037wmtrbenf').asinteger,BeneficiarioObj) then
         begin
						v_servico := IntToStr(IfThen(BeneficiarioObj.TipoMaoDeObra = tmoAdministrativa, 0, 1));

            //Implementado dia 05/02/07 - Definido pela Viviane Canedo
            //Pesquisar o campo SERVICOPROPRIO do titular e atualizar o campo dos dependentes
            if not beneficiarioObj.Titular then
            begin
                Dm.QrySaudePro14.Close;
                Dm.QrySaudePro14.SQL.Clear;
                Dm.QrySaudePro14.SQL.Text:='select servicoproprio FROM SOCPRO.TCSC037 where csc037wmtrbenf='+IntToStr(BeneficiarioObj.MatriculaCSCTitular);
                Dm.QrySaudePro14.open;

                if not DM.QrySaudePro14.fieldbyName('servicoproprio').IsNull then
                   v_servico := IntToStr(DM.QrySaudePro14.fieldbyName('servicoproprio').value);
            end; //até aqui - dia 05/02/07

            Try
               Begin
                  //Atualizar a FULL
                  Dm.QrySaudePro14.Close;
                  Dm.QrySaudePro14.SQL.Clear;
                  Dm.QrySaudePro14.SQL.Text:='update tcsc037 set servicoproprio='+v_servico+' where handle='+Dm.QrGeral.fieldbyName('handle').AsString;
                  Dm.QrySaudePro14.execSql;
               End;
            Except
               On E:Exception do
                  Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'T37','U');
            End;

            Try
               Begin
                  //Atualizar a DIFF
                  Dm.QrySaudePro14.Close;
                  Dm.QrySaudePro14.SQL.Clear;
                  Dm.QrySaudePro14.SQL.Text:='update tcsc037_diff set servicoproprio='+v_servico+' where handle='+Dm.QrGeral.fieldbyName('handle').AsString;
                  Dm.QrySaudePro14.execSql;
               End;
           Except
               On E:Exception do
                  Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'T37D','U');
           End;
         end;
       end;
       Dm.QrGeral.next;
    end;
end;

Function TFrmBeneficiario.RetornaDepFunciCassi(ehTitFunc,matriculacassi:string):integer;
{Objetivo: Retornar o número dep para o funcionário CASSI de acordo com os dependentes já cadastrados
           na família do Titular. Como o controle do número dep é feito pelo programa de migração e não
           pelo CSC, tivemos que implmentar esta função para não ocorrer a duplicidade do número do beneficiário.
}
var comando:string;
begin
    //verifica se o é beneficiário novo
    result:=0;
    LoadStringQuery('select handle FROM SOCPRO.SAM_beneficiario where handle=:handle');
    Dm.QrGeral.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
    Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    DM.QrGeral.Open;
    if ehTitFunc='S' then //é titular do plano
    begin
        if not Dm.QrGeral.FieldByName('HANDLE').IsNull then
        begin
           LoadStringquery('select to_number(substr(beneficiario,13,2)) DEP FROM SOCPRO.SAM_beneficiario where handle=:handle');
           Dm.QrGeral.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
           Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
           DM.QrGeral.Open;
           result:=DM.QrGeral.FieldByname('DEP').AsInteger;
        end
        else
        begin
          result:=0;
          comando:='select max(to_number(substr(beneficiario,13,2)))+1 dep'+
                   '  FROM SOCPRO.SAM_beneficiario '+
                   ' where substr(beneficiario,1,12)='''+cContrato+RepeatChar(4,'0')+copy(Matriculacassi,5,5)+'''';

          LoadStringQuery(Comando);
          DM.QrGeral.Open;
          if not DM.QrGeral.FieldByname('dep').isNull then //incluído dia 12/09/06 --não tem nenhum dep - o primeiro será sempre zero
             Result:=DM.QrGeral.FieldByname('DEP').AsInteger;
        end;
    end
    else if Dm.QrGeral.FieldByName('HANDLE').IsNull then //é dependente e é registro novo
    begin
       comando:='select max(to_number(substr(beneficiario,13,2)))+1 dep'+
                '  FROM SOCPRO.SAM_beneficiario '+
                ' where substr(beneficiario,1,12)='''+cContrato+RepeatChar(4,'0')+copy(Matriculacassi,5,5)+'''';
{                ' where familia=(select familia '+
                '                  FROM SOCPRO.SAM_beneficiario '+
                '                  where matriculacassi= '''+ IntToStr(beneficiarioObj.MatriculaCSCTitular) + '80'')';
}
       LoadStringQuery(Comando);
       DM.QrGeral.Open;
       if DM.QrGeral.FieldByname('DEP').isNull then //incluído dia 12/09/06 --não tem nenhum dep - o primeiro será sempre zero
          Result:=1
       else
          result:=DM.QrGeral.FieldByname('DEP').AsInteger;
    end
    else //Atualização - copia o número dep da string BENEFICIARIO
    begin
       LoadStringquery('select to_number(substr(beneficiario,13,2)) DEP FROM SOCPRO.SAM_beneficiario where handle=:handle');
       Dm.QrGeral.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
       Dm.QrGeral.Parameters.ParamByName('HANDLE').Value:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
       DM.QrGeral.Open;
       result:=DM.QrGeral.FieldByname('DEP').AsInteger;
    end;
end;

Procedure TFrmBeneficiario.Atualizar_Cartoes_Atuais;//Alessandro 17/02/05
Var nLoops:integer;
Begin
   loadStringQuery('select matriculacassi,to_number(substr(codigoantigo,5,8)),csc037wnrocart,contrato,csc037wnrodepy,a.handle '+
                   '  FROM SOCPRO.SAM_beneficiario a '+
                   '       JOIN SOCPRO.TCSC037 b on a.handle=b.handle '+
                   ' where to_number(substr(codigoantigo,5,8))<>csc037wnrocart '+
                   '       and csc037wnrocart < 999999999 ');
   Dm.QrGeral.Open;

   Dm.QrySaudePro14.Close;
   Dm.QrySaudePro14.SQL.Text:='UPDATE SOCPRO.SAM_beneficiario set codigoantigo=:codigoantigo where handle=:handle';
   nLoops:=0;
   While not DM.QrGeral.Eof do
      Try
         Begin
            nHandleContrato:=DM.QrGeral.fieldbyName('contrato').Value;
            Dm.QrySaudePro14.Parameters.ParamByName('codigoantigo').DataType := ftString;
            Dm.QrySaudePro14.Parameters.ParamByName('codigoantigo').Value:=CartaoAntigo(RepeatChar(8-length(Trim(DM.QrGeral.Fieldbyname('CSC037WNROCART').AsString)),'0')+
                                                                   Trim(DM.QrGeral.Fieldbyname('CSC037WNROCART').AsString),DM.QrGeral.fieldbyName('csc037wnrodepy').value);
            Dm.QrySaudePro14.Parameters.ParamByName('handle').value:=DM.QrGeral.fieldbyName('handle').Value;
            Dm.QrySaudePro14.ExecSQL;
            Inc(nLoops);
            lblReg.Caption:=IntToStr(nLoops);
            lblReg.Refresh;
            DM.qrGeral.next;
         End;
      Except
         On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'B','U');
      End;
End;

procedure TFrmBeneficiario.Cancelar_PDE_PAQ(nTipoPlano:integer);
var dDataAdesao:Tdatetime;
    cDataAdesao,cDiaCb,cOrigem,cModuloOrigem:string;
    HcontratoPDEPAQ:integer;
begin
     case nTipoPlano of
       //0 - PDE / 1 - FAMILIA II - NOVO PAQ / 2 - FAMILIA II - PAQ
       0 : LoadStringQuery(' select sbP.handle handleBPDEPAQ,sbP.dataadesao adesaoPDEPAQ,'+
                           '        sbf.Handle handleBFam,sbF.matriculacassi matriculaFam,'+
                           '        sbm.handle HandleModFam'+
                           '   FROM SOCPRO.SAM_beneficiario sbP '+
                           '        JOIN SOCPRO.SAM_beneficiario sbf on sbP.matriculacassi=sbF.matriculacassi'+
                           '        JOIN SOCPRO.SAM_beneficiario_mod sbm on sbm.beneficiario=sbF.handle        '+
                           ' where sbp.contrato=40 and sbF.contrato=24  ');
       1 : LoadStringQuery(' select sbP.handle handleBPDEPAQ,sbP.dataadesao adesaoPDEPAQ,'+
                           '        sbf.Handle handleBFam,sbF.matriculacassi matriculaFam,'+
                           '        sbm.handle HandleModFam'+
                           '   FROM SOCPRO.SAM_beneficiario sbP '+
                           '        JOIN SOCPRO.SAM_beneficiario sbf on sbP.matriculacassi=sbF.matriculacassi'+
                           '        JOIN SOCPRO.SAM_beneficiario_mod sbm on sbm.beneficiario=sbF.handle        '+
                           ' where sbp.contrato=43 and sbF.contrato=24  ');
       2 : LoadStringQuery(' select sbP.handle handleBPDEPAQ,sbP.dataadesao adesaoPDEPAQ,'+
                           '        sbf.Handle handleBFam,sbF.matriculacassi matriculaFam,'+
                           '        sbm.handle HandleModFam'+
                           '   FROM SOCPRO.SAM_beneficiario sbP '+
                           '        JOIN SOCPRO.SAM_beneficiario sbf on sbP.matriculacassi=sbF.matriculacassi'+
                           '        JOIN SOCPRO.SAM_beneficiario_mod sbm on sbm.beneficiario=sbF.handle        '+
                           ' where sbp.contrato=25 and sbF.contrato=24  ');
     end;

     HContratoPDEPAQ:=40;
     if nTipoPlano=1 then
        HContratoPDEPAQ:=43
     else if nTipoPlano=2 then
        HContratoPDEPAQ:=25;


     DM.qrGeral.open;
     While not Dm.QrGeral.Eof do
     Begin
       dDataAdesao:=DM.QrGeral.FieldByName('adesaoPDEPAQ').value;
       dDataAdesao:=IncMonth(dDataAdesao,12);
       cDataAdesao:=FormatDateTime('dd/mm/yyyyhh:nn:ss',dDataadesao);
       cOrigem:='M';

       Try
         Begin
            //Atualizando a Sam_beneficiario
           Dm.QrySaudePro7.Close;
           Dm.QrySaudePro7.SQL.Clear;
           Dm.QrySaudePro7.SQL.Add('UPDATE SAM_BENEFICIARIO');
           Dm.QrySaudePro7.SQL.Add('   SET DATACANCELAMENTO =:datacancelamento,');
           Dm.QrySaudePro7.SQL.Add('       MOTIVOCANCELAMENTO=31,              ');
           Dm.QrySaudePro7.SQL.Add('       MATRICULACASSI =:matriculacassi     ');
           Dm.QrySaudePro7.SQL.Add('  WHERE HANDLE=:handle and contrato=:contrato');
           Dm.QrySaudePro7.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
           Dm.QrySaudePro7.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
           Dm.QrySaudePro7.Parameters.ParamByName('matriculacassi').DataType := ftString;
           Dm.QrySaudePro7.Parameters.ParamByName('matriculacassi').value  :='C' + Dm.QrGeral.fieldByName('matriculaFam').AsString;
           Dm.QrySaudePro7.Parameters.ParamByName('handle').DataType := ftInteger;
           Dm.QrySaudePro7.Parameters.ParamByName('handle').value          :=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
           Dm.QrySaudePro7.Parameters.ParamByName('contrato').DataType := ftInteger;
           Dm.QrySaudePro7.Parameters.ParamByName('contrato').value        :=HcontratoPDEPAQ;
           Dm.QrySaudePro7.ExecSQL;
         End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'B','U');
        End;
        // S.C - 216038 e 216040 - 11/06/2008
        Try
          Begin
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_beneficiario set dataadesao=:dataadesao where handle='+Dm.QrGeral.fieldbyName('handleBFam').AsString);
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').VALUE:=StrtoDateTime(cDataadesao);
            DM.QrySaudePro14.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'B','U');
        End;

        Try
          Begin
              //Atualizando a Sam_familia
            Dm.QrySaudePro6.Close;
            Dm.QrySaudePro6.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
            Dm.QrySaudePro6.Parameters.ParamByName('handle').value          :=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
            Dm.QrySaudePro6.Parameters.ParamByName('contrato').value        :=HcontratoPDEPAQ;
            Dm.QrySaudePro6.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'F','U');
        End;

        Try
          Begin
              // S.C - 216038 e 216040 - 11/06/2008
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_familia set dataadesao=:dataadesao where handle='+Dm.QrGeral.fieldbyName('handleBFam').AsString);
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').VALUE:=StrtoDateTime(cDataadesao);
            DM.QrySaudePro14.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'F','U');
        End;

        Try
          Begin
              //Atualizando a SAM_BENEFICIARIO_MOD
            Dm.QrySaudePro8.Close;
            Dm.QrySaudePro8.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
            Dm.QrySaudePro8.Parameters.ParamByName('beneficiario').value    :=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
            Dm.QrySaudePro8.Parameters.ParamByName('contrato').value        :=HcontratoPDEPAQ;
            Dm.QrySaudePro8.execSql;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'BM','U');
        End;

        Try
          Begin
              // S.C -  216038 e 216040 - 11/06/2008
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_beneficiario_mod set dataadesao=:dataadesao where beneficiario='+Dm.QrGeral.fieldbyName('handleBFam').AsString);
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').VALUE:=StrtoDateTime(cDataadesao);
            DM.QrySaudePro14.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'BM','U');
        End;

        Try
          Begin
              //Atualizando a SAM_BENEFICIARIO_MOD_HISTORICO  - 31/07/2003
            dm.QrySaudePro4.close;
            DM.QrySaudePro4.SQL.Clear;
            DM.QrySaudePro4.SQL.Add('update sam_beneficiario_mod_historico');
            DM.QrySaudePro4.SQL.Add('   set motivocancelamento = 31,      ');
            DM.QrySaudePro4.SQL.Add('        datacancelamento = :datacancelamento,');
            DM.QrySaudePro4.SQL.Add('        DATAMOVIMENTO = :MOVIMENTO           ');
            DM.QrySaudePro4.SQL.Add('where beneficiariomod in                   ');
            DM.QrySaudePro4.SQL.Add('(                                          ');
            DM.QrySaudePro4.SQL.Add('select handle                              ');
            DM.QrySaudePro4.SQL.Add(' from sam_beneficiario_mod                 ');
            DM.QrySaudePro4.SQL.Add('where beneficiario = :beneficiario and contrato = :contrato');
            DM.QrySaudePro4.SQL.Add(')');
            DM.QrySaudePro4.Parameters.ParamByName('datacancelamento').DataType := ftDatetime;
            DM.QrySaudePro4.Parameters.ParamByName('datacancelamento').Value:=StrtoDateTime(cDataAdesao);
            DM.QrySaudePro4.Parameters.ParamByName('MOVIMENTO').DataType := ftDateTime;
            DM.QrySaudePro4.Parameters.ParamByName('MOVIMENTO').Value       :=now;
            DM.QrySaudePro4.Parameters.ParamByName('beneficiario').DataType := ftInteger;
            DM.QrySaudePro4.Parameters.ParamByName('beneficiario').Value    :=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
            Dm.QrySaudePro4.Parameters.ParamByName('contrato').DataType := ftInteger;
            Dm.QrySaudePro4.Parameters.ParamByName('contrato').value        :=HcontratoPDEPAQ;
            DM.QrySaudePro4.ExecSql;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'BMH','U');
        End;

        Try
          Begin
            //Atualizando a SAM_BENEFICIARIO_MOD_HISTORICO Origem no Novo Handle - 29/09/2008
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_beneficiario_mod_historico set origem=:corigem where beneficiariomod in (select handle FROM SOCPRO.SAM_beneficiario_mod where beneficiario=:handle)');
            DM.QrySaudePro14.Parameters.ParamByName('CORIGEM').DataType := ftString;
            DM.QrySaudePro14.Parameters.ParamByName('CORIGEM').VALUE:=cOrigem;
            DM.QrySaudePro14.Parameters.ParamByName('HANDLE').DataType := ftInteger;
            DM.QrySaudePro14.Parameters.ParamByName('HANDLE').Value:=Dm.QrGeral.fieldbyName('handleBFam').AsString;
            DM.QrySaudePro14.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'BMH','U');
        End;

        //Atualizando a SAM_BENEFICIARIO_MOD_HISTORICO Modulo Origem no Novo Handle - 29/09/2008
        DM.QrySaudePro15.Close;
        DM.QrySaudePro15.Parameters.ParamByName('HANDLE').DataType := ftInteger;
        DM.QrySaudePro15.Parameters.ParamByName('HANDLE').value:=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
        DM.QrySaudePro15.Open;

        If not DM.QrySaudePro15.IsEmpty then
        Try
          Begin
            cModuloOrigem:=DM.QrySaudePro15.FieldByName('HANDLE').Value;
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_beneficiario_mod_historico set beneficiariomodorigem=:cmoduloorigem where beneficiariomod in (select handle FROM SOCPRO.SAM_beneficiario_mod where beneficiario=:handle)');
            DM.QrySaudePro14.Parameters.ParamByName('CMODULOORIGEM').DataType := ftString;
            DM.QrySaudePro14.Parameters.ParamByName('CMODULOORIGEM').VALUE:=cModuloOrigem;
            DM.QrySaudePro14.Parameters.ParamByName('HANDLE').DataType := ftInteger;
            DM.QrySaudePro14.Parameters.ParamByName('HANDLE').Value:=Dm.QrGeral.fieldbyName('handleBFam').AsString;
            DM.QrySaudePro14.ExecSQL;
          End;
         Except
           On E:Exception do
             Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'BMH','U');
        End;

        Try
          Begin
              // S.C - 216038 e 216040 - 11/06/2008
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_beneficiario_mod_historico set dataativacao=:dataadesao where beneficiariomod in (select handle FROM SOCPRO.SAM_beneficiario_mod where beneficiario='+Dm.QrGeral.fieldbyName('handleBFam').AsString+')');
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').VALUE := StrtoDateTime(cDataadesao);
            DM.QrySaudePro14.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'BMH','U');
        End;

        Try
          Begin
              //Atualizando a SAM_BENEFICIARIO_HISTORICO - 31/07/2003
            dm.QrySaudePro5.close;
            dm.QrySaudePro5.SQL.Clear;
            dm.QrySaudePro5.SQL.Add('update sam_beneficiario_historico');
            dm.QrySaudePro5.SQL.Add('   set motivocancelamento = 31,');
            dm.QrySaudePro5.SQL.Add('        datacancelamento = :datacancelamento');
            dm.QrySaudePro5.SQL.Add('where beneficiario = :beneficiario          ');
            DM.QrySaudePro5.Parameters.ParamByName('datacancelamento').DataType := ftDatetime;
            DM.QrySaudePro5.Parameters.ParamByName('datacancelamento').Value:=StrtoDateTime(cDataAdesao);
            DM.QrySaudePro5.Parameters.ParamByName('beneficiario').DataType := ftInteger;
            DM.QrySaudePro5.Parameters.ParamByName('beneficiario').Value    :=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
            DM.QrySaudePro5.ExecSql;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'BH','U');
        End;

        Try
          Begin
              // S.C - 216038 e 216040 - 11/06/2008
            DM.QrySaudePro14.SQL.Clear;
            DM.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_beneficiario_historico set dataativacao = :dataadesao where beneficiario = '+Dm.QrGeral.fieldbyName('handleBFam').AsString);
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
            DM.QrySaudePro14.Parameters.ParamByName('DATAADESAO').VALUE:=StrtoDateTime(cDataadesao);
            DM.QrySaudePro14.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBFam').AsString,'BH','U');
        End;

        //Atualizando a SAM_BENEFICIARIO_CARTAOIDENTIF
        Try
          Begin
            Dm.QrySaudePro14.Close;
            Dm.QrySaudePro14.SQL.Clear;
            Dm.QrySaudePro14.SQL.Text:='select count(*) qtd FROM SOCPRO.SAM_beneficiario_cartaoidentif '+
                                       ' where beneficiario='+Dm.QrGeral.fieldbyName('handleBPDEPAQ').Asstring;
            Dm.QrySaudePro14.Open;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'BC','U');
        End;

        If Dm.QrySaudePro14.FieldByName('qtd').Value > 0 then
        Try
          Begin
            Dm.QrySaudePro9.Close;
            Dm.QrySaudePro9.SQL.Clear;
            Dm.QrySaudePro9.SQL.Add('UPDATE SAM_BENEFICIARIO_CARTAOIDENTIF');
            Dm.QrySaudePro9.SQL.Add('   SET DATACANCELAMENTO  =:datacancelamento');
            Dm.QrySaudePro9.SQL.Add('       WHERE BENEFICIARIO=:beneficiario    ');
            Dm.QrySaudePro9.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
            Dm.QrySaudePro9.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
            Dm.QrySaudePro9.Parameters.ParamByName('beneficiario').DataType := ftInteger;
            Dm.QrySaudePro9.Parameters.ParamByName('beneficiario').value    :=Dm.QrGeral.fieldbyName('handleBPDEPAQ').value;
            Dm.QrySaudePro9.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('handleBPDEPAQ').AsString,'B','U');
        End;

        //Update no Campo Nossonumeroimportacao=null -
        Try
          Begin
            DM.QrUpNosNumI.Close;
            DM.QrUpNosNumI.SQL.Clear;
            DM.QrUpNosNumI.SQL.Add('update sam_familia');
            DM.QrUpNosNumI.SQL.Add('   set nossonumeroimportacao = null,');
            DM.QrUpNosNumI.SQL.Add('       motivobloqueio = null,       ');
            DM.QrUpNosNumI.SQL.Add('       databloqueio = null          ');
            DM.QrUpNosNumI.SQL.Add(' where familia = :familia           ');
            DM.QrUpNosNumI.Parameters.ParamByName('familia').DataType := ftString;
            DM.QrUpNosNumI.Parameters.ParamByName('familia').value:=copy(Dm.QrGeral.fieldByName('matriculaFam').value,1,9);
            DM.QrUpNosNumI.ExecSQL;
          End;
        Except
          On E:Exception do
            Grava_Log('2',Dm.QrGeral.fieldbyName('matriculaFam').AsString,'B','U');
        End;

        //Inserir o registro na sfn_fatura_lanc_mod para possibilitar a geração da 1º fatura
        DM.qrminHandleMod.close;
        DM.qrminHandleMod.open;

        dm.QrGeral.Next;
     End;
End;


Function TFrmBeneficiario.MaxHandleCarencia:Integer;
var nMax:Integer;
begin
  Dm.QrySaudePro13.Close;
  Dm.QrySaudePro13.SQL.Clear;
  Dm.QrySaudePro13.SQL.Add('select SEQ_BEN0017.nextval nMAX from DUAL ');
  Dm.QrySaudePro13.Open;
  if not Dm.QrySaudePro13.FieldByName('nmax').IsNull then
     nMax:=Dm.QrySaudePro13.FieldByName('nmax').Value
  else
     nMax:=0;
  Result:=nMax;
end;


Procedure TFrmBeneficiario.InserirCarencia(handleCar,Beneficiario,carencia,dia:integer);
Begin
  Try
    Begin
      Dm.QrySaudePro13.Close;
      DM.QrySaudePro13.SQL.Text:='INSERT INTO SOCPRO.SAM_BENEFICIARIO_CARENCIA '+
                                  '(HANDLE,BENEFICIARIO,CARENCIA,QTDDIA,CONTRATO,QTDDIASREDEPROPRIA,TABREGRAREDE,TABREGRAREDEPROPRIA)'+
                                  ' VALUES '+
                                  '('+IntToStr(HandleCar)+','+IntToStr(Beneficiario)+','+IntToStr(Carencia)+','+IntToStr(dia)+',24,'+IntToStr(dia)+',1,1)';
      Dm.QrySaudePro13.ExecSQL;
    End;
  Except
    On E:Exception do
       Grava_Log('2',IntToStr(Beneficiario),'BC','I');
  End;

End;


Procedure TFrmBeneficiario.Inserir_limitacao(vBeneficiario:integer);
Var dataaux:TDatetime;
Begin
  Try
    Begin
          //Familia 100 mil
      nMaxHLimite:=0;
      DM.Qr_handle.Close;
      Dm.Qr_handle.Sql.Clear;
      Dm.Qr_handle.SQL.Add('SELECT SEQ_SAM0181.NEXTVAL HANDLE FROM DUAL');
      Dm.Qr_handle.Open;
      nMaxHlimite:=DM.Qr_handle.Fieldbyname('HANDLE').AsInteger;

      DM.qrinslimitacao.Close;
      DM.qrinslimitacao.Sql.Clear;
      DM.qrinslimitacao.Sql.Add('insert into sam_beneficiario_limitacao');
      DM.qrinslimitacao.Sql.Add('(handle,datainicial,datafinal,periodocontagem,qtdlimite,');
      DM.qrinslimitacao.Sql.Add(' tipolimitacao,limitacao,contrato,tabtipolimite,beneficiario)');
      DM.qrinslimitacao.Sql.Add(' values');
      DM.qrinslimitacao.Sql.Add('(:handle,:datainicial,:datafinal,1,1,''A'',701,24,1,:beneficiario)');
      DM.qrinslimitacao.Parameters.ParamByName('handle').Datatype := ftInteger;
      DM.qrinslimitacao.Parameters.ParamByName('handle').value := nMaxHLimite;
      DM.QrInsLimitacao.Parameters.ParamByName('datainicial').DataType := ftDatetime;
      DM.QrInsLimitacao.Parameters.ParamByName('datainicial').value  := StrToDateTime(cDataAdesao);
      dataaux:=StrToDateTime(cDataAdesao);
      dataaux:=(dataaux + 30) - 1;
      DM.QrInsLimitacao.Parameters.ParamByName('datafinal').DataType := ftDatetime;
      DM.qrinsLimitacao.Parameters.ParamByName('datafinal').value :=StrToDateTime(FormatDateTime('dd/mm/yyyyhh:nn:ss',dataaux));
      DM.QrInsLimitacao.Parameters.ParamByName('beneficiario').DataType := ftInteger;
      DM.QrInsLimitacao.Parameters.ParamByName('beneficiario').value := vbeneficiario;
      DM.QrInsLimitacao.execSql;
    End;
  Except
    On E:Exception do
      Grava_Log('2',IntToStr(VBeneficiario),'L','U');
  End;
End;


procedure TFrmBeneficiario.CancelarFamilia(nTipoContrato:integer);
var cdataadesao:string;
    ddataadesao:TDateTime;
    nBenefOrigem,nBenefDestino:integer;
begin
    //Alessandro  28/01/2003
    if nTipoContrato = 23 then
    begin

        //Selecionar todas as Famílias I que foram migradas para o Família II
        lblProcess.Caption:='Atualizando campo "MIGRADO" para Família II';
        lblProcess.Refresh;
        LoadStringQuery('UPDATE SOCPRO.SAM_beneficiario '+
                        '   set migrado=''S'' '+
                        ' where contrato=24 and substr(matriculacassi,1,3)=''100'' and migrado is null');
        Dm.QrGeral.ExecSql;

        lblProcess.Caption:='Cancelando Família I que migrou para Família II';
        lblProcess.Refresh;
        LoadStringQuery('select sb.handle,sb.matriculacassi,sb.dataadesao,sf.naoincidedescontoescalonado '+
                        '  FROM SOCPRO.SAM_beneficiario sb'+
                        '       JOIN SOCPRO.SAM_familia sf on sf.handle=sb.handle '+
                        ' where sb.contrato=24 and substr(sb.matriculacassi,1,3)=''100''');
    end
    else if nTipoContrato = 7 then //Dependente Indireto
    begin
      lblProcess.Caption:='Atualizando campo "MIGRADO" para os Dependentes Indiretos';
      lblProcess.Refresh;
      LoadStringQuery('UPDATE SOCPRO.SAM_BENEFICIARIO '+
                        '   SET MIGRADO=''S'' '+
                        ' WHERE HANDLE IN ( '+
                        '       SELECT BEN2.HANDLE BEN_DEP_INDIRETO '+
                        '         FROM SOCPRO.SAM_BENEFICIARIO BEN1 '+
                        '              JOIN SOCPRO.SAM_BENEFICIARIO BEN2 ON BEN1.MATRICULACASSI=BEN2.MATRICULACASSI '+
                        '        WHERE BEN1.CONTRATO IN (2,4) AND BEN2.CONTRATO=7 AND (BEN2.MIGRADO IS NULL OR BEN2.MIGRADO=''N'') )');
      Dm.QrGeral.ExecSql;

      lblProcess.Caption:='Cancelando Associados e Aposentados que migraram para D.I.';
      lblProcess.Refresh;
      LoadStringQuery('SELECT BEN1.HANDLE BEN_ASSOC_APOS,'+
                      '       BEN1.CONTRATO CONTRATO_ORIG,'+
                      '       BEN1.MATRICULACASSI, '+
                      '       BEN1.FAMILIA, '+
                      '       BEN1.EHTITULAR,'+
                      '       BEN2.DATAADESAO,'+
                      '       BEN2.HANDLE BEN_DEP_INDIRETO, '+
                      '       BEN1.HANDLE '+
                      '  FROM SOCPRO.SAM_BENEFICIARIO BEN1 '+
                      '       JOIN SOCPRO.SAM_BENEFICIARIO BEN2 ON BEN1.MATRICULACASSI=BEN2.MATRICULACASSI '+
                      '  WHERE BEN1.CONTRATO IN (2,4) AND BEN2.CONTRATO=7 AND BEN1.DATACANCELAMENTO IS NULL AND BEN1.HANDLE <> 431420');
      ddataadesao:=now + 10;//email do Lindomar
    end
    else if nTipoContrato =2324 then //incluído no dia 11/01/2008 - Família III
    begin
        //Selecionar todas os participantes do PSF I e II que foram migradas para o Família III
        lblProcess.Caption:='Atualizando campo "MIGRADO" para Família III';
        lblProcess.Refresh;
        if nContaLoopPSFIII=0 then //Executar somente para o família I que migrou pro Família III
        begin
          nTipoContrato:=23;
          LoadStringQuery('UPDATE SOCPRO.SAM_beneficiario '+
                          '   set migrado=''S'' '+
                          ' where contrato=37 and substr(matriculacassi,1,3)=''100'' and migrado is Null');
          Dm.QrGeral.ExecSql;
        end
        else //Executar somente para o família II que migrou pro Família III
        begin
          nTipoContrato:=24;
          LoadStringQuery('UPDATE SOCPRO.SAM_beneficiario '+
                          '   set migrado=''S'' '+
                          ' where contrato=37 and substr(matriculacassi,1,3) In (''110'',''120'',''150'',''160'') and migrado is Null'); //nova matricula familia 160 - wilson aqui
          Dm.QrGeral.ExecSql;
        end;

        lblProcess.Caption:='Cancelando participantes PSF I e II que migrarm para Família III';
        lblProcess.Refresh;
        if nContaloopPSFIII=0 then //somente para o família I que migrou para o família III
           LoadStringQuery('select sb.handle,sb.matriculacassi,sb.dataadesao,sf.naoincidedescontoescalonado '+
                           '  FROM SOCPRO.SAM_beneficiario sb'+
                           '       JOIN SOCPRO.SAM_familia sf on sf.handle=sb.FAMILIA '+
                           ' where sb.contrato=37 and substr(matriculacassi,1,3)=''100'' and migrado is Null')
        else //somente para o família II que migrou para o família III
           LoadStringQuery('select sb.handle,sb.matriculacassi,sb.dataadesao,sf.naoincidedescontoescalonado '+
                           '  FROM SOCPRO.SAM_beneficiario sb'+
                           '       JOIN SOCPRO.SAM_familia sf on sf.handle=sb.FAMILIA '+
                           ' where sb.contrato=37 and substr(matriculacassi,1,3) In (''110'',''120'',''150'',''160'') and migrado is Null');
    end
    else //Associado que se aposentou - incluído dia 08/11/07
    begin
      lblProcess.Caption:='Atualizando campo "MIGRADO" para os Aposentados';
      lblProcess.Refresh;
      LoadStringQuery('UPDATE SOCPRO.SAM_BENEFICIARIO '+
                        '   SET MIGRADO=''S'' '+
                        ' WHERE HANDLE IN ( '+
                        '       SELECT BEN2.HANDLE BENEF_APOSENTADO '+
                        '         FROM SOCPRO.SAM_BENEFICIARIO BEN1 '+
                        '              JOIN SOCPRO.SAM_BENEFICIARIO BEN2 ON BEN1.MATRICULACASSI=BEN2.MATRICULACASSI '+
                        '        WHERE BEN1.CONTRATO=2 AND BEN2.CONTRATO=4 AND (BEN2.MIGRADO IS NULL OR BEN2.MIGRADO=''N'') )');
      Dm.QrGeral.ExecSql;

      lblProcess.Caption:='Cancelando Associados que se aposentaram...';
      lblProcess.Refresh;
      LoadStringQuery('SELECT BEN1.HANDLE BEN_ASSOC_APOS,'+
                      '       BEN1.CONTRATO CONTRATO_ORIG,'+
                      '       BEN1.MATRICULACASSI, '+
                      '       BEN1.FAMILIA, '+
                      '       BEN1.EHTITULAR,'+
                      '       BEN2.DATAADESAO,'+
                      '       BEN2.HANDLE BEN_DEP_INDIRETO, '+
                      '       BEN1.HANDLE '+
                      '  FROM SOCPRO.SAM_BENEFICIARIO BEN1 '+
                      '       JOIN SOCPRO.SAM_BENEFICIARIO BEN2 ON BEN1.MATRICULACASSI=BEN2.MATRICULACASSI '+
                      '  WHERE BEN1.CONTRATO=2 AND BEN2.CONTRATO=4 AND BEN1.DATACANCELAMENTO IS NULL AND BEN1.HANDLE <> 431420');
    end;

    Dm.QrGeral.Open;

    While not Dm.QrGeral.Eof do
    begin

      if nTipoContrato in [23,24] then//Família II
      begin
          dDataAdesao:=DM.QrGeral.FieldByName('dataadesao').value - 1;
          //Inserir as Carências para o Benef. do Família II
          Dm.QrySaudePro11.Close;
          DM.QrySaudePro11.SQL.Text:='SELECT COUNT(*) QTD FROM SOCPRO.SAM_BENEFICIARIO_CARENCIA WHERE BENEFICIARIO=:BENEFICIARIO ';
          DM.QrySaudePro11.Parameters.ParamByName('beneficiario').value:=Dm.QrGeral.fieldByName('handle').value;//handle do Família II
          Dm.QrySaudePro11.Open;
          if (DM.QrySaudePro11.FieldByName('QTD').value = 0)  then
          begin
            if ((Dm.QrGeral.fieldByName('naoincidedescontoescalonado').isnull) or (Dm.QrGeral.fieldByName('naoincidedescontoescalonado').value='N')) then
            begin
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,20,0);
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,21,0);
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,22,0);
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,23,0);
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,33,60);
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,31,180);
            end;
           end
           else if (DM.QrySaudePro11.FieldByName('QTD').value = 4) then
           begin
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,33,60);
              inc(nMaxCarencia);
              InserirCarencia(nMaxCarencia,Dm.QrGeral.fieldByName('handle').value,31,180);
           end;
      end
      else if nTipoContrato=2 then
          dDataAdesao:=DM.QrGeral.FieldByName('dataadesao').value - 1
      else
         nTipoContrato:=DM.QrGeral.fieldbyname('contrato_orig').value;

       //verificar se existe beneficiário do Família I que possui o mesmo codigo de Afinidade do Família II
       cDataAdesao:=FormatDateTime('dd/mm/yyyyhh:nn:ss',dDataadesao);
       Dm.qrFindFamiliaI.close;
       Dm.QrFindFamiliaI.Parameters.ParamByName('afinidade').DataType := ftString;
       Dm.QrFindFamiliaI.Parameters.ParamByName('afinidade').Value:=Dm.QrGeral.fieldByName('matriculacassi').AsString;
       DM.QrFindFamiliaI.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
       DM.QrFindFamiliaI.Parameters.ParamByName('CONTRATO').Value    :=nTipoContrato;
       Dm.QrFindFamiliaI.Open;

       if not DM.QrFindFamiliaI.FieldByName('HANDLE').IsNull then
       begin
          //DM.DbSaude.StartTransaction;
          //Update no Campo Nossonumeroimportacao=null -
          if nTipoContrato = 24 then
             Try
               Begin
                 DM.QrUpNosNum.Close;
                 DM.QrUpNosNum.SQL.Clear;
                 DM.QrUpNosNum.SQL.Add('update sam_familia');
                 DM.QrUpNosNum.SQL.Add('set nossonumeroimportacao = null,');
                 DM.QrUpNosNum.SQL.Add('        motivobloqueio = null,   ');
                 DM.QrUpNosNum.SQL.Add('        databloqueio = null      ');
                 DM.QrUpNosNum.SQL.Add('where handle = :handle           ');
                 DM.QrUpNosNum.Parameters.ParamByName('handle').DataType := ftInteger;
                 DM.QrUpNosNum.Parameters.ParamByName('handle').value := Dm.QrGeral.fieldByName('handle').value;//handle do Família II
                 DM.QrUpNosNum.ExecSQL;
               End;
             Except
                On E:Exception do
                   Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'B','U');
             End;

          //Atualizando a Sam_beneficiario
          Try
            Begin
              Dm.QrySaudePro7.Close;
              Dm.QrySaudePro7.SQL.Clear;
              Dm.QrySaudePro7.SQL.Add('UPDATE SAM_BENEFICIARIO');
              Dm.QrySaudePro7.SQL.Add('   SET DATACANCELAMENTO = :datacancelamento,');
              Dm.QrySaudePro7.SQL.Add('             MOTIVOCANCELAMENTO = 31,        ');
              Dm.QrySaudePro7.SQL.Add('             MATRICULACASSI = :matriculacassi ');
              Dm.QrySaudePro7.SQL.Add(' WHERE HANDLE=:handle and contrato = :contrato ');
              Dm.QrySaudePro7.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
              Dm.QrySaudePro7.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
              Dm.QrySaudePro7.Parameters.ParamByName('matriculacassi').DataType := ftString;
              Dm.QrySaudePro7.Parameters.ParamByName('matriculacassi').value  :='C' + Dm.QrGeral.fieldByName('matriculacassi').AsString;
              Dm.QrySaudePro7.Parameters.ParamByName('handle').DataType := ftInteger;
              Dm.QrySaudePro7.Parameters.ParamByName('handle').value          :=Dm.QrFindFamiliaI.fieldbyName('handle').value;
              Dm.QrySaudePro7.Parameters.ParamByName('contrato').DataType := ftInteger;
              Dm.QrySaudePro7.Parameters.ParamByName('contrato').value        :=nTipoContrato;
              Dm.QrySaudePro7.ExecSQL;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'B','U');
          End;

          //Atualizando Data Bloqueio - Atualizado em 07/10/2009
          Try
            Begin
              Dm.QrySaudePro18.Close;
              Dm.QrySaudePro18.SQL.Clear;
              Dm.QrySaudePro18.SQL.Add('update sam_beneficiario set databloqueio = null');
              Dm.QrySaudePro18.SQL.Add('motivobloqueio = null where handle = :handle');
              Dm.QrySaudePro18.Parameters.ParamByName('handle').DataType := ftInteger;
              Dm.QrySaudePro18.Parameters.ParamByName('handle').value := Dm.QrGeral.fieldByName('handle').value;
              Dm.QrySaudePro18.ExecSQL;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'B','U');
          End;

          if StrToDateTime(cDataArquivo) < StrToDateTime(cDataComp) then
          Try
            Begin
              //Alteração da Carência dos planos Familia II migrados do Familia I - 14/05/2009
              Dm.QrySaudePro17.Close;
              Dm.QrySaudePro17.SQL.Clear;
              Dm.QrySaudePro17.SQL.Add('UPDATE SAM_BENEFICIARIO');
              Dm.QrySaudePro17.SQL.Add('   SET NAOTEMCARENCIA = ''S'' ');
              Dm.QrySaudePro17.SQL.Add(' WHERE HANDLE = :handle');
              Dm.QrySaudePro17.Parameters.ParamByName('handle').DataType := ftInteger;
              Dm.QrySaudePro17.Parameters.ParamByName('handle').value:=Dm.QrGeral.fieldByName('handle').value;
              Dm.QrySaudePro17.ExecSQL;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'F','U');
          End;


          //Atualizando a Sam_familia
          Try
            Begin
              Dm.QrySaudePro6.Close;
              Dm.QrySaudePro6.SQL.Clear;
              Dm.QrySaudePro6.SQL.Add('UPDATE SAM_FAMILIA');
              Dm.QrySaudePro6.SQL.Add('   SET DATACANCELAMENTO  = :datacancelamento,');
              Dm.QrySaudePro6.SQL.Add('       MOTIVOCANCELAMENTO = 31                ');
              Dm.QrySaudePro6.SQL.Add(' WHERE HANDLE = :handle and contrato = :contrato');

              If nTipoContrato IN [23,24] Then
              Begin
                Dm.QrySaudePro6.Parameters.ParamByName('datacancelamento').DataType := ftDatetime;
                Dm.QrySaudePro6.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
                Dm.QrySaudePro6.Parameters.ParamByName('handle').DataType := ftInteger;
                Dm.QrySaudePro6.Parameters.ParamByName('handle').value          :=Dm.QrFindFamiliaI.fieldbyName('HFAMILIA').value;
                Dm.QrySaudePro6.Parameters.ParamByName('contrato').DataType := ftInteger;
                Dm.QrySaudePro6.Parameters.ParamByName('contrato').value        :=nTipoContrato;
              End
              Else
              Begin
                If Dm.QrGeral.FieldByName('ehtitular').AsString = 'S' then //verificar os dependentes do Aposentado
                Begin
                  Dm.QrySaudePro6.Parameters.ParamByName('datacancelamento').DataType := ftDatetime;
                  Dm.QrySaudePro6.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
                  Dm.QrySaudePro6.Parameters.ParamByName('handle').DataType := ftInteger;
                  Dm.QrySaudePro6.Parameters.ParamByName('handle').value          :=Dm.QrFindFamiliaI.fieldbyName('HFAMILIA').value;
                  Dm.QrySaudePro6.Parameters.ParamByName('contrato').DataType := ftInteger;
                  Dm.QrySaudePro6.Parameters.ParamByName('contrato').value        :=nTipoContrato;
                End;
              End;
            Dm.QrySaudePro6.ExecSQL;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'F','U');
          End;

          //Atualizando a SAM_BENEFICIARIO_MOD
          Try
            Begin
              Dm.QrySaudePro8.Close;
              Dm.QrySaudePro8.SQL.Clear;
              Dm.QrySaudePro8.SQL.Add('UPDATE SAM_BENEFICIARIO_MOD');
              Dm.QrySaudePro8.SQL.Add('SET DATACANCELAMENTO  = :datacancelamento,');
              Dm.QrySaudePro8.SQL.Add('             MOTIVOCANCELAMENTO=31       ');
              Dm.QrySaudePro8.SQL.Add('       WHERE BENEFICIARIO = :beneficiario and contrato = :contrato');
              Dm.QrySaudePro8.Parameters.ParamByName('datacancelamento').DataType := ftDatetime;
              Dm.QrySaudePro8.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
              Dm.QrySaudePro8.Parameters.ParamByName('beneficiario').DataType := ftInteger;
              Dm.QrySaudePro8.Parameters.ParamByName('beneficiario').value    :=Dm.QrFindFamiliaI.fieldbyName('handle').value;
              Dm.QrySaudePro8.Parameters.ParamByName('contrato').DataType := ftInteger;
              Dm.QrySaudePro8.Parameters.ParamByName('contrato').value        :=nTipoContrato;
              Dm.QrySaudePro8.execSql;
            End;
          Except
             On E:Exception do
                Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'BM','U');
          End;

          //Atulizando a SAM_BENEFICIARIO_MOD_HISTORICO  - 31/07/2003
          Try
            Begin
              dm.QrySaudePro4.close;
              dm.QrySaudePro4.SQL.Clear;
              dm.QrySaudePro4.SQL.Add('update sam_beneficiario_mod_historico');
              dm.QrySaudePro4.SQL.Add('    set motivocancelamento = 31,       ');
              dm.QrySaudePro4.SQL.Add('        datacancelamento = :datacancelamento,');
              dm.QrySaudePro4.SQL.Add('        DATAMOVIMENTO = :MOVIMENTO           ');
              dm.QrySaudePro4.SQL.Add('where beneficiariomod in                   ');
              dm.QrySaudePro4.SQL.Add('(                                          ');
              dm.QrySaudePro4.SQL.Add('select handle                              ');
              dm.QrySaudePro4.SQL.Add(' from sam_beneficiario_mod                 ');
              dm.QrySaudePro4.SQL.Add('where beneficiario = :beneficiario and contrato = :contrato');
              dm.QrySaudePro4.SQL.Add(')                                                      ');
              DM.QrySaudePro4.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
              DM.QrySaudePro4.Parameters.ParamByName('datacancelamento').Value:=StrtoDateTime(cDataAdesao);
              DM.QrySaudePro4.Parameters.ParamByName('MOVIMENTO').DataType := ftDateTime;
              DM.QrySaudePro4.Parameters.ParamByName('MOVIMENTO').Value       :=StrtoDateTime(cDataAdesao);
              DM.QrySaudePro4.Parameters.ParamByName('beneficiario').DataType := ftinteger;
              DM.QrySaudePro4.Parameters.ParamByName('beneficiario').Value    :=Dm.QrFindFamiliaI.fieldbyName('handle').value;
              DM.QrySaudePro4.Parameters.ParamByName('contrato').DataType := ftinteger;
              Dm.QrySaudePro4.Parameters.ParamByName('contrato').value        :=nTipoContrato;

              DM.QrySaudePro4.ExecSql;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'BMH','U');
          End;

          //Atualizando a SAM_BENEFICIARIO_HISTORICO - 31/07/2003
          Try
            Begin
              dm.QrySaudePro5.close;
              dm.QrySaudePro5.SQL.Clear;
              dm.QrySaudePro5.SQL.Add('update sam_beneficiario_historico');
              dm.QrySaudePro5.SQL.Add('set motivocancelamento=31,       ');
              dm.QrySaudePro5.SQL.Add('        datacancelamento=:datacancelamento');
              dm.QrySaudePro5.SQL.Add('where beneficiario=:beneficiario          ');
              DM.QrySaudePro5.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
              DM.QrySaudePro5.Parameters.ParamByName('datacancelamento').Value:=StrtoDateTime(cDataAdesao);
              DM.QrySaudePro5.Parameters.ParamByName('beneficiario').DataType := ftInteger;
              DM.QrySaudePro5.Parameters.ParamByName('beneficiario').Value    :=Dm.QrFindFamiliaI.fieldbyName('handle').value;
              DM.QrySaudePro5.ExecSql;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'BH','U');
          End;

          //Atualizando a SAM_BENEFICIARIO_CARTAOIDENTIF
          Try
            Begin
              Dm.QrySaudePro14.Close;
              Dm.QrySaudePro14.SQL.Clear;
              If nTipoContrato IN [23,24] Then
                 Dm.QrySaudePro14.SQL.Text:='select count(*) qtd FROM SOCPRO.SAM_beneficiario_cartaoidentif '+
                                            ' where beneficiario='+Dm.QrFindFamiliaI.fieldbyName('handle').AsString
              Else
                 Dm.QrySaudePro14.SQL.Text:='select count(*) qtd FROM SOCPRO.SAM_beneficiario_cartaoidentif '+
                                            ' where beneficiario='+Dm.QrGeral.fieldbyname('BEN_ASSOC_APOS').asstring;
              Dm.QrySaudePro14.Open;
            End;
          Except
            On E:Exception do
              Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'BC','U');
          End;

          If Dm.QrySaudePro14.FieldByName('qtd').Value > 0 Then
            Try
              begin
                Dm.QrySaudePro9.Close;
                Dm.QrySaudePro9.SQL.Clear;
                Dm.QrySaudePro9.SQL.Add('UPDATE SAM_BENEFICIARIO_CARTAOIDENTIF');
                Dm.QrySaudePro9.SQL.Add('SET DATACANCELAMENTO  =:datacancelamento');
                Dm.QrySaudePro9.SQL.Add('       WHERE BENEFICIARIO=:beneficiario');
                Dm.QrySaudePro9.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
                Dm.QrySaudePro9.Parameters.ParamByName('datacancelamento').value:=StrtoDateTime(cDataAdesao);
                Dm.QrySaudePro9.Parameters.ParamByName('beneficiario').DataType := ftInteger;
                if nTipoContrato in [23,24] then
                  Dm.QrySaudePro9.Parameters.ParamByName('beneficiario').value    :=Dm.QrFindFamiliaI.fieldbyName('handle').value
                else
                  Dm.QrySaudePro9.Parameters.ParamByName('beneficiario').value    :=Dm.QrGeral.fieldbyname('BEN_ASSOC_APOS').value;
                Dm.QrySaudePro9.ExecSQL;
              end;
            Except
              On E:Exception do
                 Grava_Log('2',Dm.QrGeral.fieldbyName('handle').AsString,'B','U');
            End;

          //Alteração conforme SMS - 18169 - dia 13/08/2003

          if nTipocontrato in [23,24] then
          begin
            nBenefOrigem :=Dm.QrFindFamiliaI.fieldbyName('handle').value;//handle da família I
            nBenefDestino:=Dm.QrGeral.fieldByName('handle').value;//handle da família II ou III
          end
          else
          begin
            nBenefOrigem :=Dm.qrGeral.Fieldbyname('Ben_assoc_apos').value;
            nBenefDestino:=Dm.qrGeral.Fieldbyname('Ben_dep_indireto').value;
          end;

          Dm.qrUpModHis.Close;
          Try
            Begin
              DM.qrupmodHis.Close;
              DM.qrupmodHis.SQL.Clear;
              DM.qrupmodHis.SQL.Add('update sam_beneficiario_mod_historico');
              DM.qrupmodHis.SQL.Add('set origem = ''M'',                  ');
              DM.qrupmodHis.SQL.Add('      beneficiariomodorigem=(select min(handle) from');
              DM.qrupmodHis.SQL.Add('                               sam_beneficiario_mod ');
              DM.qrupmodHis.SQL.Add('                              where beneficiario=:beneforigem)');
              DM.qrupmodHis.SQL.Add('where beneficiariomod in                                      ');
              DM.qrupmodHis.SQL.Add('(                                                             ');
              DM.qrupmodHis.SQL.Add('select m.handle                                               ');
              DM.qrupmodHis.SQL.Add('  from sam_beneficiario_mod_historico h                       ');
              DM.qrupmodHis.SQL.Add('       join sam_beneficiario_mod m on m.handle=h.beneficiariomod');
              DM.qrupmodHis.SQL.Add(' where m.beneficiario=:benefDestino                             ');
              DM.qrupmodHis.SQL.Add(')                                                               ');
              DM.qrupmodHis.Parameters.ParamByName('BenefOrigem').DataType := ftInteger;
              DM.qrupmodHis.Parameters.ParamByName('BenefOrigem').value :=nBenefOrigem;
              DM.qrupmodHis.Parameters.ParamByName('BenefDestino').DataType := ftInteger;
              DM.qrupModHis.Parameters.ParamByName('BenefDestino').value:=nBenefDestino;
              DM.qruPModHis.ExecSql;
            End;
          Except
            On E:Exception do
              Grava_Log('2','CancelarFamilia - BenefOrigem:' + inttostr(nBenefOrigem) + ', BenefDestino:' + inttostr(nBenefDestino) ,'BMH','U');
          End;

          Try
            Begin
              DM.QrySaudepro2.Close;
              DM.QrySaudepro2.Parameters.ParamByName('BenefOrigem').value :=nBenefOrigem;
              DM.QrySaudepro2.Parameters.ParamByName('beneficiario').value:=nBenefDestino;
              DM.QrySaudepro2.ExecSQL;
            End;
          Except
            On E:Exception do
              Grava_Log('2','CancelarFamilia - BenefOrigem:' + inttostr(nBenefOrigem) + ', BenefDestino:' + inttostr(nBenefDestino) ,'B','U');
          End;
          //DM.DbSaude.Commit;
       end;
       Dm.QrGeral.Next;
    end;
end;


Function TFrmBeneficiario.CartaoAntigo(cCartaoCSC:String;nNrDep:Integer):String;
var cComposicaoCartao:String;
begin
   if nHandleContrato in [4,2,7,6,5,30] then //Contratos -> Associados
   begin
      cComposicaoCartao:='01'+RepeatChar(2-length(IntTostr(nNrDep)),'0')+
                         IntToStr(nNrDep)+Trim(cCartaoCSC)+'100';
      cComposicaoCartao:=cComposicaoCartao+GerarDVCartao(cComposicaoCartao);
   end
   else
   begin
      cComposicaoCartao:='02'+RepeatChar(2-length(IntTostr(nNrDep)),'0')+
                         IntToStr(nNrDep)+Trim(cCartaoCSC)+'101';
      cComposicaoCartao:=cComposicaoCartao+GerarDVCartao(cComposicaoCartao);
   end;
   Result:=cComposicaoCartao;
end;


Function TFrmBeneficiario.GerarDVCartao(Cartao:string):String;
var i,nAcumulado,nMultip,nTotal,nTamCartao:integer;
begin
   nAcumulado:=0;
   nMultip   :=2;
   nTotal    :=0;
   nTamCartao:=Length(Trim(Cartao));
   For i:=nTamCartao downto 1 do
   begin
      nTotal:=nMultip * StrToInt(Copy(Cartao,i,1));
      if nTotal > 9 then
         nTotal:=(nTotal - 9);
      nAcumulado:=nAcumulado + nTotal;
      if nMultip = 1 then
         nMultip:= 2
      else
         nMultip:=nMultip - 1;
   end;
   Result:=Trim(FloatToStr(10-Int(nAcumulado mod 10)));
   if Result='10' then
      result:='0';
end;

Function TFrmBeneficiario.RepeatChar(nVezes:integer;cChar:string):String;
var i:integer;
begin
   result:='';
   for i:=1 to nVezes do
     Result:=result + cChar;
End;


Function TFrmBeneficiario.AbreLog(tabela:String):Integer;
Var NroImportacao : integer;
Begin
   Try
      Begin
         Dm.QrGeral.Close;
         Dm.QrGeral.SQL.Clear;
         Dm.QrGeral.SQL.Add('Insert into MIGLOGBENNER (NroImportacao,TabelaBenner,DataIniimportacao,Situacao) Values ' +
                            ' (seq_migdet.nextval, :TabelaBenner, sysdate, 0)');
         Dm.QrGeral.Parameters.ParamByName('TabelaBenner').DataType := ftString;
         Dm.QrGeral.Parameters.ParamByName('TabelaBenner').Value := tabela;
         Dm.QrGeral.ExecSQL;
         Result := NroImportacao;
      End;
   Except
      On E:Exception do
         Grava_Log('2','AbreLog','B','U');
      End;
End;


Function TFrmBeneficiario.RetornaPlanoGrupo(nContrato : integer):String;
Begin
   Case nContrato of  //3 primeiros=plano e 3 últimos=grupo no CSC
       30 :Result := '000002';//Aposentados
        1 :Result := '000001';//Associados - Banco do Brasil
        2 :Result := '001002';//B.B- Dependentes Indiretos de Titular Aposentado
        3 :Result := '000004';//Exonerados - BB
        4 :Result := '001001';//B.B- Dependentes Indiretos de Titular Ativo
        5 :Result := '002001';//B.B- Dependentes Indiretos de Titular Falecido na Ativa
        6 :Result := '002002';//B.B- Dependentes Indiretos de Titular Falecido Aposentado
      200 :Result := '200006';//Basa/Casf
      100 :Result := '100005';//Família I
      110 :Result := '101005';//Família II
      121 :Result := '824005';//Família II - PAQ
      //130 :Result := '110007';//Func.Cassi    //retirado dia 18/01/2010
      //131 :Result := '110007';//Func.Cassi-Serviço Próprio  //retirado dia 18/01/2010
       50 :Result := '000003';//Pensionistas
      210 :Result := '210006';//Prefeitura
      240 :Result := '240006';//Proasa
      250 :Result := '250006';//STF
      220 :Result := '220006';//Telesp/Abet
      230 :Result := '230006';//TRT
      205 :Result := '500500';//Banco do Brasil - Admissional - ainda não existe
      260 :Result := '270006';//OAB
      280 :Result := '280006';//CABERGS
      290 :Result := '300006';//TJA-MED
      310 :Result := '310006';//SERPRO
      320 :Result := '320006';//TJDF
      340 :Result := '330006';//ALUMAR - conforme e-mail do Héderson 06/09/05 - codplan=330 e grupo=6
      300 :Result := '831005';// - PDEFamília II - código de situação - 831 - Yumi - 04/03/04
      080 :Result := '080005';//Paraguaios --migração no dia 01/06/05
    //--- :Result := '803002';//PAI - codsitu = 803 - reunião Viviane - 05/05/2004
      370 :Result:= '370006';//FIRJAN
      360 :Result:= '360006';//BACEN
      390 :Result:= '390006';//TST
      140 :Result:= '140005';//Família III - Incluído no dia 11/01/08 - Campanha
      400 :Result:= '400006';//FASCAL - incluído 24/04/08
      410 :Result:= '410006';//CASEMBRAPA - incluido 09/03/2009
   end;

   If nContrato in [4,5,6] then   // 02/12/2008
      nContrato := 2

End;


Procedure TFrmBeneficiario.FechaLog(NroImportacao : integer);
Begin
   DM.QrGeral.Close;
   DM.QrGeral.SQL.Clear;
   DM.QrGeral.SQL.Add('Update MIGLOGBENNER set DataFimImportacao = sysdate, Situacao = 1 where NroImportacao = ' + IntToStr(NroImportacao));
   DM.QrGeral.ExecSQL;
End;


Procedure TFrmBeneficiario.RegistraLog (nNroImportacao:Integer;cRegistro,cObservacao:String);
Begin
    DM.QrGeral2.Close;
    DM.QrGeral2.SQL.Clear;
    DM.QrGeral2.SQL.Add('Insert into migdetlogbenner (data,nroimportacao,registro,observacao) values(' +
                            'sysdate,:nroimportacao,:registro,:observacao)');
    DM.QrGeral2.Parameters.ParamByName('NroImportacao').Datatype := ftInteger;
    DM.QrGeral2.Parameters.ParamByName('NroImportacao').Value := nNroImportacao;
    DM.QrGeral2.Parameters.ParamByName('Registro').DataType := ftString;
    DM.QrGeral2.Parameters.ParamByName('Registro').Value       := cRegistro;
    DM.QrGeral2.Parameters.ParamByName('Observacao').DataType := ftString;
    DM.QrGeral2.Parameters.ParamByName('Observacao').Value     := cObservacao;
    DM.QrGeral2.ExecSQL;
End;


Procedure TFrmBeneficiario.LoadQuerys(cTipo,cTable:String);
{Carrega as Querys de acordo com o tipo da Operação - Inserção/Update}
var cMatricula,cBenef,cFamilia1,cEndereco, cBenefadesao :string;
begin
   if cTipo='I' then //INSERT
   begin
      //Inserção Sam_Matrícula
      if cTable='M' then
         cMatricula:='INSERT INTO SOCPRO.SAM_MATRICULA '+
                     '(MATRICULA,NOME,SEXO,CPF,DATANASCIMENTO,DATAINGRESSO,NOMEMAE,HANDLE) '+
                     'VALUES '+
                     '(:MATRICULA,:NOME,:SEXO,:CPF,:DATANASCIMENTO,:DATAINGRESSO,:NOMEMAE,:HANDLE)'
      else if cTable='B' then //19/05/2009
         //Inserção Sam_Beneficiario
         cBenef   := 'INSERT INTO SOCPRO.SAM_BENEFICIARIO '+
                     '(CONTRATO,BENEFICIARIO,CODIGODEPENDENTE,MATRICULA,'+
                     ' NOME,EHTITULAR,ESTADOCIVIL,NAOTEMCARENCIA,DATAADESAO,DATAPRIMEIRAADESAO,'+
                     ' DATACANCELAMENTO,CELULAR,EMAIL,MATRICULAFUNCIONAL,'+
                     ' NAOFATURARMODULOS,NAOFATURARGUIAS,DIREITOAADIANTAMENTO,LIMITEADIANTAMENTO,'+
                     ' DATAADOCAO,SITUACAORH,matriculacassi,DIASCOMPRACARENCIA,CARTAOIDENTIFICACAO,INFORMATIVOS,'+
                     ' BENEFICIARIOINDICADOR,MATRICULAINDICADORA,TIPODEPENDENTE,MOTIVOCANCELAMENTO,NAOPERMITEAUXILIO,CODIGOTABELAPRC,' +
                     ' EMPRESA,DEMONSTRATIVOFINANCEIROINDIVID,CONVENIO,PERMITEADIANTAMENTO,PERMITEREEMBOLSO,' +
                     ' INCLUSAOPOR,PARENTESCO,AGENCIAINCLUSAO,DATABLOQUEIO,MOTIVOBLOQUEIO,RECEBIMENTOINSS, CBO, HANDLE) '+
                     'VALUES '+
                     '(:CONTRATO,:BENEFICIARIO,:CODIGODEPENDENTE,:MATRICULA,'+
                     ' :NOME,:EHTITULAR,:ESTADOCIVIL,:NAOTEMCARENCIA,:DATAADESAO,:DATAPRIMEIRAADESAO,'+
                     ' :DATACANCELAMENTO,:CELULAR,:EMAIL,:MATRICULAFUNCIONAL,'+
                     ' :NAOFATURARMODULOS,:NAOFATURARGUIAS,:DIREITOAADIANTAMENTO,:LIMITEADIANTAMENTO,'+
                     ' :DATAADOCAO,:SITUACAORH,:matriculacassi,:DIASCOMPRACARENCIA,:CARTAOIDENTIFICACAO,:INFORMATIVOS,'+
                     ' :BENEFICIARIOINDICADOR,:MATRICULAINDICADORA,:TIPODEPENDENTE,:MOTIVOCANCELAMENTO,:NAOPERMITEAUXILIO,:CODIGOTABELAPRC,'+
                     ' :EMPRESA,:DEMONSTRATIVOFINANCEIROINDIVID,:CONVENIO,:PERMITEADIANTAMENTO,:PERMITEREEMBOLSO,'+
                     ' :INCLUSAOPOR,:PARENTESCO,:AGENCIAINCLUSAO,:DATABLOQUEIO,:MOTIVOBLOQUEIO,:RECEBIMENTOINSS, :CBO, :HANDLE)'
      else if cTable='F' then
         //Inserção Sam_Família
         cFamilia1:=' INSERT INTO SOCPRO.SAM_FAMILIA '+
                   ' (CONTRATO,DATAADESAO,DATACANCELAMENTO,NAOINCLUIRBENEFICIARIO,' +
                   'TABRESPONSAVEL,CARTAOIDENTIFICACAO,COBRANCA,COBRANCANOMESSEGUINTE,' +
                   'COBRANCADEEVENTO,DIACOBRANCA,DIACOBRANCAORIGINAL,PROXIMOVENCIMENTO,' +
                   'EXTRATOUTILIZACAO,DATAINCLUSAO,USUARIOINCLUSAO,DATAALTERACAO,USUARIOALTERACAO,' +
                   'FAMILIA,TITULARRESPONSAVEL,LOTACAO,SECAO,MOTIVOCANCELAMENTO,EMPRESA,CONVENIO,' +
                   'NOSSONUMEROIMPORTACAO,NAOINCIDEDESCONTOESCALONADO,INFORMATIVOS,DEMONSTRATIVOEMAIL,HANDLE) '+
                   'VALUES (:CONTRATO,:DATAADESAO,:DATACANCELAMENTO,:NAOINCLUIRBENEFICIARIO,' +
                   ':TABRESPONSAVEL,:CARTAOIDENTIFICACAO,:COBRANCA,:COBRANCANOMESSEGUINTE,' +
                   ':COBRANCADEEVENTO,:DIACOBRANCA,:DIACOBRANCAORIGINAL,:PROXIMOVENCIMENTO,' +
                   ':EXTRATOUTILIZACAO,:DATAINCLUSAO,:USUARIOINCLUSAO,:DATAALTERACAO,:USUARIOALTERACAO,' +
                   ':FAMILIA,:TITULARRESPONSAVEL,:LOTACAO,:SECAO,:MOTIVOCANCELAMENTO,:EMPRESA,:CONVENIO,' +
                   ':NOSSONUMEROIMPORTACAO,:NAOINCIDEDESCONTOESCALONADO,:INFORMATIVOS,:DEMONSTRATIVOEMAIL,:HANDLE) '
      else if cTable='E' then
         cEndereco:='INSERT INTO SOCPRO.SAM_ENDERECO '+
                    '(ESTADO,MUNICIPIO,BAIRRO,LOGRADOURO,TELEFONE1,TELEFONE2,FAX,CEP,NUMERO,COMPLEMENTO,HANDLE) '+
                    ' VALUES '+
                    '(:ESTADO,:MUNICIPIO,:BAIRRO,:LOGRADOURO,:TELEFONE1,:TELEFONE2,:FAX,:CEP,:NUMERO,:COMPLEMENTO,:HANDLE)';
   end
   else //UPDATE
   begin
    //Correção para bloqueio de update nos dados oriundos da internet - 12/11/2008
    if cTipo='UA' then //Update Campos Internet
     begin
          //Inserção Sam_Matrícula Campos Internet
       if cTable='M' then
          cMatricula:='UPDATE SOCPRO.SAM_MATRICULA '+
                      ' SET MATRICULA=:MATRICULA,'+
                      //'     DATANASCIMENTO=:DATANASCIMENTO,'+  // Atualizado 20/03/2009
                      '     DATAINGRESSO=:DATAINGRESSO'+
                      //'     SEXO=:SEXO'+ // Atualizado 20/03/2009
                      ' WHERE HANDLE=:HANDLE'
          //Inserção Sam_Matrícula CPF Associado Titular - 12/01/2009 
       else if cTable='C' then
          cMatricula:='UPDATE SOCPRO.SAM_MATRICULA '+
                      ' SET MATRICULA=:MATRICULA,'+
                      //'     DATANASCIMENTO=:DATANASCIMENTO,'+ // Atualizado 20/03/2009
                      '     DATAINGRESSO=:DATAINGRESSO,'+
                      '     CPF=:CPF'+
                      ' WHERE HANDLE=:HANDLE'
          //Inserção Sam_Beneficiário Campos Internet
       else if cTable='B' then
          cBenef   := 'UPDATE SOCPRO.SAM_BENEFICIARIO '+
                     'SET '+
                     '   CONTRATO=:CONTRATO,'+
                     '   BENEFICIARIO=:BENEFICIARIO,'+
                     '   CODIGODEPENDENTE=:CODIGODEPENDENTE,'+
                     '   MATRICULA=:MATRICULA,'+
                     '   NOME=:NOME,'+
                     '   EHTITULAR=:EHTITULAR,'+
                     '   ESTADOCIVIL=:ESTADOCIVIL,'+
                     '   NAOTEMCARENCIA=:NAOTEMCARENCIA,'+
                     '   DATAADESAO=:DATAADESAO,'+
                     '   DATAPRIMEIRAADESAO=:DATAPRIMEIRAADESAO,'+
                     '   DATACANCELAMENTO=:DATACANCELAMENTO,'+
                     '   CELULAR=:CELULAR,'+
                     '   EMAIL=:EMAIL,'+
                     '   MATRICULAFUNCIONAL=:MATRICULAFUNCIONAL,'+
                     '   NAOFATURARMODULOS=:NAOFATURARMODULOS,'+
                     '   NAOFATURARGUIAS=:NAOFATURARGUIAS,'+
                     '   DIREITOAADIANTAMENTO=:DIREITOAADIANTAMENTO,'+
                     '   LIMITEADIANTAMENTO=:LIMITEADIANTAMENTO,'+
                     '   DATAADOCAO=:DATAADOCAO,'+
                     '   SITUACAORH=:SITUACAORH,'+
                     '   matriculacassi =:matriculacassi, '+
                     '   DIASCOMPRACARENCIA=:DIASCOMPRACARENCIA, '+
                     '   CARTAOIDENTIFICACAO=:CARTAOIDENTIFICACAO,'+
                     '   INFORMATIVOS=:INFORMATIVOS, '+
                     '   BENEFICIARIOINDICADOR=:BENEFICIARIOINDICADOR, '+
                     '   MATRICULAINDICADORA=:MATRICULAINDICADORA,'+
                     '   TIPODEPENDENTE=:TIPODEPENDENTE, '+
                     '   MOTIVOCANCELAMENTO=:MOTIVOCANCELAMENTO, '+
                     '   NAOPERMITEAUXILIO=:NAOPERMITEAUXILIO, '+
                     '   CODIGOTABELAPRC=:CODIGOTABELAPRC, '+
                     '   EMPRESA=:EMPRESA, '+
                     '   DEMONSTRATIVOFINANCEIROINDIVID=:DEMONSTRATIVOFINANCEIROINDIVID, '+
                     '   CONVENIO=:CONVENIO, '+
                     '   PERMITEADIANTAMENTO=:PERMITEADIANTAMENTO, '+
                     '   PERMITEREEMBOLSO=:PERMITEREEMBOLSO, '+
                     '   INCLUSAOPOR=:INCLUSAOPOR, '+
                     '   PARENTESCO =:PARENTESCO, '+
                     '   AGENCIAINCLUSAO=:AGENCIAINCLUSAO, '+
                     '   DATABLOQUEIO=:DATABLOQUEIO, '+
                     '   MOTIVOBLOQUEIO=:MOTIVOBLOQUEIO, '+
                     '   RECEBIMENTOINSS = :RECEBIMENTOINSS, '+
                     '   CBO := CBO '+
                     'WHERE HANDLE=:HANDLE '
     end
     else
      begin
      if cTable='M' then
         //UPDATE SOCPRO.SAM_Matrícula
         cMatricula:='UPDATE SOCPRO.SAM_MATRICULA '+
                     ' SET MATRICULA=:MATRICULA,'+
                     '     NOME=:NOME,'+
                     '     SEXO=:SEXO,'+
                     '     CPF=:CPF,'+
                     '     DATANASCIMENTO=:DATANASCIMENTO,'+
                     '     DATAINGRESSO=:DATAINGRESSO,'+
                     '     NOMEMAE     =:NOMEMAE '+
                     ' WHERE HANDLE=:HANDLE'
      else if cTable='B' then
         //UPDATE SOCPRO.SAM_Beneficiario
         cBenef   := 'UPDATE SOCPRO.SAM_BENEFICIARIO '+
                     'SET '+
                     '   CONTRATO=:CONTRATO,'+
                     '   BENEFICIARIO=:BENEFICIARIO,'+
                     '   CODIGODEPENDENTE=:CODIGODEPENDENTE,'+
                     '   MATRICULA=:MATRICULA,'+
                     '   NOME=:NOME,'+
                     '   EHTITULAR=:EHTITULAR,'+
                     '   ESTADOCIVIL=:ESTADOCIVIL,'+
                     '   NAOTEMCARENCIA=:NAOTEMCARENCIA,'+
                     '   DATAADESAO=:DATAADESAO,'+
                     '   DATAPRIMEIRAADESAO=:DATAPRIMEIRAADESAO,'+
                     '   DATACANCELAMENTO=:DATACANCELAMENTO,'+
                     '   CELULAR=:CELULAR,'+
                     '   EMAIL=:EMAIL,'+
                     '   MATRICULAFUNCIONAL=:MATRICULAFUNCIONAL,'+
                     '   NAOFATURARMODULOS=:NAOFATURARMODULOS,'+
                     '   NAOFATURARGUIAS=:NAOFATURARGUIAS,'+
                     '   DIREITOAADIANTAMENTO=:DIREITOAADIANTAMENTO,'+
                     '   LIMITEADIANTAMENTO=:LIMITEADIANTAMENTO,'+
                     '   DATAADOCAO=:DATAADOCAO,'+
                     '   SITUACAORH=:SITUACAORH,'+
                     '   matriculacassi =:matriculacassi, '+
                     '   DIASCOMPRACARENCIA=:DIASCOMPRACARENCIA, '+
                     '   CARTAOIDENTIFICACAO=:CARTAOIDENTIFICACAO,'+
                     '   INFORMATIVOS=:INFORMATIVOS, '+
                     '   BENEFICIARIOINDICADOR=:BENEFICIARIOINDICADOR, '+
                     '   MATRICULAINDICADORA =:MATRICULAINDICADORA,'+
                     '   TIPODEPENDENTE=:TIPODEPENDENTE, '+
                     '   MOTIVOCANCELAMENTO=:MOTIVOCANCELAMENTO, '+
                     '   NAOPERMITEAUXILIO=:NAOPERMITEAUXILIO, '+
                     '   CODIGOTABELAPRC=:CODIGOTABELAPRC, '+
                     '   EMPRESA=:EMPRESA, '+
                     '   DEMONSTRATIVOFINANCEIROINDIVID=:DEMONSTRATIVOFINANCEIROINDIVID, '+
                     '   CONVENIO=:CONVENIO, '+
                     '   PERMITEADIANTAMENTO=:PERMITEADIANTAMENTO, '+
                     '   PERMITEREEMBOLSO=:PERMITEREEMBOLSO, '+
                     '   INCLUSAOPOR=:INCLUSAOPOR, '+
                     '   PARENTESCO =:PARENTESCO, '+
                     '   AGENCIAINCLUSAO=:AGENCIAINCLUSAO, '+
                     '   DATABLOQUEIO=:DATABLOQUEIO, '+
                     '   MOTIVOBLOQUEIO=:MOTIVOBLOQUEIO, '+
                     '   RECEBIMENTOINSS = :RECEBIMENTOINSS, '+
                     '   CBO := CBO '+
                     'WHERE HANDLE=:HANDLE '
      else if cTable='F' then
         //UPDATE SOCPRO.SAM_Família
         cFamilia1:=' UPDATE SOCPRO.SAM_FAMILIA '+
                   ' SET CONTRATO=:CONTRATO,'+
                   '     DATAADESAO=:DATAADESAO,'+
                   '     DATACANCELAMENTO=:DATACANCELAMENTO,'+
                   '     NAOINCLUIRBENEFICIARIO=:NAOINCLUIRBENEFICIARIO,'+
                   '     TABRESPONSAVEL=:TABRESPONSAVEL,'+
                   '     CARTAOIDENTIFICACAO=:CARTAOIDENTIFICACAO,'+
                   '     COBRANCA=:COBRANCA,' +
                   '     COBRANCANOMESSEGUINTE=:COBRANCANOMESSEGUINTE,'+
                   '     COBRANCADEEVENTO=:COBRANCADEEVENTO,'+
                   '     DIACOBRANCA=:DIACOBRANCA,' +
                   '     DIACOBRANCAORIGINAL=:DIACOBRANCAORIGINAL, '+
                   '     PROXIMOVENCIMENTO=:PROXIMOVENCIMENTO, '+
                   '     EXTRATOUTILIZACAO=:EXTRATOUTILIZACAO,'+
                   '     DATAINCLUSAO=:DATAINCLUSAO,'+
                   '     USUARIOINCLUSAO=:USUARIOINCLUSAO,'+
                   '     DATAALTERACAO=:DATAALTERACAO,' +
                   '     USUARIOALTERACAO=:USUARIOALTERACAO,'+
                   '     FAMILIA=:FAMILIA, '+
                   '     TITULARRESPONSAVEL=:TITULARRESPONSAVEL, '+
                   '     LOTACAO=:LOTACAO,'+
                   '     SECAO=:SECAO, '+
                   '     MOTIVOCANCELAMENTO=:MOTIVOCANCELAMENTO, '+
                   '     EMPRESA=:EMPRESA, '+
                   '     CONVENIO=:CONVENIO, '+
                   '     NOSSONUMEROIMPORTACAO=:NOSSONUMEROIMPORTACAO, '+
                   '     NAOINCIDEDESCONTOESCALONADO=:NAOINCIDEDESCONTOESCALONADO, '+
                   '     INFORMATIVOS=:INFORMATIVOS,'+
                   '     DEMONSTRATIVOEMAIL=:DEMONSTRATIVOEMAIL '+
                   'WHERE HANDLE=:HANDLE '
    else if cTable='E' then
       cEndereco:=' UPDATE SOCPRO.SAM_ENDERECO '+
                  '    SET ESTADO    =:ESTADO,'+
                  '        MUNICIPIO =:MUNICIPIO,'+
                  '        BAIRRO    =:BAIRRO,'+
                  '        LOGRADOURO=:LOGRADOURO,'+
                  '        TELEFONE1 =:TELEFONE1,'+
                  '        TELEFONE2 =:TELEFONE2,'+
                  '              FAX =:FAX,'+
                  '               CEP=:CEP,'+
                  '               NUMERO=:NUMERO,'+
                  '       COMPLEMENTO=:COMPLEMENTO '+
                  ' WHERE HANDLE =:HANDLE';
    end;
   end;

   case cTable[1] of
     'M' :begin //Matrícula
             DM.QrMatricula.Close;
             DM.QrMatricula.Sql.Clear;
             DM.QrMatricula.Sql.Add(cMatricula);
          end;
     'C' :begin //Matrícula CPF Associado Titular - 12/01/2009
             DM.QrMatricula.Close;
             DM.QrMatricula.Sql.Clear;
             DM.QrMatricula.Sql.Add(cMatricula);
          end;     
     'B' :begin //Beneficiário
             DM.QrBeneficiario.Close;
             DM.QrBeneficiario.Sql.Clear;
             DM.QrBeneficiario.Sql.Add(cBenef);
          end;
     'F' :begin //Família
             DM.QrFamilia.Close;
             DM.QrFamilia.Sql.Clear;
             DM.QrFamilia.Sql.Add(cFamilia1);
          end;
     'E' :begin //Endereço
             DM.QrEndereco.Close;
             DM.QrEndereco.Sql.Clear;
             DM.QrEndereco.Sql.Add(cEndereco);
          end;
   end;
end;


Function TFrmBeneficiario.RetornaMascaraBenef(cFamily,cContrato,cDependente:string):string;
{Parâmetros in -> cContrato  :número do Contrato
                  cDependente:número do dependente na CSC
 Out : String referente ao campo BENEFICIARIO em Sam_beneficiário}
begin
   //Alessandro L. Mamus - Benner Saúde - 18/07/2001
   if Length(cFamily) < 9 then
   begin

      if Length(cDependente) < 2 then
         Result:=cContrato+RepeatChar(9-Length(cFamily),'0')+Trim(cFamily)+
                           RepeatChar(2-Length(cDependente),'0')+cDependente
      else
         Result:=cContrato+RepeatChar(9-Length(Trim(cFamily)),'0')+
                           Trim(cFamily)+cDependente;
   end
   else if Length(cDependente) < 2 then
         Result:=cContrato+Trim(cFamily)+RepeatChar(2-Length(cDependente),'0')+cDependente
   else
         Result:=cContrato+Trim(cFamily)+cDependente;
end;


procedure TFRMBENEFICIARIO.LoadStringQuery(cTextoSql:string);
//Carregar as Querys
begin
   DM.QrGeral.Close;
   DM.QrGeral.SQL.Clear;
   DM.QrGeral.SQL.Add(cTextoSql);
end;


procedure TFrmBeneficiario.LoadStringQueryAux(cTextoSql: string);
//Carregar as Querys
begin
   DM.QrGeralAux.Close;
   DM.QrGeralAux.SQL.Clear;
   DM.QrGeralAux.SQL.Add(cTextoSql);
end;

//****************************************FAMÍLIA*******************************************

Procedure TFrmBeneficiario.InsertUpdate_Familia(cAcao,cTitular:String);
{Lógica -> verifica se Benef. é Titular.Se True então insere a família com
           todos os dados.Se não é Tit. então somente cria-se a família sem
           os dados(somente handle e campos default).Na sequência faz-se o
           Update no campo família do beneficiário indicando a mesma para o
           beneficiário em questão,ou seja, a família que ele pertence}
begin
  Try
    if cTitular='T' then //é titular
    begin
      DM.QrFamilia.Parameters.ParamByName('CONTRATO').Datatype := ftInteger;
      DM.QrFamilia.Parameters.ParamByName('CONTRATO').value := nHandleContrato;

      if Trim(cDataAdesao)<>'' then
      begin
        DM.QrFamilia.Parameters.ParamByName('DATAADESAO').Datatype := ftDateTime;
        DM.QrFamilia.Parameters.ParamByName('DATAADESAO').Value := StrToDateTime(cDataAdesao)
      end
      else
        DM.QrFamilia.Parameters.ParamByName('DATAADESAO').Value;

      DM.QrFamilia.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftdatetime;
      if (Trim(cDataCancF)<>'') And (Trim(cMotCancF) <> '') then
        DM.QrFamilia.Parameters.ParamByName('DATACANCELAMENTO').value := StrToDateTime(cDataCancF)
      else
        DM.QrFamilia.Parameters.ParamByName('DATACANCELAMENTO').value := null;

      DM.QrFamilia.Parameters.ParamByName('NAOINCLUIRBENEFICIARIO').DataType := ftstring;
      DM.QrFamilia.Parameters.ParamByName('NAOINCLUIRBENEFICIARIO').value := cIncBenef;

      DM.QrFamilia.Parameters.ParamByName('TABRESPONSAVEL').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('TABRESPONSAVEL').value := 1;

      If (nhandleContrato in [2,6,19,20,36,41,51,59,60,62]) then //Incluido em 17/07/2009
      begin
        DM.QrFamilia.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftstring;
        DM.QrFamilia.Parameters.ParamByName('CARTAOIDENTIFICACAO').value :='N';
      end
      else
      begin
        DM.QrFamilia.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftstring;
        DM.QrFamilia.Parameters.ParamByName('CARTAOIDENTIFICACAO').Value := 'S';
      end;

      DM.QrFamilia.Parameters.ParamByName('COBRANCA').DataType := ftstring;
      DM.QrFamilia.Parameters.ParamByName('COBRANCA').Value := 'N';
      DM.QrFamilia.Parameters.ParamByName('COBRANCANOMESSEGUINTE').DataType := ftstring;
      DM.QrFamilia.Parameters.ParamByName('COBRANCANOMESSEGUINTE').value := 'N';
      DM.QrFamilia.Parameters.ParamByName('COBRANCADEEVENTO').DataType := ftstring;
      DM.QrFamilia.Parameters.ParamByName('COBRANCADEEVENTO').value := 'C';

      if Trim(cDiaCobranca)<>'' then
      begin
        if cAcao='I' then //Alessandro S.C. 102738 - dia 22/12/05
        begin
          DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').DataType := ftinteger;
          DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').value := StrToInt(cDiaCobranca);
          DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').DataType := ftinteger;
          DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := StrToInt(cDiaCobranca);
          DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').DataType := ftinteger;
          DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').Value  := StrToInt(cDiaCobranca);
        end
        else
        begin
          if not (nHandleContrato in [23,24]) then //S.C 224423 - incluído 12/08/2008
          begin
            if nDiaCobrancaOracle > 0 then
            begin
              if nDiaCobrancaOracle <> StrToInt(cDiaCobranca) then
              begin
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').DataType := ftinteger;
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').value := nDiaCobrancaOracle;
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').DataType := ftinteger;
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := nDiaCobrancaOrigOracle;
              end
              else
              begin
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').DataType := ftinteger;
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').Value := StrToInt(cDiaCobranca);
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').DataType := ftinteger;
                DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := StrToInt(cDiaCobranca);
              end;
              DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').DataType := ftinteger;
              DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').value := StrToInt(cDiaCobranca);
            end
            else
            begin
              DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').datatype := ftinteger;
              DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').value := StrToInt(cDiaCobranca);
              DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').DataType := ftinteger;
              DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := StrToInt(cDiaCobranca);
              DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').DataType := ftinteger;
              DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').value := null;
            end;
          end
          else
          begin
            DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').datatype := ftinteger;
            DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').DataType := ftinteger;
            DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').value := nDiaCobrancaOracle;
            DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := nDiaCobrancaOrigOracle;
            DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').DataType := ftinteger;
            if nDiaProximoVencimento > 0 then
              DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').value :=nDiaProximoVencimento
            else
              DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').Value := null;
          end;
        end;
      end
      else
      begin
        DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').value := null;
        DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := null;
        DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').value := null;
      end;

      DM.QrFamilia.Parameters.ParamByName('EXTRATOUTILIZACAO').DataType := ftstring;
      DM.QrFamilia.Parameters.ParamByName('EXTRATOUTILIZACAO').value :='F';
      DM.QrFamilia.Parameters.ParamByName('DATAINCLUSAO').DataType := ftdatetime;
      DM.QrFamilia.Parameters.ParamByName('DATAINCLUSAO').value := Now;
      DM.QrFamilia.Parameters.ParamByName('USUARIOINCLUSAO').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('USUARIOINCLUSAO').value :=78;

      DM.QrFamilia.Parameters.ParamByName('DATAALTERACAO').DataType := ftdatetime;
      if Trim(cDataAlter)<>'' then
      begin
        DM.QrFamilia.Parameters.ParamByName('DATAALTERACAO').Value := StrToDateTime(cDataAlter);
      end
      else
        DM.QrFamilia.Parameters.ParamByName('DATAALTERACAO').value := null;

      DM.QrFamilia.Parameters.ParamByName('USUARIOALTERACAO').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('USUARIOALTERACAO').value := 78;//Usuário Migração

      DM.QrFamilia.Parameters.ParamByName('FAMILIA').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('FAMILIA').value := StrToInt(cFamilia);

      DM.QrFamilia.Parameters.ParamByName('TITULARRESPONSAVEL').Datatype := ftInteger;
      DM.QrFamilia.Parameters.ParamByName('TITULARRESPONSAVEL').Value  := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;

      DM.QrFamilia.Parameters.ParamByName('LOTACAO').DataType := ftinteger;
      if nLotacaoFam <> -1 then
      begin
        DM.QrFamilia.Parameters.ParamByName('LOTACAO').Value := nLotacaoFam;
      end
      else
        DM.QrFamilia.Parameters.ParamByName('LOTACAO').value := null;

      DM.QrFamilia.Parameters.ParamByName('SECAO').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('SECAO').value := nSecaoFam;

      DM.QrFamilia.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftinteger;
      if (Trim(cDataCancF)<>'') And (Trim(cMotCancF) <> '') then
        DM.QrFamilia.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := StrToInt(cMotCancF)
      else
        DM.QrFamilia.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;

      DM.QrFamilia.Parameters.ParamByName('EMPRESA').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('EMPRESA').value := 1;
      DM.QrFamilia.Parameters.ParamByName('CONVENIO').DataType := ftinteger;
      DM.QrFamilia.Parameters.ParamByName('CONVENIO').value := 1;

      DM.QrFamilia.Parameters.ParamByName('NOSSONUMEROIMPORTACAO').DataType := ftstring;
      if nhandleContrato in [24,37] then //somente para familia II / 37 incluído no dia 11/01/2008
      begin
        // Atualiza Nosso Numero - 29/09/2008
        if nContrato_Old in [43,25,40] then
        begin
          DM.QrFamilia.Parameters.ParamByName('NOSSONUMEROIMPORTACAO').value := null;
          nContrato_Old:=0;
        end
        else
          DM.QrFamilia.Parameters.ParamByName('NOSSONUMEROIMPORTACAO').Value := '28031050'+Trim(cFamilia); //wilson aqui, alterado por causa do novo convenio carteira 17

        DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').DataType := ftstring;
        if trim(cDescontoEscalonado)<>'' then
          DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').Value := cDescontoEscalonado
        else
           DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').value := null;
      end
      else
      begin
        DM.QrFamilia.Parameters.ParamByName('NOSSONUMEROIMPORTACAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').DataType := ftstring;
        DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').value := null;
      end;

      if cAcao='I' then //tratar o campo somente na inclusão - as alterações serão realizadas via SOC
      begin
        if ((copy(cCodAfinidade,1,3)='150') or (copy(cCodAfinidade,1,3)='140')) then //140 incluído no dia 11/01/2008
        begin
          if trim(cInformativoCorreioEmail) <> '' then
          begin
            If trim(cInformativoCorreioEmail) <> '1' then
            begin
              DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').DataType := ftstring;
              DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').value := cInformativo;
              DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').DataType := ftstring;
              case StrToInt(cInformativoCorreioEmail) of
                2 : DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').Value :='N';
                3 : DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').Value :='S';
              end;
            end
            else
            begin
              DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').DataType := ftstring;
              DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').value := null;
              DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').DataType := ftstring;
              DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').value := null;
            end;
          end
          else
          begin
            DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').DataType := ftstring;
            DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').value := null;
            DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').DataType := ftstring;
            DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').value := null;
          end;
        end
        else
        begin
          DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').DataType := ftstring;
          DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').value := null;
          DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').DataType := ftstring;
          DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').value := null;
        end;
      end
      else
      begin
        DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').DataType := ftstring;
        DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').value := null;
        DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').DataType := ftstring;
        DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').Value    := 'S';
      end;

      DM.qAuxFam.Close;
      DM.qAuxFam.Sql.Clear;
      DM.qAuxFam.Sql.Add('SELECT F.HANDLE');
      DM.qAuxFam.Sql.Add('  FROM SOCPRO.SAM_FAMILIA F ');
      DM.qAuxFam.Sql.Add('  JOIN SOCPRO.SAM_BENEFICIARIO B ON B.FAMILIA = F.HANDLE');
      DM.qAuxFam.Sql.Add(' WHERE B.HANDLE = :HANDLEBENEF');
      DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').Datatype := ftInteger;
      DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
      DM.qAuxFam.Open;

      if DM.qAuxFam.Fieldbyname('HANDLE').AsInteger > 0 then
        nHandleFamilia := DM.qAuxFam.Fieldbyname('HANDLE').AsInteger
      else
      begin
        DM.Qr_handle.Close;
        Dm.Qr_handleFam.Sql.Clear;
        Dm.Qr_handleFam.SQL.Add('SELECT SEQ_SAM0007.NEXTVAL HANDLE FROM DUAL');
        Dm.Qr_handleFam.Open;

        nHandleFamilia := DM.Qr_handleFam.Fieldbyname('HANDLE').AsInteger;
      end;

      DM.QrFamilia.Parameters.ParamByName('HANDLE').Datatype := ftInteger;
      DM.QrFamilia.Parameters.ParamByName('HANDLE').Value := nHandleFamilia;

      DM.QrFamilia.ExecSQL;
    end
    else
    begin
      if (cAcao = 'I') And (nHandleFamilia <> 0) then//(nHandleFamilia <> 0) then //Inserção da Família - Beneficiário não é Titular - grava somente os campos Default
      begin
        DM.QrFamilia.Parameters.ParamByName('CONTRATO').DataType := ftinteger;
        DM.QrFamilia.Parameters.ParamByName('CONTRATO').value:=nHandleContrato;
        DM.QrFamilia.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
        DM.QrFamilia.Parameters.ParamByName('DATAADESAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
        DM.QrFamilia.Parameters.ParamByName('DATACANCELAMENTO').value := null;
        DM.QrFamilia.Parameters.ParamByName('NAOINCLUIRBENEFICIARIO').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('NAOINCLUIRBENEFICIARIO').value := null;
        DM.QrFamilia.Parameters.ParamByName('TABRESPONSAVEL').DataType := ftinteger;
        DM.QrFamilia.Parameters.ParamByName('TABRESPONSAVEL').value := 1;
        DM.QrFamilia.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('COBRANCA').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('COBRANCA').value := null;
        DM.QrFamilia.Parameters.ParamByName('COBRANCANOMESSEGUINTE').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('COBRANCANOMESSEGUINTE').value := null;
        DM.QrFamilia.Parameters.ParamByName('COBRANCADEEVENTO').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('COBRANCADEEVENTO').value := null;
        DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('DIACOBRANCA').value := null;
        DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').DataType := ftinteger;
        DM.QrFamilia.Parameters.ParamByName('DIACOBRANCAORIGINAL').value := null;
        DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').DataType := ftInteger;
        DM.QrFamilia.Parameters.ParamByName('PROXIMOVENCIMENTO').value := null;
        DM.QrFamilia.Parameters.ParamByName('EXTRATOUTILIZACAO').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('EXTRATOUTILIZACAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('DATAINCLUSAO').DataType := ftDateTime;
        DM.QrFamilia.Parameters.ParamByName('DATAINCLUSAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('USUARIOINCLUSAO').DataType := ftinteger;
        DM.QrFamilia.Parameters.ParamByName('USUARIOINCLUSAO').value := 78;
        DM.QrFamilia.Parameters.ParamByName('DATAALTERACAO').DataType := ftDateTime;
        DM.QrFamilia.Parameters.ParamByName('DATAALTERACAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('USUARIOALTERACAO').DataType := ftinteger;
        DM.QrFamilia.Parameters.ParamByName('USUARIOALTERACAO').value := 78;

        DM.QrFamilia.Parameters.ParamByName('FAMILIA').DataType := ftInteger;
        if nPlano = 110 then
        Begin
          If Trim(cFamiliaTit) = '' Then
            DM.QrFamilia.Parameters.ParamByName('FAMILIA').value := null
          else
            DM.QrFamilia.Parameters.ParamByName('FAMILIA').value:=StrToInt(Copy(Trim(cFamiliaTit),5,5));
        end
        else
        Begin
          If Trim(cFamiliaTit) = '' Then
            DM.QrFamilia.Parameters.ParamByName('FAMILIA').value := null
          else
            DM.QrFamilia.Parameters.ParamByName('FAMILIA').value:=StrToInt(cFamiliaTit);
        End;
        DM.QrFamilia.Parameters.ParamByName('TITULARRESPONSAVEL').DataType := ftInteger;
        DM.QrFamilia.Parameters.ParamByName('TITULARRESPONSAVEL').value := null;
        DM.QrFamilia.Parameters.ParamByName('LOTACAO').DataType := ftinteger;
        if nLotacaoFam <> -1 then
          DM.QrFamilia.Parameters.ParamByName('LOTACAO').value := nLotacaoFam
        else
          DM.QrFamilia.Parameters.ParamByName('LOTACAO').value := null;

        DM.QrFamilia.Parameters.ParamByName('SECAO').DataType := ftinteger;
        If nSecaoFam > 0 Then
          DM.QrFamilia.Parameters.ParamByName('SECAO').value:=nSecaoFam
        Else
          DM.QrFamilia.Parameters.ParamByName('SECAO').value := null;

        DM.QrFamilia.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftDateTime;
        DM.QrFamilia.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;
        DM.QrFamilia.Parameters.ParamByName('EMPRESA').DataType := ftInteger;
        DM.QrFamilia.Parameters.ParamByName('EMPRESA').value:=1;
        DM.QrFamilia.Parameters.ParamByName('CONVENIO').DataType := ftInteger;
        DM.QrFamilia.Parameters.ParamByName('CONVENIO').value:=1;
        Dm.QrFamilia.Parameters.ParamByName('NOSSONUMEROIMPORTACAO').DataType := ftstring;
        Dm.QrFamilia.Parameters.ParamByName('NOSSONUMEROIMPORTACAO').value := null;
        DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').DataType := ftstring;
        if nhandleContrato in [24,37] then // 37 incluído no dia 11/01/2008
        begin
          if trim(cDescontoEscalonado)<>'' then
            DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').value := cDescontoEscalonado
          else
            DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').value := null;
        end
        else
          DM.QrFamilia.Parameters.ParamByName('NAOINCIDEDESCONTOESCALONADO').value := null;

        DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('INFORMATIVOS').value:='S';
        DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').DataType := ftString;
        DM.QrFamilia.Parameters.ParamByName('DEMONSTRATIVOEMAIL').value:='S';

        DM.QrFamilia.Parameters.ParamByName('HANDLE').DataType := ftinteger;
        if (DM.qAuxFam.IsEmpty) then
        begin
          DM.Qr_handle.Close;
          Dm.Qr_handleFam.Sql.Clear;
          Dm.Qr_handleFam.SQL.Add('SELECT SEQ_SAM0007.NEXTVAL HANDLE FROM DUAL');
          Dm.Qr_handleFam.Open;
          DM.QrFamilia.Parameters.ParamByName('HANDLE').value  := DM.Qr_handleFam.Fieldbyname('HANDLE').AsInteger;
        end
        else
          DM.QrFamilia.Parameters.ParamByName('HANDLE').value  := nHandleFamilia;

        DM.QrFamilia.ExecSQL;
      end;
    end;
  except
     On E:Exception do
     begin
        Grava_Log('2',DM.qAuxFam.Fieldbyname('HANDLE').AsString,'F','I');
        nEF:=nEF + 1;
        SGGrade.Cells[4,3]:=IntToStr(nEF);
        SGGrade.Refresh;
        RegistraLog(nNrImport,'HANDLE-Fam TCSC037.:'+DM.qAuxFam.Fieldbyname('HANDLE').AsString+' '+E.Message,'INSERT/UPDATE SOCPRO.SAM_FAMILIA');
     end;
  end;
end;

//****************************************BENEFICIARIO**************************************

Function TFrmBeneficiario.Tratar_MotivoCancelamento:Integer;
{Foi utilizada a tabela de->para CSC e Benner para relacionar os motivos}
begin
    nSituacao:=0;
    DM.QrySaudePro14.SQL.Clear;
    DM.QrySaudePro14.SQL.Add('SELECT MOTIVOSOC FROM MOTIVOCANCELAMENTO_CSC_SOC WHERE MOTIVOCSC='+DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsString);
    DM.QrySaudePro14.Open;
    cMotCSC:= DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger;
    if not DM.QrySaudePro14.IsEmpty then
       nSituacao:=DM.QrySaudePro14.fieldbyName('MOTIVOSOC').Value;
    ///Case DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger of
    {Case DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger of
            1:nSituacao:=1;
            2:nSituacao:=8;
            3:nSituacao:=5;
            4:nSituacao:=7;
            5:nSituacao:=9;
            6:nSituacao:=10;
            7:nSituacao:=11;
            8:nSituacao:=12;
            9:nSituacao:=13;
           11:nSituacao:=42;//conforme e-mail da Darc - 15/12/03   //14;
           12:nSituacao:=15;
           13:nSituacao:=27;
           14:nSituacao:=35;
           32:nSituacao:=28;
           21:nSituacao:=34;
           31:nSituacao:=18;
           //32:nSituacao:=22;
           33:nSituacao:=19;
           34:nSituacao:=24;
           29,35,66,83,92:nSituacao:=21;   //Exclusão pela previ - Outros
           36:nSituacao:=20;
           37:nSituacao:=23;
           39:nSituacao:=21;
           53:nSituacao:=36;
           54:nSituacao:=28;
           57:nSituacao:=26;
           61:nSituacao:=62;
           62:nSituacao:=1;
           20:nSituacao:=44; //Criado no dia 01/12/2004 - Walquíria (produtos)
           80:nSituacao:=40; //Cfme e-mail do Alexandre Paredes  - dia 12/09/2003
           65:nsituacao:=37;//agora é código de exclusão - criado dia 22/05 -
           70:nSituacao:=45;//email Solange - 21/11/05
           71:nSituacao:=46;//email Solange - 21/11/05
           105:nSituacao:=47;
           10,30,52,64:nSituacao:=29; //Motivo criado para Migração será desativado
           51:nsituacao :=26;
           69:nsituacao :=44;
           72:nsituacao :=51; //28/04/08 service call - 210.609
           73:nsituacao :=52; //28/04/08 service call - 210.609
           74:nsituacao :=74; //27/08/08 service call - 226.972
           75:nsituacao :=75; //27/08/08 service call - 226.972
     end;   }
    //MEMO COM A ANOTAÇÃO ADMINISTRATIVA
    Case DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger of
    ///Case DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger of
        10:cMemoAnotacao:='Mot.Cancelamento -> 10 - EXCLUSÃO PELO DEASP';
        11:cMemoAnotacao:='Mot.Cancelamento -> 11 - EXCLUSAO POR EXPIRACAO DA INCLUSAO P/PRAZO DETERMINADO';
        20:cMemoAnotacao:='Mot.Cancelamento -> 20 - EXCLUSAO - OUTROS';
        30:cMemoAnotacao:='Mot.Cancelamento -> 30 - EXCLUSAO AUTOMATICO DEPENDENTE NAO CADASTRADO (CASSI)';
        51,52,57:cMemoAnotacao:='Mot.Cancelamento -> 51,52,57 - EXCLUIDO POR FRAUDE DECISAO DE DIRETORIA DA CASSI';
        55:cMemoAnotacao:='Situação Normalizada Independente do BB ou Previ';
//        61:cMemoAnotacao:='Mot.Cancelamento -> 61 - EXCLUIDO POR FALTA DE PAGAMENTO - DEFINITIVO';
        64:cMemoAnotacao:='Mot.Cancelamento -> 64 - EXCLUIDO POR EXONERACAO DO ASSOCIADO - PLANO DE DEPENDENTE INDIRETO';
        69:cMemoAnotacao:='Mot.Cancelamento -> 69 - EXCLUIDO POR OUTROS MOTIVOS (PLANOS - EXCETO ASSOCIADO)';
        80:cMemoAnotacao:='Mot.Cancelamento -> 80 - EXCLUIDO POR TERMINO DO PERIODO DE VIGENCIA DO BENEFICIARIO';
        81:cMemoAnotacao:='Mot.Cancelamento -> 81 - CARGA ESPECIAL';

    end;
    Result:=nSituacao;
end;


Function TFrmBeneficiario.Find_CodVinculo(nVinculo:integer):integer;
{Foi Utilizada a Tabela De->para para relacionar os Códigos CSC e Benner}
begin
   Result:=-1;
   Case nContrato of
       30 :   Case nVinculo of   //Aposentados
                 0             :Result := 45;
                90	           :Result :=	885;
                93,94	         :Result :=	886;
                99	           :Result :=	340;
                30,35,92	     :Result :=	47;
                41,51	         :Result :=	887;
                10,20,95,96	   :Result :=	906;
                40,43,50,53,59 :Result :=	888;
                42,44,46,52,54 :Result :=	111;
                47	           :Result :=	522;
                97	           :Result :=	937;
                45,55,56	     :Result := 51;
              end;

         {  3 : Case nVinculo of //Exonerados
                 0 :Result:=124  //Titular
                  :Result:=125  //Filho adotivo
                  :Result:=126  //Filho adotivo/Enteado- Inválidos
                  :Result:=127  //Filho
                  :Result:=128  //Enteado
                  :Result:=129  //Cônjuge
                  :Result:=209  //Companheiro(a)
                  :Result:=211  //Ex-Marido/Ex-Esposa Divorciado(a) (Desativar)
                  :Result:=212  //Menor sob Guarda / Tutelado
                  :Result:=213  //Irmãos
                  :Result:=216  //Avós
                  :Result:=217  //Sobrinho(a) ou cônjuge
                  :Result:=218  //Primo(a)
                  :Result:=219  //Neto(a) ou cônjuge
                  :Result:=220  //Sogro(a)
                  :Result:=221  //Cunhado(a)
                  :Result:=222  //Parente Indireto Inválido
                  :Result:=223  //Pessoa designada
                  :Result:=224  //Marido/Esposa Separado(a) Judicialmente-Desativar
                  :Result:=339  //Companheiro(a) Homoafetivo
                  :Result:=374  //Filha
                  :Result:=375  //Filha adotiva
                  :Result:=376  //Filha adotiva/Enteada- Inválidos
                  :Result:=377  //Enteada
               end;
           }
        1,80,3 :   Case nVinculo of //Associados-Paraguaios/Exonerados
                       0              : Result :=1;
                      90	            : Result :=	865	;
                      93,94	          : Result :=	866	;
                      99	: Result    :=	338	;
                      30,35,92	      : Result :=	6	;
                      41,51	: Result  :=	867	;
                      10,20,95,96	    : Result :=	905	;
                      40,43,50,53,59	: Result :=	868	;
                      42,44,46,52,54	: Result :=	89	;
                      47	            : Result :=	521	;
                      97	            : Result :=	926	;
                      45,55,56	      : Result :=	3	;
              end;


        2 :   Case nVinculo of  //Dep.Indiretos
                   10,20,95,96:Result:=54;
                            //60:Result:=56;
                            80:Result:=65;
                            61:Result:=57;
                            62:Result:=52;
                            73:Result:=59;
                            81:Result:=53;
                            70:Result:=62;
                            71:Result:=60;
                            72:Result:=61;
                            //59:Result:=55;
                      85,55,56:Result:=63;
                         91,98:Result:=64;
                  //Abaixo Conforme e-mail
                             0:Result:=0;
                            30:Result:=30;
                         //40,50:Result:=122;
                         //41,51:Result:=123;
                         42,44:Result:=58;
                         //45,46:Result:=225;//conforme e-mail Alexandra/Héderson
                            46:Result:=430;//S.C.-> 135382 - Alexandra Paiani
                         52,54:Result:=12;
                         90,93:Result:=2;
                            92:Result:=1;
                   //---Email Leo 27/04/06--------------------------------------
                         41,51:Case nSexoVinculo of 0:Result:=123;1:Result:=369 end;
                         40,50:Case nSexoVinculo of 0:Result:=122;1:Result:=370 end;
                            45:Case nSexoVinculo of 0:Result:=225;1:Result:=371 end;
                            59:Case nSexoVinculo of 0:Result:=55;1:Result:=372 end;
                            60:Case nSexoVinculo of 0:Result:=56;1:Result:=373 end;
                   //----------------------------------------------------------

              end;
       50 :   Case nVinculo of  //Pensionistas
                            0:Result:=72;
                     30,35,92:Result:=74;
                           //59:Result:=75;
                        //40,50:Result:=76;
                        //43,53:Result:=77;
                        //41,51:Result:=78;
                  44,54,42,52:Result:=79;
                        //45,46:Result:=80;
                     90,93,94:Result:=85;
                  10,20,95,96:Result:=73;
                           //60:Result:=82;
                           61:Result:=83;
                     55,56,85:Result:=81;
                        91,98:Result:=84;
                 //Abaixo Conforme e-mail
                           99:Result:=341;
                       //---Email Leo 27/04/06--------------------------------------
                        41,51:Case nSexoVinculo of 0:Result:=78;1:Result:=383 end;
                        40,50:Case nSexoVinculo of 0:Result:=76;1:Result:=384 end;
                        43,53:Case nSexoVinculo of 0:Result:=77;1:Result:=385 end;
                        45,46:Case nSexoVinculo of 0:Result:=80;1:Result:=387 end;
                           59:Case nSexoVinculo of 0:Result:=75;1:Result:=388 end;
                           60:Case nSexoVinculo of 0:Result:=82;1:Result:=389 end;
                   //----------------------------------------------------------

              end;
       100 :  //Conforme e-mail //Família I
              if nVinculo In [0,1,2,3,10,11,13,14,15,16,17,20,21,22,23,24,30,32] then
                 Result:=13;
              //else if nvinculo=21 then
              //   Result:=398;


       110 :  Case nVinculo of  //Família II
                    1:Result:=1;//1:Result:=18;
                    2:Result:=2;//2:Result:=17;
                    3:Result:=3;//3:Result:=21;
                   10:Case nSexoVinculo of 0:Result:=10;1:Result:=108 end;//10:Result:=23;
                   11:Case nSexoVinculo of 0:Result:=11;1:Result:=113 end;//11:Result:=20;
                12,14:Result:=12;//12,14:Result:=27;
                   13:Case nSexoVinculo of 0:Result:=13;1:Result:=109 end;//13:Result:=24;
                   16:Case nSexoVinculo of 0:Result:=15;1:Result:=112 end;//16:Result:=25;
                   15:Result:=14;//15:Result:=29;
                   17:Result:=16;//17:Result:=31;
                   20:Result:=20;//20:Result:=26;
                   21:Result:=21;//21:Result:=14;
                22,23:Result:=22;//22,23:Result:=28;
                   24:Result:=23;//24:Result:=19;
                30,31:Result:=30;//30,31:Result:=32;
                32,33:Result:=31;//32,33:Result:=30;
                34,35:Result:=32;//34,35:Result:=16;
                   36:Result:=33;//36:Result:=15;
                   37:Result:=437;//E-mail Viviane 12/04/07 - Padrasto/Madrasta
                    0:Result:=0;//0:Result:=264;//Héderson conversou com a Valquíria - dia 16/12/2002  -ERA FUNCIONÁRIO CASSI
        //Abaixo Conforme e-mail
               40,50:Result:=10;
              end;

       120,121:   Case nVinculo of  //Família PAQ
                   //45,55:Result:=331;
                   46,54,56:Result:=334;
                   60:Result:=332;
                   85:Result:=333;
                   2,90,93,94:Result:=324;
                   0:Result:=327;
                   1:Result:=325;
                   3:Result:=328;
                   //10:Result:=329;
                   //16:Result:=332;
                   //--email leo 27/04/06--------------------------------------
                   // :Case nSexoVinculo of 0:Result:=326;1:Result:=402 end;
                   10:Case nSexoVinculo of 0:Result:=329;1:Result:=403 end;
                   //--email Poliana 16/07/08--------------------------------------
                   11:Result:=326;
                   32:Result:=445;
                   //----------------------------------------------------------
                   //:Case nSexoVinculo of 0:Result:=330;1:Result:=404 end;
                45,55:Case nSexoVinculo of 0:Result:=331;1:Result:=406 end;
                   16:Case nSexoVinculo of 0:Result:=332;1:Result:=407 end;
                   //----------------------------------------------------------

              end;

       130 :  Case nVinculo of //Func.Cassi - Adm
                   0:Result:=33;
                   1:Result:=37;
                   2:Result:=38;
                  //10:Result:=34;
                  //11:Result:=36;
                  //13:Result:=35;
                  //--email leo 27/04/06--------------------------------------
                  11:Case nSexoVinculo of 0:Result:=36;1:Result:=409 end;
                  10:Case nSexoVinculo of 0:Result:=34;1:Result:=410 end;
                  13:Case nSexoVinculo of 0:Result:=35;1:Result:=411 end;
                  //----------------------------------------------------------
              end;

       131 :  Case nVinculo of //Func.Cassi
                   0:Result:=262;
                   1:Result:=257;
                   2:Result:=260;
                  //10:Result:=258;
                  //11:Result:=261;
                  //13:Result:=259;
                  //--email leo 27/04/06--------------------------------------
                  11:Case nSexoVinculo of 0:Result:=261;1:Result:=412 end;
                  10:Case nSexoVinculo of 0:Result:=258;1:Result:=413 end;
                  13:Case nSexoVinculo of 0:Result:=259;1:Result:=414 end;
                  //----------------------------------------------------------
              end;


       210 :  if nVinculo=0 then //Prefeitura SBC
                 Result:=40;

       240 :  if nVinculo=0 then //Proasa
                 Result:=41;

       250 :  if nVinculo=0 then  //STF
                     Result:=42;

       220 : if nVinculo=0 then  //ABET
                     Result:=43;

       230 :  if nVinculo=0 then //TRT
                 Result:=44;

       200 :  if nVinculo=0 then //BASA
                 Result:=39;

       260 :  if nVinculo=0 then //OAB
                 Result:=256;

       280 : If nVinculo=0 then //CABERGS
                 result:=265;

       290 : if nVinculo=0 then //TJA
                 result:=289;

       300 : case nVinculo of //PDE
               0: result:=310;
               1: result:=313;
               2: result:=314;
               //10: result:=315;
               //13: result:=316;
               //41: result:=317;
               //11: result:=318;
               3: result:=319;
               //15: result:=320;
               12: result:=321;
               43: result:=322;
               //--email leo 27/04/06--------------------------------------
               11:Case nSexoVinculo of 0:Result:=318;1:Result:=421 end;
               10:Case nSexoVinculo of 0:Result:=315;1:Result:=422 end;
               13:Case nSexoVinculo of 0:Result:=316;1:Result:=423 end;
               41:Case nSexoVinculo of 0:Result:=317;1:Result:=424 end;
               15,16:Case nSexoVinculo of 0:Result:=537;1:Result:=425 end;
               //----------------------------------------------------------
             end;

       310 : If nVinculo=0 then //Serpro
                 result:=311;

       320 : If nVinculo=0 then //TJDF
                 result:=312;

       340 : If nVinculo=0 then //alumar
                result:=337;

       370 : if nVinculo=0 then //FIRJAN
                result:=426;

       360 : if nVinculo=0 then //BACEN
                result:=363;

       390 : if nVinculo = 0 then //TST
                result := 431;

       400 : if nVinculo = 0 then //FASCAL
                result := 511;

       410 : if nVinculo = 0 then //CASEMBRAPA - incluido 09/03/2009
                result := 525;

   end;
end;


Function TFrmBeneficiario.Tratar_Beneficiario_Indicador_Antigo:String;
{Beneficiário Indicador da Família I e II}
var cAssign:String;
    nDigit :Integer;
begin
   //Alessandro luiz Mamus - Benner Saúde - 26/07/2001
  Result:='';
  DM.QrSaudePro1.close;
  DM.QrSaudePro1.Sql.Clear;
  DM.QrSaudePro1.Sql.Add('SELECT CSC037WMTRBENF,CSC037WNRODEPY '+
                         '  FROM SOCPRO.TCSC037 '+
                         ' WHERE CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY ');
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftString;
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WMTRBENF').Value:=DM.Adoquery.Fieldbyname('CSC039WMTRANTE').AsString;
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftInteger;
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WNRODEPY').Value :=DM.Adoquery.Fieldbyname('CSC039WDEPANTE').AsInteger;
  DM.QrSaudePro1.Open;

  cAssign:=DM.QrSaudePro1.FieldByName('CSC037WMTRBENF').AsString;
  nDigit :=DM.QrSaudePro1.Fieldbyname('CSC037WNRODEPY').AsInteger;

  DM.QrSaudePro1.close;
  DM.QrSaudePro1.Sql.Clear;
  DM.QrSaudePro1.Sql.Add(' SELECT HANDLE FROM SOCPRO.TCSC037 '+
                         '  WHERE CSC037WCODVINC <> 97 AND CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY');
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftString;
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WMTRBENF').value :=cAssign;
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftInteger;
  Dm.QrSaudePro1.Parameters.ParamByName('CSC037WNRODEPY').value:=nDigit;
  DM.QrSaudePro1.Open;

  if not DM.QrSaudePro1.FieldByname('HANDLE').IsNull then
  begin
    Dm.QrySaudePro14.Close;
    Dm.QrySaudePro14.Sql.Clear;
    DM.QrySaudePro14.SQL.Add('SELECT COUNT(*) QTD FROM SOCPRO.SAM_BENEFICIARIO WHERE HANDLE=:HANDLE');
    Dm.QrySaudePro14.Parameters.ParamByName('handle').DataType := ftInteger;
    Dm.QrySaudePro14.Parameters.ParamByName('handle').value := DM.QrSaudePro1.fieldbyName('HANDLE').AsInteger;
    DM.QrySaudePro14.Open;
    if DM.QrySaudePro14.FieldByName('qtd').Value > 0 then
      Result:=DM.QrSaudePro1.fieldbyName('HANDLE').AsString
    else
      Result:='';
  end;
end;


Procedure TFrmBeneficiario.Tratar_CBO;
{Cria-se um Memo com a ocupação do Benef. para posterior inserção
 em anotaçãoes administrativas do Benef.}
var cTexto:string;
begin
   cTexto:='SELECT '+
          '       C.CSC038WCODCARR,'+
          '       C.CSC038WTXTDESC '+
          '  FROM SOCPRO.TCSC039 B,'+
          '       TCSC038 C'+
          ' WHERE B.CSC039WMTRBENF=:CSC039WMTRBENF AND '+
          '       B.CSC039WNRODEPY=:CSC039WNRODEPY AND '+
          '       B.CSC039WCODCARR IS NOT NULL AND '+
          '       C.CSC038WCODCARR=B.CSC039WCODCARR ';
   DM.QrSaudePro1.Close;
   DM.QrSaudePro1.Sql.Clear;
   DM.QrSaudePro1.Sql.Add(cTexto);
   Dm.QrSaudePro1.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftString;
   DM.QrSaudePro1.Parameters.ParamByName('CSC039WMTRBENF').value :=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
   Dm.QrSaudePro1.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftInteger;
   DM.QrSaudePro1.Parameters.ParamByName('CSC039WNRODEPY').Value :=DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger;
   DM.QrSaudePro1.Open;
   if not DM.QrSaudePro1.FieldByname('CSC038WCODCARR').IsNull then
      if Trim(cMemoAnotacao)<>'' then
        cMemoAnotacao:=cMemoAnotacao+chr(13)+' Ocupação -> '+DM.QrSAUDEPRO1.Fieldbyname('CSC038WCODCARR').AsString +' - '+
                                                             DM.QrSAUDEPRO1.Fieldbyname('CSC038WTXTDESC').AsString
      else
        cMemoAnotacao:=' Ocupação -> '+DM.QrSAUDEPRO1.Fieldbyname('CSC038WCODCARR').AsString +' - '+
                                       DM.QrSAUDEPRO1.Fieldbyname('CSC038WTXTDESC').AsString;
end;


Procedure TFrmBeneficiario.InsertFamilia_Novo; //19/05/2009 - Insert de CBO somente em Familia
begin
  Try
  if (nhandleContrato in [23,24,25,37,40,43]) then
    if cCBOHandle > 0 then
    begin
      DM.QrCBO.Close;
      DM.QrCBO.Sql.Clear;
      DM.QrCBO.SQL.Add('UPDATE SAM_BENEFICIARIO');
      DM.QrCBO.SQL.Add(' SET CBO =:CBO');
      DM.QrCBO.SQL.Add(' WHERE HANDLE = :HANDLE');
      DM.QrCBO.Parameters.ParamByName('CBO').DataType := ftInteger;
      DM.QrCBO.Parameters.ParamByName('CBO').value:=cCBOHandle;
      DM.QrCBO.Parameters.ParamByName('HANDLE').DataType := ftinteger;
      DM.QrCBO.Parameters.ParamByName('HANDLE').value:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
      DM.QrCBO.ExecSQL;
    end
  Except
    On E:Exception do
    begin
     Grava_Log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','I');
     RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.Adoquery.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_BENEFICIARIO - InsertFamilia_Novo');
     lInseriuBeneficiario:=false;
    end;
  end;//Try

end;


Procedure TFrmBeneficiario.Inserir_AnotAdm_Beneficiario(vCase:integer);
begin
  nMaxHandleAnotacao:=0;
  Dm.QrInsAnotAdm.SQL.Clear;
  Dm.QrInsAnotAdm.SQL.Add('SELECT SEQ_SAM0167.NEXTVAL HANDLE FROM DUAL');
  DM.QrInsAnotAdm.open;
  //if not DM.QrInsAnotAdm.Fieldbyname('MAX').IsNull then
  nMaxHandleAnotacao:=DM.QrInsAnotAdm.Fieldbyname('HANDLE').AsInteger;

  Dm.QrInsAnotAdm.Close;
  Dm.QrInsAnotAdm.SQL.clear;
  Dm.QrInsAnotAdm.SQL.Add('INSERT INTO SOCPRO.SAM_BENEFICIARIO_ANOTADM(HANDLE,BENEFICIARIO,ANOTACAO,DATA,OBSERVACAO)');
  Dm.QrInsAnotAdm.SQL.Add(         'VALUES (:HANDLE,:BENEFICIARIO,:ANOTACAO,:DATA,:OBSERVACAO)');

  Try
    DM.QrInsAnotAdm.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    DM.QrInsAnotAdm.Parameters.ParamByName('HANDLE').value      := nMaxHandleAnotacao;
    DM.QrInsAnotAdm.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
    DM.QrInsAnotAdm.Parameters.ParamByName('BENEFICIARIO').value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    DM.QrInsAnotAdm.Parameters.ParamByName('ANOTACAO').DataType := ftInteger;
    DM.QrInsAnotAdm.Parameters.ParamByName('ANOTACAO').value    := 5;//Anotação do Beneficiário= Tipo 2
    DM.QrInsAnotAdm.Parameters.ParamByName('DATA').DataType := ftDateTime;
    DM.QrInsAnotAdm.Parameters.ParamByName('DATA').Value       := now;
    if vCase = 1 then
    begin
      DM.QrInsAnotAdm.Parameters.ParamByName('OBSERVACAO').DataType := ftString;
      DM.QrInsAnotAdm.Parameters.ParamByName('OBSERVACAO').value  :=cMemoAnotacao;
    end
    else //sempre incluir um novo reg quando a data de adesão do benef. for menor que a do contrato
    begin
      DM.QrInsAnotAdm.Parameters.ParamByName('OBSERVACAO').DataType := ftstring;
      DM.QrInsAnotAdm.Parameters.ParamByName('OBSERVACAO').value  :=' A data de adesão do beneficiário foi alterada intencionalmente para a ' + chr(13) +
                                                         ' mesma data de adesão do contrato no sistema benner, continuando incorreta '+ chr(13) +
                                                         ' no CSC devido a impossibilidade de fazer a sua manutenção.'+chr(13)+
                                                         ' Data original no CSC.: '+cDataAdesao;
    end;

    DM.QrInsAnotAdm.ExecSQL;
  except
    On E:Exception do
    Begin
      Grava_Log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'AA','I');
      RegistraLog(nNrImport,'Nro. HANDLE TCSC037:' + Inttostr(DM.Adoquery.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'INSERCAO ANOT.ADM -BENEFICIÁRIO');
    End;
  end;
end;

Procedure TFrmBeneficiario.Grava_log(Tipo,nHandleD,Tabela,nTipo:String);
Var NomeDoLog: String;
    Arquivo: TextFile;
    Dia,Mes,Ano,Hora,Minuto,Segundo,DiaC,MesC,AnoC,V_Data_CSC,V_Motivo_CSC,V_Data_SOC,V_Motivo_SOC,V_Descricao_Mot_Canc_SOC,V_Situacao,V_TIPO,V_Tabela: String;
    V_NOME,V_MATRICULACASSI: String;
  Begin
    If (Trim(nHandleD) <> '') And (nHandleD <> '0') Then
       Begin
          Dia                       := '';
          Mes                       := '';
          Ano                       := '';
          DiaC                      := '';
          MesC                      := '';
          AnoC                      := '';
          V_Data_CSC                := '';
          V_Motivo_CSC              := '';
          V_Data_SOC                := '';
          V_Motivo_SOC              := '';
          V_Descricao_Mot_Canc_SOC  := '';
          V_Situacao                := '';
          V_TIPO                    := '';
          V_Tabela                  := '';
          V_Nome                    := '';
          V_Matriculacassi          := '';

          Dm.QrCodOcup.Close;
          Dm.QrCodOcup.SQL.Clear;
          Dm.QrCodOcup.SQL.Add('SELECT T37.CSC037WDMAFIMYDRTO, T37.CSC037WINDMOTV FROM SOCPRO.TCSC037 T37');
          Dm.QrCodOcup.SQL.Add('WHERE T37.HANDLE = :HANDLE');
          Dm.QrCodOcup.Parameters.ParamByName('HANDLE').DataType := ftInteger;
          Dm.QrCodOcup.Parameters.ParamByName('HANDLE').value := StrToInt(nHandleD);
          Dm.QrCodOcup.Open;

          If (Not (DM.QrCodOcup.Fieldbyname('CSC037WDMAFIMYDRTO').IsNull)) And (DM.QrCodOcup.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger > 0) Then
             Begin
                DiaC         := Copy(DM.QrCodOcup.Fieldbyname('CSC037WDMAFIMYDRTO').AsString,7,2);
                MesC         := Copy(DM.QrCodOcup.Fieldbyname('CSC037WDMAFIMYDRTO').AsString,5,2);
                AnoC         := Copy(DM.QrCodOcup.Fieldbyname('CSC037WDMAFIMYDRTO').AsString,1,4);
                V_Data_CSC   := DiaC + '/' + MesC + '/' + AnoC;
                V_Motivo_CSC := (DM.QrCodOcup.Fieldbyname('CSC037WINDMOTV').AsString);
             End;

          If (V_Motivo_CSC <> '') Then
             Begin
                Dm.QrCodOcup.Close;
                Dm.QrCodOcup.SQL.Clear;
                Dm.QrCodOcup.SQL.Add('SELECT MOT.MOTIVOSOC, SMC.DESCRICAO FROM MOTIVOCANCELAMENTO_CSC_SOC MOT');
                Dm.QrCodOcup.SQL.Add('JOIN SOCPRO.SAM_MOTIVOCANCELAMENTO SMC ON SMC.HANDLE = MOT.MOTIVOSOC');
                Dm.QrCodOcup.SQL.Add('WHERE MOT.MOTIVOCSC = :HANDLE');
                Dm.QrCodOcup.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                Dm.QrCodOcup.Parameters.ParamByName('HANDLE').Value := StrToInt(V_Motivo_CSC);
                Dm.QrCodOcup.Open;

                If (Not (DM.QrCodOcup.Fieldbyname('MOTIVOSOC').IsNull)) And (Not (DM.QrCodOcup.Fieldbyname('DESCRICAO').IsNull)) Then
                   Begin
                      V_Motivo_SOC             := (DM.QrCodOcup.Fieldbyname('MOTIVOSOC').AsString);
                      V_Descricao_Mot_Canc_SOC := (DM.QrCodOcup.Fieldbyname('DESCRICAO').AsString);
                   End;
              End;
              
          Dm.QrCodOcup.Close;
          Dm.QrCodOcup.SQL.Clear;
          Dm.QrCodOcup.SQL.Add('SELECT BEN.DATACANCELAMENTO, BEN.MOTIVOCANCELAMENTO, BEN.NOME, BEN.MATRICULACASSI FROM SOCPRO.SAM_BENEFICIARIO BEN');
          Dm.QrCodOcup.SQL.Add('WHERE BEN.HANDLE = :HANDLE');
          Dm.QrCodOcup.Parameters.ParamByName('HANDLE').DataType := ftinteger;
          Dm.QrCodOcup.Parameters.ParamByName('HANDLE').value := StrToInt(nHandleD);
          Dm.QrCodOcup.Open;

          If (Not (DM.QrCodOcup.Fieldbyname('DATACANCELAMENTO').IsNull)) And (Not (DM.QrCodOcup.Fieldbyname('MOTIVOCANCELAMENTO').IsNull)) Then
             Begin
                V_Data_SOC       := (DM.QrCodOcup.Fieldbyname('DATACANCELAMENTO').AsString);
                V_Motivo_SOC     := (DM.QrCodOcup.Fieldbyname('MOTIVOCANCELAMENTO').AsString);
                V_Nome           := (DM.QrCodOcup.Fieldbyname('NOME').AsString);
                V_Matriculacassi := (DM.QrCodOcup.Fieldbyname('MATRICULACASSI').AsString);
             End
          Else
             Begin
                V_Nome           := (DM.QrCodOcup.Fieldbyname('NOME').AsString);
                V_Matriculacassi := (DM.QrCodOcup.Fieldbyname('MATRICULACASSI').AsString);
             End;

          Dia := Copy(DateToStr(Date),1,2);
          Mes := Copy(DateToStr(Date),4,2);
          Ano := Copy(DateToStr(Date),7,4);


           Hora:= Copy(datetimetostr(getTime()),12,2);

           Minuto:= Copy(datetimetostr(getTime()),15,2);

           Segundo:= Copy(datetimetostr(getTime()),18,2);

          If (V_Data_SOC = '') And (V_Data_CSC <> '') Then
             V_Situacao := 'CANCELAMENTO'
          Else If (V_Data_SOC <> '') And (V_Data_CSC = '') Then
             V_Situacao := 'REATIVACAO'
          Else If (V_Data_SOC = '') And (V_Data_CSC = '') Then
             V_Situacao := 'JA ATIVO CSC/SOC'
          Else
             V_Situacao := 'JA CANCELADO CSC/SOC';

          //SHOWMESSAGE('Dia: ' + Dia + ' Mês: ' + Mes + ' Ano: ' + Ano);
          If Tipo = '1' then
              NomeDoLog := 'C:\SOC\LOG_DIFERENCIAL\LOG_DIFERENCIAL_OK_' + Dia + '_' + Mes +'_' + Ano +'.TXT'      //\\SEDESRV143\PUBLICO\
          Else
              NomeDoLog := 'C:\SOC\LOG_DIFERENCIAL\LOG_DIFERENCIAL_ERRO_' + Dia + '_' + Mes +'_' + Ano +'.TXT';

          If Tabela = 'B' Then
             V_Tabela := 'SAM_BENEFICIARIO'
          Else If Tabela = 'F' Then
             V_Tabela := 'SAM_FAMILIA'
          Else If (Tabela = 'M') Or (Tabela = 'C') Then
             V_Tabela := 'SAM_MATRICULA'
          Else If Tabela = 'BM' Then
             V_Tabela := 'SAM_BENEFICIARIO_MODULO'
          Else If Tabela = 'BMH' Then
             V_Tabela := 'SAM_BENEFICIARIO_MODULO_HISTORICO'
          Else If Tabela = 'CF' Then
             V_Tabela := 'SFN_CONTAFIN'
          Else If Tabela = 'BD' Then
             V_Tabela := 'SAM_BENEFICIARIO_DOCENTREGUE'
          Else If Tabela = 'E' Then
             V_Tabela := 'SAM_ENDERECO'
          Else If Tabela = 'T37' Then
             V_Tabela := 'TCSC037'
          Else If Tabela = 'T37D' Then
             V_Tabela := 'TCSC037_DIFF'
          Else If Tabela = 'BH' Then
             V_Tabela := 'SAM_BENEFICIARIO_HISTORICO'
          Else If Tabela = 'BC' Then
             V_Tabela := 'SAM_BENEFICIARIO_CARENCIA'
          Else If Tabela = 'L' Then
             V_Tabela := 'LIMITACAO'
          Else If Tabela = 'AA' Then
             V_Tabela := 'SAM_BENEFICIARIO_ANOTADM';

          If nTipo = 'I' Then
             V_TIPO := 'INCLUSAO'
          Else
             V_TIPO := 'ALTERACAO';

          AssignFile(Arquivo, NomeDoLog);
          
          If FileExists(NomeDoLog) Then
             Append(Arquivo)  //se existir, apenas adiciona linhas
          Else
             ReWrite(Arquivo);  //cria um novo se não existir
          Try
             If Contador = 1 then
                Begin
                   WriteLn(Arquivo, 'REGISTRO;CONTRATO;HANDLE;MATRICULACASSI;NOME_BENEFICIARIO;TITULAR;SITUAÇÃO;DATACANCELAMENTO;MOTIVOCANCELAMENTO_SOC;DESCRICAO_MOTIVO_CANCELAMENTO;TABELA;TIPO');
                End;
             If Trim(V_Nome) <> '' Then
                WriteLn(Arquivo, IntToStr(Contador)+ ';' + IntToStr(nHandleContrato) + ';' + nHandleD + ';' + V_Matriculacassi + ';' + V_Nome + ';' + cTiTu + ';' + V_Situacao + ';' + V_Data_CSC + ';' + V_Motivo_SOC + ';' + V_Descricao_Mot_Canc_SOC + ';' + V_Tabela + ';' + V_TIPO)
             Else
                WriteLn(Arquivo, IntToStr(Contador)+ ';' + IntToStr(nHandleContrato) + ';' + nHandleD + ';' + cCodAfinidade + ';' + cNome + ';' + cTiTu + ';' + V_Situacao + ';' + V_Data_CSC + ';' + V_Motivo_SOC + ';' + V_Descricao_Mot_Canc_SOC + ';' + V_Tabela + ';' + V_TIPO);
          Finally
             CloseFile(Arquivo)
       End;
       Contador := Contador + 1;
    End;
End;

procedure TFrmBeneficiario.Filial_Regiao_Endereco(nHandleTit,nHandleDep:integer);
{Parâmetros in -> nHandleTit:Handle do Benef.Titular
                  nHandleDep:Handle do Benef.Dep - se benef.for o Titular então nHandleDep é igual a nHandleTit
 Lógica -> Verifica se o Endereço do Titular foi criado na Sam_Endereço;
           Verifica se campos existentes em sam_beneficiário são iguais aos do end. em questão;
           Associa o handle do endereço (que é o mesmo Handle do Benef.titular) ao end.
           do Benef. e busca-se a filial de custo e região a partir do endereço do Benef Tit.}
var cTextoSql,cFilB,cRegB,cFilR,cRegR:string;
begin
 try
   //Verifica se Endereço do Titular foi criado na Sam_Endereço
   If (Trim(IntToStr(nHandleTit)) <> '') Then
      Grava_log('1',IntToStr(nHandleTit),'E','I');
   //RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.QrGeral.Fieldbyname('HANDLE').AsInteger),'Filial_Regiao_Endereco');
   //SHOWMESSAGE(inttostr(nHandleTit) + ' ' + inttostr(nHandleDep));
   cTextoSql:=' SELECT HANDLE FROM SOCPRO.SAM_ENDERECO WHERE HANDLE=:HANDLE';
   LoadStringQuery(cTextoSql);
   DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftinteger;
   DM.QrGeral.Parameters.ParamByName('HANDLE').value := nHandleTit;
   DM.QrGeral.Open;
   If not DM.QrGeral.Fieldbyname('HANDLE').IsNull then
   begin
     LoadStringQuery('SELECT FILIALCUSTO,REGIAO,ENDERECOCORRESPONDENCIA,ENDERECORESIDENCIAL '+
                     '  FROM SOCPRO.SAM_BENEFICIARIO '+
                     ' WHERE HANDLE=:HANDLE');
     DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftinteger;
     DM.QrGeral.Parameters.ParamByName('HANDLE').value := nHandleDep;
     DM.QrGeral.Open;

     cFilB:='';
     if not DM.QrGeral.Fieldbyname('FILIALCUSTO').IsNull then
        cFilB:=DM.QrGeral.Fieldbyname('FILIALCUSTO').AsString;

     cRegB:='';
     if not DM.QrGeral.Fieldbyname('REGIAO').IsNull then
        cRegB:=DM.QrGeral.Fieldbyname('REGIAO').AsString;

     //Encontrar Filial e Região
     cTextoSql:=' SELECT REG.FILIAL FILIAL,REG.HANDLE REGIAO'+
                ' FROM SOCPRO.SAM_ENDERECO END,'+
                '      MUNICIPIOS MUN, '+
                '      SAM_REGIAO REG '+
                ' WHERE '+
                '     MUN.HANDLE=END.MUNICIPIO AND '+
                '     REG.HANDLE=MUN.REGIAO AND '+
                '     END.HANDLE=:HANDLE_ENDERECO ';
     LoadStringQuery(cTextoSql);
     DM.QrGeral.Parameters.ParamByName('HANDLE_ENDERECO').DataType := ftinteger;
     DM.QrGeral.Parameters.ParamByName('HANDLE_ENDERECO').value := nHandleTit;
     DM.QrGeral.Open;

     cFilR:='';
     if not DM.QrGeral.Fieldbyname('FILIAL').IsNull then
        cFilR:=DM.QrGeral.Fieldbyname('FILIAL').AsString;

     cRegR:='';
     if not DM.QrGeral.Fieldbyname('REGIAO').IsNull then
        cRegR:=DM.QrGeral.Fieldbyname('REGIAO').AsString;

     cRegistroCSC.Add(cFilB+cRegB);
     cRegistroBenner.Add(cFilR+cRegR);

     if cRegistroCSC.Text <> cRegistroBenner.Text then
     begin
       DM.Qr_UpFilialRegiao.Close;
       DM.Qr_UpFilialRegiao.SQL.Clear;
       DM.Qr_UpFilialRegiao.SQL.Add('UPDATE SAM_BENEFICIARIO');
       DM.Qr_UpFilialRegiao.SQL.Add('   SET    FILIALCUSTO=:FILIALCUSTO,');
       DM.Qr_UpFilialRegiao.SQL.Add('          REGIAO=:REGIAO,          ');
       DM.Qr_UpFilialRegiao.SQL.Add('          ENDERECOCORRESPONDENCIA=:ENDERECOCORRESPONDENCIA,');
       DM.Qr_UpFilialRegiao.SQL.Add('          ENDERECORESIDENCIAL=:ENDERECORESIDENCIAL         ');
       DM.Qr_UpFilialRegiao.SQL.Add('      WHERE HANDLE=:HANDLE                                 ');
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('FILIALCUSTO').DataType := ftInteger;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('FILIALCUSTO').value := DM.QrGeral.fieldByName('FILIAL').AsInteger;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('REGIAO').DataType := ftInteger;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('REGIAO').value := DM.QrGeral.fieldByName('REGIAO').AsInteger;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('ENDERECOCORRESPONDENCIA').DataType := ftInteger;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('ENDERECOCORRESPONDENCIA').Value := nHandleTit;

       DM.Qr_UpFilialRegiao.Parameters.ParamByName('ENDERECORESIDENCIAL').DataType := ftinteger;
       if cTitu='S' then //somente para Titulares - conforme e-mail
         DM.Qr_UpFilialRegiao.Parameters.ParamByName('ENDERECORESIDENCIAL').value := nHandleTit
       else
         DM.Qr_UpFilialRegiao.Parameters.ParamByName('ENDERECORESIDENCIAL').value := null;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('HANDLE').DataType := ftInteger;
       DM.Qr_UpFilialRegiao.Parameters.ParamByName('HANDLE').Value := nHandleDep;
       Dm.Qr_UpFilialRegiao.ExecSql;
     end;

     cRegistroCSC.Clear;
     cRegistroBenner.Clear;
   end;
 Except
   On E:Exception do
   begin
     Grava_log('2',IntToStr(nHandleTit),'E','I');
     //Alterado Willian 09-10-2012  Chamado:186482
     //RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.QrGeral.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'Filial_Regiao_Endereco');
     RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(nHandleTit)+' '+E.Message,'Filial_Regiao_Endereco');
     lInseriuBeneficiario:=false;
   end;
 end;

end;

//*******************************************************************************************
procedure TFrmBeneficiario.InsertUpdate_Beneficiario(pInsertUpdate: String);
begin
  lInseriuBeneficiario:=True;
  Try
    //*/
    //DM.DbSaude.StartTransaction;
    //SHOWMESSAGE(DM.Adoquery.Fieldbyname('HANDLE').AsString);
    //Grava_Log(1,DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
    //Contrato
    DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
    if (nHandleContrato = 2) and (DM.qrGeral.FieldByName('CONTRATO').AsInteger = 4) then
      DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').value := DM.qrGeral.FieldByName('CONTRATO').AsInteger
    else
      DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').value:=nHANDLECONTRATO;

    DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').DataType := ftString;
    if (nHandleContrato = 2) and (DM.qrGeral.FieldByName('CONTRATO').AsInteger = 4) then
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').Value := DM.qrGeral.FieldByName('BENEFICIARIO').AsString
    else
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').Value:=cMascaraBenef;

    //Código do dependente
    DM.QrBeneficiario.Parameters.ParamByName('CODIGODEPENDENTE').DataType := ftinteger;
    DM.QrBeneficiario.Parameters.ParamByName('CODIGODEPENDENTE').Value:=nCodDep;

    Dm.QrMatriculaBen.Close;
    Dm.QrMatriculaBen.SQL.Clear;
    Dm.QrMatriculaBen.SQL.Add('SELECT B.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO B');
    Dm.QrMatriculaBen.SQL.Add(' WHERE B.HANDLE = :HANDLE');
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    Dm.QrMatriculaBen.Open;

    DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').DataType := ftinteger;
    if Dm.QrMatriculaBen.IsEmpty then
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger
    else
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').Value := DM.QrMatriculaBen.Fieldbyname('MATRICULA').AsInteger;

    DM.QrBeneficiario.Parameters.ParamByName('NOME').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('NOME').Value      :=cNome;
    DM.QrBeneficiario.Parameters.ParamByName('EHTITULAR').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('EHTITULAR').Value := cTiTu;

    DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').DataType := ftstring;
    if Trim(cCivil)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').Value:=cCivil
    else
      DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').value := null;

    //Carência
    DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').Value := cCarencia;

    DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
    if Trim(cDataAdesao)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').value := StrToDateTime(cDataAdesao)
    else
      DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').value := null;

    //Data Primeira Adesão
    DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').DataType := ftDateTime;
    if Trim(cData1Adesao)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').Value := StrToDateTime(cData1Adesao)
    else
      DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
    If (Trim(cDataCancF) <> '') And (Trim(cMotCancel) <> '') then
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').value:=StrToDateTime(cDataCancF);
      CancelarHistoricoBen(cDataCancF,cMotCancel,DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
    End
    else
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').value := null;
      CancelarHistoricoBen('','',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
    End;

    //Celular
    DM.QrBeneficiario.Parameters.ParamByName('CELULAR').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('CELULAR').value := cCelular;
    //E-Mail
    DM.QrBeneficiario.Parameters.ParamByName('EMAIL').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('EMAIL').value := cMail;

    DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').DataType := ftString;
    if Trim(cMatriculaFuncional)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').Value := cMatriculaFuncional
    else
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').value := null;

    //Não faturar módulos
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARMODULOS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARMODULOS').Value := cNaoFaturarModulos;
    //Não faturar Guias
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARGUIAS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARGUIAS').Value := 'N';

    //direito a adiantamento
    DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').Value := cDireitoAdto;
    //Limite adiantemento
    DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').DataType := ftFloat;
    if Trim(cLimiteAdto)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').Value := StrToFloat(cLimiteAdto)
    else
      DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').value := null;
    //Data adoção
    DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').DataType := ftDateTime;
    if Trim(cDataAdocao)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').value := StrToDateTime(cDataAdocao)
    else
      DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').value := null;

    //Situação RH
    DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').DataType := ftInteger;
    if Trim(cSitRH)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').Value := StrToInt(cSitRH)
    else
      DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').value := null;

    //Código de Afinidade
    DM.QrBeneficiario.Parameters.ParamByName('matriculacassi').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('matriculacassi').Value := cCodAfinidade;

    DM.QrBeneficiario.Parameters.ParamByName('DIASCOMPRACARENCIA').DataType := ftinteger;
    DM.QrBeneficiario.Parameters.ParamByName('DIASCOMPRACARENCIA').Value := 0;

    DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftString;
    if nPlano in [100,101] then //Família I e II
      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').Value := 'S'
    Else
      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').Value := 'N';

    DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftString;
    if nContrato=300 then //PDE --igual a Família
      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').Value := 'S';

    DM.QrBeneficiario.Parameters.ParamByName('INFORMATIVOS').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('INFORMATIVOS').Value := 'N';

    //Beneficiario Indicador
    if Trim(cBenfIndicadorAntigo) <> '' then
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').Value:=StrToInt(cBenfIndicadorAntigo);
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').Value:=StrToInt(cBenfIndicadorAntigo);
    End
    Else
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').value := null;
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').value := null;
    End;

    //Tipo Dependente
    if Trim(cTipoDep)<>'' then
    begin
      DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').DataType := ftInteger;
      if nContrato in [110,140] then //incluído conforme solicitação Solange - 03/05/2006
        DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').Value := nCodVincFamiliaII
      else
        DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').Value := StrToInt(cTipoDep);
    end
    else
      DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
    If (Trim(cDataCancF) <> '') And (Trim(cMotCancel) <> '') then
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').value:=StrToInt(cMotCancel);
      CancelarHistoricoBen(cDataCancF,cMotCancel,DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
    End
    else
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;
      CancelarHistoricoBen('','',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
    End;

    //Não Permite Auxílio
    DM.QrBeneficiario.Parameters.ParamByName('NAOPERMITEAUXILIO').DataType := ftString;
    if (nHandleContrato in [4,2,7,6,5,30]) then //Contratos -> Associados
      DM.QrBeneficiario.Parameters.ParamByName('NAOPERMITEAUXILIO').value:='N'
    else
      DM.QrBeneficiario.Parameters.ParamByName('NAOPERMITEAUXILIO').value:='S';

    //Código da Tabela de Preço - Padrão
    DM.QrBeneficiario.Parameters.ParamByName('CODIGOTABELAPRC').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('CODIGOTABELAPRC').Value := 'P';

    DM.QrBeneficiario.Parameters.ParamByName('EMPRESA').DataType := FtInteger;
    DM.QrBeneficiario.Parameters.ParamByName('EMPRESA').value:=1;
    DM.QrBeneficiario.Parameters.ParamByName('DEMONSTRATIVOFINANCEIROINDIVID').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('DEMONSTRATIVOFINANCEIROINDIVID').value:='N';
    DM.QrBeneficiario.Parameters.ParamByName('CONVENIO').DataType := FtInteger;
    DM.QrBeneficiario.Parameters.ParamByName('CONVENIO').value:=1;

    DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').DataType := ftString;
    if (nHandleContrato in [4,2,7,6,5,30]) then //Contratos -> Associados
      DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').value:='S'
    else
      DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').value:='N';

    DM.QrBeneficiario.Parameters.ParamByName('PERMITEREEMBOLSO').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('PERMITEREEMBOLSO').value := cPermiteReembolso;

    DM.QrBeneficiario.Parameters.ParamByName('INCLUSAOPOR').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('INCLUSAOPOR').value:=78;

    if Trim(cTipoDep)<>'' then
    begin
      DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').DataType := ftInteger;
      if nContrato in [110,140] then //incluído conforme solicitação Solange - 03/05/2006
      begin                          //contrato 140 incluído no dia 11/01/2008
        if Trim(cParentesco)<> '' then
          DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').Value := StrToInt(cParentesco)
        else
          DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null;
      end
      else
        DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null;
    end
    else
      DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').DataType := ftInteger;
    if Trim(cAGENCIAGRAVADORA) <> '' then
       DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').value:=StrToInt(cAGENCIAGRAVADORA)
    else
       DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').DataType := ftDateTime;
    DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').value := null;
    DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('RECEBIMENTOINSS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('RECEBIMENTOINSS').value:='3';  //Alteração em 01/07/2009

    DM.QrBeneficiario.Parameters.ParamByName('CBO').DataType := ftInteger;
    if cCBOHandle > 0 then
      DM.QrBeneficiario.Parameters.ParamByName('CBO').value := cCBOHandle
    else
      DM.QrBeneficiario.Parameters.ParamByName('CBO').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('HANDLE').value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;

    DM.QrBeneficiario.ExecSQL;

//  DM.DbSaude.Commit;
//  sleep(5000);
  Except
     On E:Exception do
     begin
        If pInsertUpdate = 'I' Then
           Grava_Log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','I')
        Else
           Grava_Log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
        RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.Adoquery.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_BENEFICIARIO - InsertUpdate_Beneficiario');
        lInseriuBeneficiario:=false;
     end;
  end;//Try
end;

//*******************************************************************************************
//Inclusão de bloqueio primeiro pagamento para os contratos familia - 29/09/2009
procedure TFrmBeneficiario.InsertUpdate_Beneficiario_Familia;
begin
  lInseriuBeneficiario:=True;
  Try
    //*/
    //DM.DbSaude.StartTransaction;
    Dm.QrCodOcup.Close;
    Dm.QrCodOcup.SQL.Clear;
    Dm.QrCodOcup.SQL.Add('SELECT T39.CSC039WMTRBENF, T39.CSC039WNRODEPY, T39.CSC039WCODOCUP');
    Dm.QrCodOcup.SQL.Add('  FROM SOCPRO.TCSC039_DIFF T39 JOIN SOCPRO.TCSC037_DIFF T37 ON T39.CSC039WMTRBENF = T37.CSC037WMTRBENF AND T39.CSC039WNRODEPY = T37.CSC037WNRODEPY');
    Dm.QrCodOcup.SQL.Add(' WHERE T37.HANDLE = :HANDLE');
    Dm.QrCodOcup.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    Dm.QrCodOcup.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    Dm.QrCodOcup.Open;
    nCODIGOOCUPACAO := DM.QrCodOcup.Fieldbyname('CSC039WCODOCUP').AsInteger;
    //Contrato
      DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
    if (nHandleContrato = 2) and (DM.qrGeral.FieldByName('CONTRATO').AsInteger = 4) then
      DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').Value := DM.qrGeral.FieldByName('CONTRATO').AsInteger
    else
      DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').Value := nHANDLECONTRATO;

    DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').DataType := ftString;
    if (nHandleContrato = 2) and (DM.qrGeral.FieldByName('CONTRATO').AsInteger = 4) then
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').Value := DM.qrGeral.FieldByName('BENEFICIARIO').AsString
    else
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').Value:=cMascaraBenef;

    //Código do dependente
    DM.QrBeneficiario.Parameters.ParamByName('CODIGODEPENDENTE').DataType := ftstring;
    DM.QrBeneficiario.Parameters.ParamByName('CODIGODEPENDENTE').Value := nCodDep;

    Dm.QrMatriculaBen.Close;
    Dm.QrMatriculaBen.SQL.Clear;
    Dm.QrMatriculaBen.SQL.Add('SELECT B.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO B');
    Dm.QrMatriculaBen.SQL.Add(' WHERE B.HANDLE = :HANDLE');
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').DataType := ftinteger;
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    Dm.QrMatriculaBen.Open;

    DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').DataType := ftInteger;
    if Dm.QrMatriculaBen.IsEmpty then
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger
    else
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').value := DM.QrMatriculaBen.Fieldbyname('MATRICULA').AsInteger;

    //Matrícula - Nome - Ehtitular
    DM.QrBeneficiario.Parameters.ParamByName('NOME').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NOME').value      :=cNome;
    DM.QrBeneficiario.Parameters.ParamByName('EHTITULAR').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('EHTITULAR').value := cTiTu;


    DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').DataType := ftString;
    if Trim(cCivil)<>'' then
       DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').Value := cCivil
    else
       DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').value := null;

    //Carência
    DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').Value := cCarencia;

    //Data adesão
    DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
    if Trim(cDataAdesao)<>'' then
    begin
      DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').Value := StrToDateTime(cDataAdesao)
    end
    else
      DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').value := null;

    //Data Primeira Adesão
    DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').DataType := ftDateTime;
    if Trim(cData1Adesao)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').Value := StrToDateTime(cData1Adesao)
    else
      DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').value := null;

    DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDatetime;
    if (Trim(cDataCancF) <> '') And (Trim(cMotCancel) <> '') then
      DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').Value:=StrToDateTime(cDataCancF)
    Else
      DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').value := null;

    //Celular
    DM.QrBeneficiario.Parameters.ParamByName('CELULAR').DataType := ftString;
    If TRIM(cCelular) <> '' then
       DM.QrBeneficiario.Parameters.ParamByName('CELULAR').Value := cCelular
    Else
       DM.QrBeneficiario.Parameters.ParamByName('CELULAR').value := null;

    //E-Mail
    DM.QrBeneficiario.Parameters.ParamByName('EMAIL').DataType := ftString;
    if trim(cMail) <> '' then
        DM.QrBeneficiario.Parameters.ParamByName('EMAIL').Value := cMail
    else
       DM.QrBeneficiario.Parameters.ParamByName('EMAIL').value := null;

    //Matrícula Funcional
    DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').DataType := ftString;
    if Trim(cMatriculaFuncional)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').Value:=cMatriculaFuncional
    else
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').value := null;

    //Não faturar módulos
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARMODULOS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARMODULOS').Value := cNaoFaturarModulos;

    //Não faturar Guias
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARGUIAS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARGUIAS').Value := 'N';

    //direito a adiantamento
    DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').DataType := ftString;
    if cDireitoAdto <> '' then
      DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').Value := cDireitoAdto
    else
      DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').Value := null;

    //Limite adiantemento
    DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').DataType := ftFloat;
    if Trim(cLimiteAdto)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').Value := StrToFloat(cLimiteAdto)
    else
      DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').value := null;

    //Data adoção
    DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').DataType := ftDateTime;
    if Trim(cDataAdocao)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').Value :=StrToDateTime(cDataAdocao)
    else
      DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').value := null;

    //Situação RH
    DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').DataType := ftInteger;
    if Trim(cSitRH)<>'' then
      DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').Value := StrToInt(cSitRH)
    else
      DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').value := null;

    //Código de Afinidade
    DM.QrBeneficiario.Parameters.ParamByName('matriculacassi').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('matriculacassi').Value:=cCodAfinidade;

    DM.QrBeneficiario.Parameters.ParamByName('DIASCOMPRACARENCIA').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('DIASCOMPRACARENCIA').value := 0;

    DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftString;
    if nPlano in [100,101] then //Família I e II
      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := 'S'
    Else
      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := 'N';

    if nContrato=300 then //PDE --igual a Família
      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := 'S';

    DM.QrBeneficiario.Parameters.ParamByName('INFORMATIVOS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('INFORMATIVOS').value := 'N';

    //Beneficiario Indicador
    if Trim(cBenfIndicadorAntigo) <> '' then
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').Value:=StrToInt(cBenfIndicadorAntigo);
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').Value:=StrToInt(cBenfIndicadorAntigo);
    End
    Else
    Begin
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').value := null;
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').value := null;
    End;

    //Tipo Dependente
    DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').DataType := ftInteger;
    if Trim(cTipoDep)<>'' then
    begin
      if nContrato in [110,140] then //incluído conforme solicitação Solange - 03/05/2006
        DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').Value := nCodVincFamiliaII
      else
        DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').Value :=StrToInt(cTipoDep);
    end
    else
      DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').value := null;


    DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
    if (Trim(cDataCancF) <> '') And (Trim(cMotCancel) <> '') then
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value:=StrToInt(cMotCancel)
    Else
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;

    //Não Permite Auxílio
    DM.QrBeneficiario.Parameters.ParamByName('NAOPERMITEAUXILIO').DataType := ftString;
    if (nHandleContrato in [4,2,7,6,5,30]) then //Contratos -> Associados
      DM.QrBeneficiario.Parameters.ParamByName('NAOPERMITEAUXILIO').Value := 'N'
    else
      DM.QrBeneficiario.Parameters.ParamByName('NAOPERMITEAUXILIO').Value:='S';

    //Código da Tabela de Preço - Padrão
    DM.QrBeneficiario.Parameters.ParamByName('CODIGOTABELAPRC').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('CODIGOTABELAPRC').Value := 'P';

    // DM.QrBeneficiario.Parameters.ParamByName('CODIGOANTIGO').AsString:=cCartaoAntigo;  // Comentado Carlao 30/09/2005
    DM.QrBeneficiario.Parameters.ParamByName('EMPRESA').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('EMPRESA').value:=1;
    DM.QrBeneficiario.Parameters.ParamByName('DEMONSTRATIVOFINANCEIROINDIVID').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('DEMONSTRATIVOFINANCEIROINDIVID').value:='N';
    DM.QrBeneficiario.Parameters.ParamByName('CONVENIO').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('CONVENIO').value:=1;

    DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').DataType := ftString;
    if (nHandleContrato in [4,2,7,6,5,30]) then //Contratos -> Associados
      DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').Value := 'S'
    else
      DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').Value:='N';

    DM.QrBeneficiario.Parameters.ParamByName('PERMITEREEMBOLSO').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('PERMITEREEMBOLSO').Value := cPermiteReembolso;

    DM.QrBeneficiario.Parameters.ParamByName('INCLUSAOPOR').DataType := ftInteger;
    DM.QrBeneficiario.Parameters.ParamByName('INCLUSAOPOR').value:=78;

    DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').DataType := ftinteger;
    if Trim(cTipoDep)<>'' then
    begin
      if nContrato in [110,140] then //incluído conforme solicitação Solange - 03/05/2006
      begin                          //contrato 140 incluído no dia 11/01/2008
        if Trim(cParentesco)<> '' then
          DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').Value := StrToInt(cParentesco)
        else
          DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null;
       end
      else
        DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null;
    end
    else
      DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null;

    //Agencia Gravação - Alteração em 08/07/2009
    DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').DataType := ftInteger;
    if Trim(cAGENCIAGRAVADORA) <> '' then
      DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').value := StrToInt(cAGENCIAGRAVADORA)
    else
      DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').value := null;

    if nCODIGOOCUPACAO <> 831 then
    begin
      DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').DataType := ftDateTime;
      DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').Value := StrToDateTime(cDataAdesao);
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').Value := 9;
    end
    else
    begin
      DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').DataType := ftDateTime;
      DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').Value:=Null;
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').Value := null;
    end;

    //RECEBIMENTOINSS:='N';
    DM.QrBeneficiario.Parameters.ParamByName('RECEBIMENTOINSS').DataType := ftString;
    DM.QrBeneficiario.Parameters.ParamByName('RECEBIMENTOINSS').Value :='3';  //Alteração em 01/07/2009

    DM.QrBeneficiario.Parameters.ParamByName('CBO').DataType := ftInteger;
    if cCBOHandle > 0 then
      DM.QrBeneficiario.Parameters.ParamByName('CBO').value := cCBOHandle
    else
    begin
      DM.QrBeneficiario.Parameters.ParamByName('CBO').value := null;
    end;

    DM.QrBeneficiario.Parameters.ParamByName('HANDLE').DataType := ftinteger;
    DM.QrBeneficiario.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;

    DM.QrBeneficiario.ExecSQL;
//  DM.DbSaude.Commit;
//  sleep(5000);
  Except
     On E:Exception do
     begin
        Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','I');
        RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.Adoquery.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_BENEFICIARIO - InsertUpdate_Beneficiario_Familia');
        lInseriuBeneficiario:=false;
     end;
  end;//Try
end;

//*******************************************************************************************
//Correção para bloqueio de update nos dados oriundos da internet - 12/11/2008
procedure TFrmBeneficiario.Update_Beneficiario_Internet;
begin
  lInseriuBeneficiario:=True;
  Try
    if (nHandleContrato = 7) and ( DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger in [61,62,63])then
      RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.Adoquery.Fieldbyname('HANDLE').AsInteger)+' '+ 'Beneficiário não alterado pois é DI e com motivo de cancelamento 61,62 ou 63.','INCLUSAO/ALTERAÇAO SAM_BENEFICIARIO')
    else
    begin
      //Contrato
      DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
      if (nHandleContrato = 2) and (DM.qrGeral.FieldByName('CONTRATO').AsInteger = 4) then
        DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').Value := DM.qrGeral.FieldByName('CONTRATO').AsInteger
      else
        DM.QrBeneficiario.Parameters.ParamByName('CONTRATO').Value := nHANDLECONTRATO;

      DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
      if (nHandleContrato = 2) and (DM.qrGeral.FieldByName('CONTRATO').AsInteger = 4) then
        DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').value := DM.qrGeral.FieldByName('BENEFICIARIO').AsString
      else
        DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIO').value := cMascaraBenef;

      //Código do dependente
      DM.QrBeneficiario.Parameters.ParamByName('CODIGODEPENDENTE').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('CODIGODEPENDENTE').value := nCodDep;

      Dm.QrMatriculaBen.Close;
      Dm.QrMatriculaBen.SQL.Clear;
      Dm.QrMatriculaBen.SQL.Add('SELECT B.MATRICULA');
      Dm.QrMatriculaBen.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO B');
      Dm.QrMatriculaBen.SQL.Add(' WHERE B.HANDLE = :HANDLE');
      Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').DataType := ftInteger;
      Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
      Dm.QrMatriculaBen.Open;

      DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').DataType := ftInteger;
      if Dm.QrMatriculaBen.IsEmpty then
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger
      else
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULA').Value := DM.QrMatriculaBen.Fieldbyname('MATRICULA').AsInteger;

      DM.QrBeneficiario.Parameters.ParamByName('NOME').DataType := ftstring;
      DM.QrBeneficiario.Parameters.ParamByName('NOME').Value := DM.qrGeral.FieldByName('NOME').AsString;

      //Matrícula - Nome - Ehtitular
      DM.QrBeneficiario.Parameters.ParamByName('EHTITULAR').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('EHTITULAR').value := cTiTu;

      DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').DataType := ftInteger;
      if DM.qrGeral.FieldByName('ESTADOCIVIL').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('ESTADOCIVIL').value := DM.qrGeral.FieldByName('ESTADOCIVIL').AsInteger;

      DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').DataType := ftString;
      if DM.qrGeral.FieldByName('NAOTEMCARENCIA').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('NAOTEMCARENCIA').value := DM.qrGeral.FieldByName('NAOTEMCARENCIA').AsString;

      //Data adesão
      DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
      if Trim(cDataAdesao)<>'' then
        DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').value := StrToDateTime(cDataAdesao)
      else
        DM.QrBeneficiario.Parameters.ParamByName('DATAADESAO').value := null;

      //Data Primeira Adesão
      DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').DataType := ftDateTime;
      if Trim(cData1Adesao)<>'' then
        DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').value := StrToDateTime(cData1Adesao)
      else
        DM.QrBeneficiario.Parameters.ParamByName('DATAPRIMEIRAADESAO').value := null;

      DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
      If (Trim(cDataCancF) <> '') And (Trim(cMotCancel) <> '') then
      Begin
        DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').Value := StrToDateTime(cDataCancF);
        CancelarHistoricoBen(cDataCancF,cMotCancel,DM.Adoquery.Fieldbyname('HANDLE').AsInteger)
      End
      else
      Begin
        DM.QrBeneficiario.Parameters.ParamByName('DATACANCELAMENTO').value := null;
        CancelarHistoricoBen('','',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
      End;

      DM.QrBeneficiario.Parameters.ParamByName('CELULAR').DataType := ftString;
      if DM.qrGeral.FieldByName('CELULAR').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('CELULAR').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('CELULAR').value := DM.qrGeral.FieldByName('CELULAR').AsString;

      DM.QrBeneficiario.Parameters.ParamByName('EMAIL').DataType := ftString;
      if DM.qrGeral.FieldByName('EMAIL').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('EMAIL').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('EMAIL').value := DM.qrGeral.FieldByName('EMAIL').AsString;

      //Matrícula Funcional
      DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').DataType := ftString;
      if Trim(cMatriculaFuncional)<>'' then
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').value := cMatriculaFuncional
      else
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULAFUNCIONAL').value := null;

      //Não faturar módulos
      DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARMODULOS').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARMODULOS').Value := cNaoFaturarModulos;
      //Não faturar Guias
      DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARGUIAS').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('NAOFATURARGUIAS').Value := 'N';

      //direito a adiantamento
      DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('DIREITOAADIANTAMENTO').Value := cDireitoAdto;
      //Limite adiantemento
      DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').DataType := ftFloat;
      if Trim(cLimiteAdto)<>'' then
        DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').Value :=StrToFloat(cLimiteAdto)
      else
        DM.QrBeneficiario.Parameters.ParamByName('LIMITEADIANTAMENTO').value := null;

      //Data adoção
      DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').DataType := ftDatetime;
      if Trim(cDataAdocao)<>'' then
        DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').value:=StrToDateTime(cDataAdocao)
      else
        DM.QrBeneficiario.Parameters.ParamByName('DATAADOCAO').value := null;

      //Situação RH
      DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').DataType := ftInteger;
      if Trim(cSitRH)<>'' then
        DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').value := StrToInt(cSitRH)
      else
        DM.QrBeneficiario.Parameters.ParamByName('SITUACAORH').value := null;

      //Código de Afinidade
      DM.QrBeneficiario.Parameters.ParamByName('matriculacassi').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('matriculacassi').value := cCodAfinidade;

      DM.QrBeneficiario.Parameters.ParamByName('DIASCOMPRACARENCIA').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('DIASCOMPRACARENCIA').value := 0;

      DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').DataType := ftString;
      if nPlano in [100,101] then //Família I e II
        DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := 'S'
      Else
        DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := 'N';

      if nContrato=300 then //PDE --igual a Família
        DM.QrBeneficiario.Parameters.ParamByName('CARTAOIDENTIFICACAO').value := 'S';

      DM.QrBeneficiario.Parameters.ParamByName('INFORMATIVOS').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('INFORMATIVOS').value:='N';

      //Beneficiario Indicador
      if Trim(cBenfIndicadorAntigo) <> '' then
      Begin
        DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').DataType := ftInteger;
        DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').Value:=StrToInt(cBenfIndicadorAntigo);
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').DataType := ftInteger;
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').Value:=StrToInt(cBenfIndicadorAntigo);
      End
      else
      Begin
        DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').DataType := ftInteger;
        DM.QrBeneficiario.Parameters.ParamByName('BENEFICIARIOINDICADOR').value := null;
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').DataType := ftInteger;
        DM.QrBeneficiario.Parameters.ParamByName('MATRICULAINDICADORA').value := null;
      End;

      DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').DataType := ftInteger;
      if DM.qrGeral.FieldByName('TIPODEPENDENTE').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('TIPODEPENDENTE').value := DM.qrGeral.FieldByName('TIPODEPENDENTE').AsInteger;

      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
      If (Trim(cDataCancF) <> '') And (Trim(cMotCancel) <> '') then
      Begin
        DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := StrToInt(cMotCancel);
        CancelarHistoricoBen(cDataCancF,cMotCancel,DM.Adoquery.Fieldbyname('HANDLE').AsInteger)
      End
      else
      Begin
        DM.QrBeneficiario.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;
        CancelarHistoricoBen('','',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
      End;

      //Código da Tabela de Preço - Padrão
      DM.QrBeneficiario.Parameters.ParamByName('CODIGOTABELAPRC').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('CODIGOTABELAPRC').value := 'P';

      DM.QrBeneficiario.Parameters.ParamByName('EMPRESA').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('EMPRESA').value:=1;
      DM.QrBeneficiario.Parameters.ParamByName('DEMONSTRATIVOFINANCEIROINDIVID').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('DEMONSTRATIVOFINANCEIROINDIVID').value:='N';
      DM.QrBeneficiario.Parameters.ParamByName('CONVENIO').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('CONVENIO').value:=1;

      DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').DataType := ftstring;
      if (nHandleContrato in [4,2,7,6,5,30]) then //Contratos -> Associados
        DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').value:='S'
      else
        DM.QrBeneficiario.Parameters.ParamByName('PERMITEADIANTAMENTO').value:='N';

      DM.QrBeneficiario.Parameters.ParamByName('PERMITEREEMBOLSO').DataType := ftstring;
      DM.QrBeneficiario.Parameters.ParamByName('PERMITEREEMBOLSO').value := cPermiteReembolso;
      DM.QrBeneficiario.Parameters.ParamByName('INCLUSAOPOR').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('INCLUSAOPOR').value:=78;

      DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').DataType := ftInteger;
      if DM.qrGeral.FieldByName('PARENTESCO').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('PARENTESCO').value := DM.qrGeral.FieldByName('PARENTESCO').AsInteger;

      //Agencia Gravação - Alteração em 08/07/2009
      DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').DataType := ftInteger;
      if Trim(cAGENCIAGRAVADORA) <> '' then
        DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').value := StrToInt(cAGENCIAGRAVADORA)
      else
        DM.QrBeneficiario.Parameters.ParamByName('AGENCIAINCLUSAO').value := null;

      DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').DataType := ftDateTime;
      if DM.qrGeral.FieldByName('DATABLOQUEIO').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('DATABLOQUEIO').value := DM.qrGeral.FieldByName('DATABLOQUEIO').AsDateTime;

      DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').DataType := ftDateTime;
      if DM.qrGeral.FieldByName('MOTIVOBLOQUEIO').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('MOTIVOBLOQUEIO').value := DM.qrGeral.FieldByName('MOTIVOBLOQUEIO').AsDateTime;

      DM.QrBeneficiario.Parameters.ParamByName('RECEBIMENTOINSS').DataType := ftString;
      DM.QrBeneficiario.Parameters.ParamByName('RECEBIMENTOINSS').Value := DM.Adoquery.Fieldbyname('RECEBIMENTOINSS').AsInteger;

      DM.QrBeneficiario.Parameters.ParamByName('CBO').DataType := ftInteger;
      if DM.qrGeral.FieldByName('CBO').IsNull then
        DM.QrBeneficiario.Parameters.ParamByName('CBO').value := null
      else
        DM.QrBeneficiario.Parameters.ParamByName('CBO').value := DM.qrGeral.FieldByName('CBO').AsInteger;

      DM.QrBeneficiario.Parameters.ParamByName('HANDLE').DataType := ftInteger;
      DM.QrBeneficiario.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;

      DM.QrBeneficiario.ExecSQL;
  //  DM.DbSaude.Commit;
  //  sleep(5000);
    end;
  Except
     On E:Exception do
     begin
        Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','I');
        RegistraLog(nNrImport,'Numero HANDLE-Benef TCSC037:' + Inttostr(DM.Adoquery.Fieldbyname('HANDLE').AsInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_BENEFICIARIO - Update_Beneficiario_Internet');
        lInseriuBeneficiario:=false;
     end;
  end;//Try
end;

//************************************************MATRÍCULA**********************************
procedure TFrmBeneficiario.InsertUpdate_Matricula;
//var cData:string;
var dataaux:TDatetime;dataaux2:String;
begin
    //Insert e UPDATE SOCPRO.SAM_Matrícula
    DM.QrMatricula.Parameters.Items[0].DataType:=ftinteger;//Atribuir os tipos dos dados
    DM.QrMatricula.Parameters.Items[1].DataType:=ftString;
    DM.QrMatricula.Parameters.Items[2].DataType:=ftString;
    DM.QrMatricula.Parameters.Items[3].DataType:=ftString;
    DM.QrMatricula.Parameters.Items[4].DataType:=ftDateTime;
    DM.QrMatricula.Parameters.Items[5].DataType:=ftDateTime;
    DM.QrMatricula.Parameters.items[6].datatype:=ftstring;
    DM.QrMatricula.Parameters.Items[7].DataType:=ftInteger;
  TRY
    Dm.QrMatriculaBen.Close;
    Dm.QrMatriculaBen.SQL.Clear;
    Dm.QrMatriculaBen.SQL.Add('SELECT M.HANDLE,');
    Dm.QrMatriculaBen.SQL.Add('       M.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO B');
    Dm.QrMatriculaBen.SQL.Add('  JOIN SOCPRO.SAM_MATRICULA M ON M.HANDLE = B.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('    WHERE B.HANDLE = :HANDLE');
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    Dm.QrMatriculaBen.Open;

    DM.QrMatricula.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    DM.QrMatricula.Parameters.ParamByName('MATRICULA').DataType := ftInteger;
    if Dm.QrMatriculaBen.IsEmpty then
    begin
      DM.QrMatricula.Parameters.ParamByName('HANDLE').value   :=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
      DM.QrMatricula.Parameters.ParamByName('MATRICULA').value:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    end
    else
    begin
      DM.QrMatricula.Parameters.ParamByName('HANDLE').value   :=DM.QrMatriculaBen.Fieldbyname('HANDLE').AsInteger;
      DM.QrMatricula.Parameters.ParamByName('MATRICULA').value:=DM.QrMatriculaBen.Fieldbyname('MATRICULA').AsInteger;
    end;

    DM.QrMatricula.Parameters.ParamByName('NOME').DataType := ftString;
    DM.QrMatricula.Parameters.ParamByName('NOME').value :=cNome;

    DM.QrMatricula.Parameters.ParamByName('SEXO').DataType := ftString;
    If Trim(cSexo)<>'' then
      DM.QrMatricula.Parameters.ParamByName('SEXO').value   :=cSexo
    else
      DM.QrMatricula.Parameters.ParamByName('SEXO').value := null;

    DM.QrMatricula.Parameters.ParamByName('CPF').DataType := ftString;
    if Trim(cCpf)<>'' then
      DM.QrMatricula.Parameters.ParamByName('CPF').value := cCpf
    else
      DM.QrMatricula.Parameters.ParamByName('CPF').value := null;

    DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').DataType := ftDateTime;
    if Trim(cDataNasc) <> '' then
      DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').value:=StrToDateTime(cDataNasc)
    else
      DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').value := null;

    DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').DataType := ftDateTime;
    if Trim(cDataCad)<>'' then
      DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').Value := StrToDateTime(cDataCad)
    else
      DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').value := null;
    //ALTERADO 01/10/03
    DM.Qrmatricula.Parameters.ParamByName('NOMEMAE').DataType := ftString;
    if length(trim(cNomeMae)) > 0 then
      DM.Qrmatricula.Parameters.ParamByName('NOMEMAE').value :=cNomeMae
    else
      DM.Qrmatricula.Parameters.ParamByName('NOMEMAE').value := null;

    DM.QrMatricula.ExecSql;
  EXCEPT
    On E:Exception do
    begin
       Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'M','I');
       RegistraLog(nNrImport,'HANDLE TCSC037:'+IntToStr(DM.Adoquery.Fieldbyname('HANDLE').asInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_MATRICULA') ;
       nEM:=nEM + 1;
       SGGrade.Cells[2,3]:=IntToStr(nEM);
       SGGrade.Refresh;
    end;
  END;

end;

//**********************************************************************************************************************************************

//Correção para bloqueio de update nos dados oriundos da internet - 12/11/2008
procedure TFrmBeneficiario.Update_Matricula_Internet;
//var cData:string;
begin
    //UPDATE SOCPRO.SAM_Matrícula Internet
  TRY
    Dm.QrMatriculaBen.Close;
    Dm.QrMatriculaBen.SQL.Clear;
    Dm.QrMatriculaBen.SQL.Add('SELECT M.HANDLE,');
    Dm.QrMatriculaBen.SQL.Add('       M.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO B');
    Dm.QrMatriculaBen.SQL.Add('  JOIN SOCPRO.SAM_MATRICULA M ON M.HANDLE = B.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('    WHERE B.HANDLE = :HANDLE');
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    Dm.QrMatriculaBen.Open;

    DM.QrMatricula.Parameters.ParamByName('MATRICULA').DataType := ftInteger;
    if Dm.QrMatriculaBen.IsEmpty then
      DM.QrMatricula.Parameters.ParamByName('MATRICULA').Value:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger
    else
      DM.QrMatricula.Parameters.ParamByName('MATRICULA').Value:=DM.QrMatriculaBen.Fieldbyname('MATRICULA').AsInteger;

    {if Trim(cDataNasc) <> '' then // Atualizado 20/03/2009
       DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').AsDateTime:=StrToDateTime(cDataNasc)
    else
       DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').value := null; }
    DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').DataType := ftDateTime;
    if Trim(cDataCad) <> '' then
      DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').value := StrToDateTime(cDataCad)
    else
      DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').value := null;
    {if Trim(cSexo) <> '' then // Atualizado 20/03/2009
       DM.QrMatricula.Parameters.ParamByName('SEXO').AsString   :=cSexo
    else
       DM.QrMatricula.Parameters.ParamByName('SEXO').value := null;  }

    DM.QrMatricula.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    if Dm.QrMatriculaBen.IsEmpty then
      DM.QrMatricula.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger
    else
      DM.QrMatricula.Parameters.ParamByName('HANDLE').Value   :=DM.QrMatriculaBen.Fieldbyname('HANDLE').AsInteger;

    DM.QrMatricula.ExecSql;
  EXCEPT
    On E:Exception do
    begin
       Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'M','I');
       RegistraLog(nNrImport,'HANDLE TCSC037:'+IntToStr(DM.Adoquery.Fieldbyname('HANDLE').asInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_MATRICULA') ;
       nEM:=nEM + 1;
       SGGrade.Cells[2,3]:=IntToStr(nEM);
       SGGrade.Refresh;
    end;
  END;

end;

//**********************************************************************************************************************************************

//Correção para bloqueio de update no CPF para Associados Titular - 12/01/2009
procedure TFrmBeneficiario.Update_Matricula_CPF;
//var cData:string;
begin
  TRY
    Dm.QrMatriculaBen.Close;
    Dm.QrMatriculaBen.SQL.Clear;
    Dm.QrMatriculaBen.SQL.Add('SELECT M.HANDLE,');
    Dm.QrMatriculaBen.SQL.Add('       M.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO B');
    Dm.QrMatriculaBen.SQL.Add('  JOIN SOCPRO.SAM_MATRICULA M ON M.HANDLE = B.MATRICULA');
    Dm.QrMatriculaBen.SQL.Add('    WHERE B.HANDLE = :HANDLE');
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    Dm.QrMatriculaBen.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
    Dm.QrMatriculaBen.Open;

    DM.QrMatricula.Parameters.ParamByName('MATRICULA').DataType := ftInteger;
    if Dm.QrMatriculaBen.IsEmpty then
      DM.QrMatricula.Parameters.ParamByName('MATRICULA').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger
    else
      DM.QrMatricula.Parameters.ParamByName('MATRICULA').Value:=DM.QrMatriculaBen.Fieldbyname('MATRICULA').AsInteger;

    {if Trim(cDataNasc) <> '' then // Atualizado 20/03/2009
       DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').AsDateTime:=StrToDateTime(cDataNasc)
    else
       DM.QrMatricula.Parameters.ParamByName('DATANASCIMENTO').value := null;  }
    DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').DataType := ftDateTime;
    if Trim(cDataCad)<>'' then
       DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').Value:=StrToDateTime(cDataCad)
    else
       DM.QrMatricula.Parameters.ParamByName('DATAINGRESSO').value := null;

    DM.QrMatricula.Parameters.ParamByName('CPF').DataType := ftstring;
    if Trim(cCpf)<>'' then
       DM.QrMatricula.Parameters.ParamByName('CPF').Value:=cCpf
    else
       DM.QrMatricula.Parameters.ParamByName('CPF').value := null;

    DM.QrMatricula.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    DM.QrMatricula.Parameters.ParamByName('MATRICULA').DataType := ftInteger;

    if Dm.QrMatriculaBen.IsEmpty then
      DM.QrMatricula.Parameters.ParamByName('HANDLE').Value   := DM.Adoquery.Fieldbyname('HANDLE').AsInteger
    else
      DM.QrMatricula.Parameters.ParamByName('HANDLE').Value   :=DM.QrMatriculaBen.Fieldbyname('HANDLE').AsInteger;

    DM.QrMatricula.ExecSql;
  EXCEPT
    On E:Exception do
    begin
       Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'M','I');
       RegistraLog(nNrImport,'HANDLE TCSC037:'+IntToStr(DM.Adoquery.Fieldbyname('HANDLE').asInteger)+' '+E.Message,'INCLUSAO/ALTERAÇAO SAM_MATRICULA ASSOCIADO TITULAR') ;
       nEM:=nEM + 1;
       SGGrade.Cells[2,3]:=IntToStr(nEM);
       SGGrade.Refresh;
    end;
  END;

end;

//**********************************************************************************************************************************************

Function TFrmBeneficiario.Validou_Funci_Cassi(cBenef:string):boolean;
begin
   Result:=true;
   if nPlano=110 then //validar se o registro existe na classe SAP para os funcionários Func CASSI
   begin
{      LoadStringQuery('SELECT MATRFUNC,MATRDEP '+
                      '  FROM MIGFUNCITITULAR '+
                      ' WHERE MATRDEP=:MATRDEP');
      DM.QrGeral.Parameters.ParamByName('MATRDEP').AsInteger:=StrToInt(Trim(cBenef));
      DM.QrGeral.open;
      if (DM.QrGeral.Fieldbyname('MATRFUNC').IsNull) OR
         (DM.QrGeral.Fieldbyname('MATRDEP').IsNull) Then
          Result:=false;                                }
      if not BeneficiarioClass.FindBeneficiario(StrToInt(Trim(cBenef)),BeneficiarioObj) then
         Result:=false;
   end;
end;

//**********************************************************************************************************************************************

Procedure TFrmBeneficiario.Preparar_Campos_Registro;
{Prepara todos os campos para Inserção/Atualização e Balance-Line
 Todas as regras para um determinado campo são tratadas neste processo.
 Qualquer alteração na regra de um campo deverá ser modificada nesta procedure}
var cFamiliaAux,comando,cAno,cMEs,cDia,cEstadoCiv:string;
    nLotacaoMigFunc,nSuspensao,nIndiSitu:integer;
    nAno,nMes,nDia:word;
begin
   //Nome da Mãe - C
   cNomeMae:='';
   if length(trim(DM.Adoquery.Fieldbyname('CSC037WNOMREDZ').AsString)) > 0 then
      cNomeMae:=trim(DM.Adoquery.Fieldbyname('CSC037WNOMREDZ').AsString);

   //Nome - C
   cNome:='';
   cNome:=TRIM(DM.Adoquery.Fieldbyname('CSC037WNOMBENF').AsString);

   //Sexo - C
   cSexo:='';
   cSexo:=DM.Adoquery.Fieldbyname('CSC037WINDSEXO').AsString;

   //Novo depara dos vínculos
   nSexoVinculo:=0;//Masculino
   if cSexo='F' then
      nSexoVinculo:=1;//Feminino

   //AGENCIA GRAVADORA - C   Alteração em 08/07/2009
   cAGENCIAGRAVADORA:='';
   cAgenciaCSC:='';
   If (nhandleContrato in [23,24,25,37,40,43]) then
    begin
      LoadStringQuery('SELECT substr(csc039wprfdepeuser,1,4) AGENCIA FROM SOCPRO.TCSC039 WHERE CSC039WMTRBENF=:BENF AND CSC039WNRODEPY=:DEP');
      DM.QrGeral.Parameters.ParamByName('BENF').DataType := ftstring;
      DM.QrGeral.Parameters.ParamByName('BENF').Value :=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
      DM.QrGeral.Parameters.ParamByName('DEP').DataType := ftInteger;
      DM.QrGeral.Parameters.ParamByName('DEP').Value :=DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger;
      DM.QrGeral.Open;
      cAgenciaCSC:=DM.QrGeral.fieldbyName('AGENCIA').AsString;
    end;
   If Trim(cAgenciaCSC) <> '' then
    begin
      LoadStringQuery('SELECT HANDLE FROM SOCPRO.SFN_AGENCIA WHERE AGENCIA=:AGENCIA');
      DM.QrGeral.Parameters.ParamByName('AGENCIA').DataType := ftstring;
      DM.QrGeral.Parameters.ParamByName('AGENCIA').Value :=cAgenciaCSC;
      DM.QrGeral.Open;
      cAGENCIAGRAVADORA:=DM.QrGeral.fieldbyName('HANDLE').AsString;
    end
   else
    begin
     cAGENCIAGRAVADORA:='';
    end;

   //CPF - C
   cCpf:='';
   With DM.QrSaudePro do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT CSC039WNROCPFY,CSC039WDIGCPFY '+
              '  FROM SOCPRO.TCSC039_DIFF '+
              ' WHERE CSC039WNROCPFY BETWEEN 1 AND 999999999 AND '+ //validar o cpf
              '       CSC039WMTRBENF =:Benef and '+
              '       CSC039WNRODEPY =:Dep ');
      Parameters.ParamByName('Benef').DataType := ftstring;
      Parameters.ParamByName('Benef').Value:=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
      Parameters.ParamByName('dep').DataType := ftInteger;
      Parameters.ParamByName('dep').Value :=DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger;
      open;
      If not DM.QrSaudePro.fieldbyName('CSC039WNROCPFY').IsNull then
         cCpf:=RepeatChar(9-Length(Trim(DM.QrSaudePro.fieldbyName('CSC039WNROCPFY').AsString)),'0')+
                                   Trim(DM.QrSaudePro.fieldbyName('CSC039WNROCPFY').AsString)+
                                   RepeatChar(2-Length(Trim(DM.QrSaudePro.fieldbyName('CSC039WDIGCPFY').AsString)),'0')+
                                   Trim(DM.QrSaudePro.fieldbyName('CSC039WDIGCPFY').AsString);
   end;

   //Data Nasc. - C
   cDataNasc:='';
   if Trim(DM.Adoquery.Fieldbyname('CSC037WDMANASC').AsString)<>'' then
   begin
      nAno:=YearOf(DM.Adoquery.Fieldbyname('CSC037WDMANASC').value);
      nMes:=MonthOfTheYear(DM.Adoquery.Fieldbyname('CSC037WDMANASC').value);
      ndia:=dayOf(DM.Adoquery.Fieldbyname('CSC037WDMANASC').value);
      if ((nAno > 1800) and (nAno <= YearOf(now))) then
        if (nMes in [1..12]) then
          if (ndia in [1..31]) then
             cDataNasc:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.Adoquery.Fieldbyname('CSC037WDMANASC').value)
   end
   else if DM.Adoquery.Fieldbyname('CSC037WDMANASC').IsNull then //CONFORME E-MAIL CLÁUDIO MÁRCIO
           If DM.Adoquery.Fieldbyname('CSC037WINDSITY').value <> 0 then //excluído
             cDataNasc:='01/01/190100:00:00';

   //implementado conforme solicitação do leonardo - email solange dia 04/05/06
   if nContrato=110 then
   begin
       nCodVincFamiliaII:=264;//Titular Maior
       if ((now - StrToDateTime(cDataNasc))/365) < 18 then
          nCodVincFamiliaII:=397;//Titular Menor com CPF do Responsável
   end
   else if nContrato=140 then //implementado dia 11/01/08 - Família III
   begin
       nCodVincFamiliaII:=288;//Titular Maior
       if ((now - StrToDateTime(cDataNasc))/365) < 18 then
          nCodVincFamiliaII:=420;//Titular Menor com CPF do Responsável
   end;

   //Data Cad - C
   cDataCad:='';
   if not DM.Adoquery.Fieldbyname('CSC037WDMACADY').IsNull then
   begin
      if Trim(DM.Adoquery.Fieldbyname('CSC037WDMACADY').AsString) <> '' then
      begin
         nAno:=YearOf(DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
         nMes:=MonthOfTheYear(DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
         ndia:=dayOf(DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
         if ((nAno > 1800) and (nAno <= YearOf(now))) then
           if (nMes in [1..12]) then
              if (ndia in [1..31]) then
                 cDataCad:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
      end;
   end
   else //CONFORME E-MAIL CLÁUDIO MÁRCIO
       if DM.Adoquery.Fieldbyname('CSC037WINDSITY').value <> 0 then //Excluído
          cDataCad:='01/01/190100:00:00';
   //Código do dependente - C
   if (nPlano = 0) or (nPlano = 1) then
      nCodDep:=DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger
   else if nPlano <> 110 then
      nCodDep:=0;
{   else if nPlano  = 110 then
   begin
     if cTitu='S' then
     begin
         Comando :='SELECT DEP '+
                   '  FROM MIGFUNCITITULAR '+
                   '  WHERE MATRDEP=:MTRBENF';
         LoadStringQuery(Comando);
         DM.QrGeral.Parameters.ParamByName('MTRBENF').AsInteger:=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsInteger;
         DM.QrGeral.Open;
         nCodDep:=DM.QrGeral.FieldByname('DEP').AsInteger;
     end
   end
   else
     nCodDep:=0;}

   //Titular - C
   cMatriculaFuncional:='';
   cTipoDep:='';
   cFamiliaTit:='';
   cBenfIndicadorAntigo:='';
   cHandleFamilia:='';

   DM.qAuxFam.Close;
   DM.qAuxFam.Sql.Clear;
   DM.qAuxFam.Sql.Add('SELECT F.HANDLE');
   DM.qAuxFam.Sql.Add('  FROM SOCPRO.SAM_FAMILIA F ');
   DM.qAuxFam.Sql.Add('  JOIN SOCPRO.SAM_BENEFICIARIO B ON B.FAMILIA = F.HANDLE');
   DM.qAuxFam.Sql.Add(' WHERE B.HANDLE = :HANDLEBENEF');
   DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').DataType := ftinteger;
   DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
   DM.qAuxFam.Open;

   if nPlano <> 110 then
   begin
      if nPlano <> 1 then //<> Dep.Indiretos
      begin
         if (DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger)=
            (DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger) then
         begin
           cTiTu:='S';

           if DM.qAuxFam.Fieldbyname('HANDLE').AsInteger > 0 then
             cHandleFamilia:=DM.qAuxFam.Fieldbyname('HANDLE').AsString
           else
             cHandleFamilia := DM.Adoquery.Fieldbyname('HANDLE').AsString;

           cFamiliaAux:=Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString);
         end
         else
         begin
           cTiTu:='N';
            //Procura o Handle do Titular
           LoadStringQuery('SELECT HANDLE,CSC037WMTRBENF FROM SOCPRO.TCSC037 WHERE CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY');
           DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftstring;
           DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').Value :=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
           DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftinteger;
           DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').Value:=DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger;
           DM.QrGeral.Open;
           cFamiliaAux:=Trim(DM.QrGeral.Fields.FieldByname('CSC037WMTRBENF').AsString);

           DM.qAuxFam.Close;
           DM.qAuxFam.Sql.Clear;
           DM.qAuxFam.Sql.Add('SELECT F.HANDLE');
           DM.qAuxFam.Sql.Add('  FROM SOCPRO.SAM_FAMILIA F ');
           DM.qAuxFam.Sql.Add('  JOIN SOCPRO.SAM_BENEFICIARIO B ON B.FAMILIA = F.HANDLE');
           DM.qAuxFam.Sql.Add(' WHERE B.HANDLE = :HANDLEBENEF');
           DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').DataType := ftinteger;
           DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').Value := DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
           DM.qAuxFam.Open;

           if DM.qAuxFam.Fieldbyname('HANDLE').AsInteger > 0 then
           begin
             cHandleFamilia:=DM.qAuxFam.fieldbyName('HANDLE').AsString;
             nHandleFamilia:=DM.qAuxFam.fieldbyName('HANDLE').AsInteger;
           end
           else
           begin
             cHandleFamilia:=DM.QrGeral.fieldbyName('HANDLE').AsString;
             nHandleFamilia:=DM.QrGeral.fieldbyName('HANDLE').AsInteger;
           end;
         end;
      end
      else //=dep.indiretos
      begin
         cTiTu:='S';

         if DM.qAuxFam.Fieldbyname('HANDLE').AsInteger > 0 then
           cHandleFamilia:=DM.qAuxFam.Fieldbyname('HANDLE').AsString
         else
           cHandleFamilia:=DM.Adoquery.Fieldbyname('HANDLE').AsString;

         cFamiliaAux:=Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                      Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString);//matrícula+dep
         //Encontrar Beneficiário Indicador - pode ser um Aposentado,Associados ou Pensionista
         LoadStringQuery('SELECT HANDLE,CSC037WMTRBENF FROM SOCPRO.TCSC037 WHERE CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY');
         DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftstring;
         DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').Value :=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
         DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftinteger;
         DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').Value := DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger;
         DM.QrGeral.Open;
         cBenfIndicadorAntigo:=DM.QrGeral.FieldByname('HANDLE').AsString;
      end;
   end
   else  //Func.Cassi
   begin
      //utilização da classe criada pelo Márcio
      cMatriculaFuncional:='';
      if BeneficiarioClass.FindBeneficiario(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsInteger, BeneficiarioObj) then
      begin
         if BeneficiarioObj.Titular then
         begin
           cTitu:='S';
           cTipoDep:=IntToStr(beneficiarioObj.SAM_CONTRATO_TPDEP);
           //cTipoDep:='33';//Tipo do Dependente ref. ao Titular

           if DM.qAuxFam.Fieldbyname('HANDLE').AsInteger > 0 then
             cHandleFamilia:=DM.qAuxFam.Fieldbyname('HANDLE').AsString
           else
             cHandleFamilia:=DM.Adoquery.Fieldbyname('HANDLE').AsString;

           cFamiliaAux   :=Trim(IntToStr(beneficiarioObj.MatriculaCSCTitular));
           nLotacaoMigFunc:=999;//DM.QrSaudePro1.FieldByName('LOTACAO').value;
           nCodDep:=RetornaDepFunciCassi(cTitu,cFamiliaAux);
         end
         else
         begin
           cTitu:='N';
           //Tipo do Dependente
           //Classe alterada - basta apenas pegar o campo sam_contrato_tpdep da classe
           cTipoDep:=IntToStr(BeneficiarioObj.SAM_CONTRATO_TPDEP);
           {if beneficiarioObj.Filho then
               cTipoDep:='34' //Handle Filho(a) - sam_contrato_tpdep
           else if beneficiarioObj.Conjuge then
               cTipoDep:='37'; //Handle Cônjuge - sam_contrato_tpdep}
           //else if beneficiarioObj.companheira then
           //    cTipoDep:='38'; //Handle Companheiro(a) - sam_contrato_tpdep
           //Procura o Handle do Titular
           LoadStringQuery('SELECT HANDLE,CSC037WMTRBENF FROM SOCPRO.TCSC037 WHERE CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY');
           DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftstring;
           DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').Value :=IntToStr(BeneficiarioObj.MatriculaCSCTitular);
           DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftinteger;
           DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').Value :=80;//Padrão NA TCSC037 -> Func.Cassi
           DM.QrGeral.Open;

           DM.qAuxFam.Close;
           DM.qAuxFam.Sql.Clear;
           DM.qAuxFam.Sql.Add('SELECT F.HANDLE');
           DM.qAuxFam.Sql.Add('  FROM SOCPRO.SAM_FAMILIA F ');
           DM.qAuxFam.Sql.Add('  JOIN SOCPRO.SAM_BENEFICIARIO B ON B.FAMILIA = F.HANDLE');
           DM.qAuxFam.Sql.Add(' WHERE B.HANDLE = :HANDLEBENEF');
           DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').DataType := ftinteger;
           DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').Value := DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
           DM.qAuxFam.Open;

           if DM.qAuxFam.fieldbyName('HANDLE').AsInteger > 0 then
           begin
             cHandleFamilia:=DM.qAuxFam.FieldbyName('HANDLE').AsString;
             nHandleFamilia:=DM.qAuxFam.fieldbyName('HANDLE').AsInteger;
           end
           else
           begin
             cHandleFamilia:=DM.QrGeral.FieldbyName('HANDLE').AsString;
             nHandleFamilia:=DM.QrGeral.fieldbyName('HANDLE').AsInteger;
           end;

           cFamiliaTit   :=IntToStr(BeneficiarioObj.matriculaCSCTitular);
           cFamiliaAux   :=IntToStr(BeneficiarioObj.matriculaCSCTitular);
           nCodDep:=RetornaDepFunciCassi(cTitu,IntToStr(BeneficiarioObj.matriculaCSCTitular));
        end;
      end;//

      //VERIFICAR SE BENEF. É TITULAR
{      cMatriculaFuncional:='';
      DM.QrSaudePro1.Close;
      DM.QrSaudePro1.Sql.Clear;
      DM.QrSaudePro1.Sql.Add('SELECT MATRDEP,MATRFUNC,TIPODEP,MATRICULA,DV,DEP,LOTACAO '+
                             '  FROM MIGFUNCITITULAR '+
                             ' WHERE MATRDEP=:MATRDEP');
      DM.QrSaudePro1.Parameters.ParamByName('MATRDEP').AsInteger:=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsInteger;
      DM.QrSaudePro1.Open;
      If DM.QrSaudePro1.FieldbyName('MATRFUNC').AsInteger=
         DM.QrSaudePro1.FieldbyName('MATRDEP').AsInteger Then
      begin
         cTitu:='S';
         cTipoDep:='33';//Tipo do Dependente ref. ao Titular
         cHandleFamilia:=DM.Adoquery.Fieldbyname('HANDLE').AsString;
         cFamiliaAux   :=Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString);
         cMatriculaFuncional:=DM.QrSaudepro1.fieldByname('MATRICULA').AsString+
                              DM.QrSaudePro1.FieldbyName('DV').AsString;
         nLotacaoMigFunc:=DM.QrSaudePro1.FieldByName('LOTACAO').value;
         nCodDep:=RetornaDepFunciCassi(cTitu,cFamiliaAux);
      end
      else
      begin
         //Tipo do Dependente
         if not DM.QrSaudePro1.Fieldbyname('TIPODEP').IsNull then
           if Trim(DM.QrSaudePro1.Fieldbyname('TIPODEP').AsString)='F' then
              cTipoDep:='34' //Handle Filho(a) - sam_contrato_tpdep
           else if Trim(DM.QrSaudePro1.Fieldbyname('TIPODEP').AsString)='C' then
              cTipoDep:='37' //Handle Cônjuge - sam_contrato_tpdep
           else if Trim(DM.QrSaudePro1.Fieldbyname('TIPODEP').AsString)='R' then
              cTipoDep:='38'; //Handle Companheiro(a) - sam_contrato_tpdep

         cTitu:='N';
         //Procura o Handle do Titular
         LoadStringQuery('SELECT HANDLE,CSC037WMTRBENF FROM SOCPRO.TCSC037 WHERE CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY');
         DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').AsString :=DM.QrSaudePro1.FieldbyName('MATRFUNC').AsString;
         DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').AsInteger:=80;//Padrão NA TCSC037 -> Func.Cassi
         DM.QrGeral.Open;
         cHandleFamilia:=DM.QrGeral.FieldbyName('HANDLE').AsString;
         nHandleFamilia:=DM.QrGeral.fieldbyName('HANDLE').AsInteger;
         cFamiliaTit   :=DM.QrGeral.FieldByName('CSC037WMTRBENF').AsString;
         cFamiliaAux   :=DM.QrGeral.FieldByName('CSC037WMTRBENF').AsString;
         nCodDep:=RetornaDepFunciCassi(cTitu,DM.QrGeral.FieldByName('CSC037WMTRBENF').AsString);
      end;}
   end;

   //Família
   cFamilia:='';
   if nPlano = 110 then
      cFamilia:=Copy(cFamiliaAux,5,5) //funci cassi - alterado dia 05/07/07 as 16:40 - Email da solange
   else
      cFamilia:=Trim(cFamiliaAux);

   //Beneficiário Indicador
   if nPlano in [100,101,140] then //Família I e II - incluído plano 140 - 11/01/2008
      cBenfIndicadorAntigo:=Tratar_Beneficiario_Indicador_Antigo;

   if nContrato=300 then //PDE
      cBenfIndicadorAntigo:=Tratar_Beneficiario_Indicador_Antigo;

   //Código de Afinidade - C = (Matricula + NroDependente)11 dígitos
   cCodAfinidade:='';
   if length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)) < 9 then
   Begin
      if length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)) < 2 then
         cCodAfinidade:=RepeatChar(9-length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
                     Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                     RepeatChar(2-length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)),'0')+
                     Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)
      else
         cCodAfinidade:=RepeatChar(9-Length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
                     Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                     Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)
   end
   else if length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)) < 2 then
        cCodAfinidade:=Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                    RepeatChar(2-length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)),'0')+
                    Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)
   else
        cCodAfinidade:=Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                    Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString);


   //Beneficiário - CCC MMMMMMMMM DD
   if nPlano <> 110 then // <> Func.Cassi
   begin
      if nPlano <> 1 then //<> dep.Indiretos
      begin
         if length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)) < 9 then
         Begin
            if length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)) < 2 then
               cMascaraBenef:=cContrato+RepeatChar(9-length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
                                     Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                                     RepeatChar(2-length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)),'0')+
                                     Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)
            else
               cMascaraBenef:=cContrato+RepeatChar(9-Length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
                                     Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                                     Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)
         end
         else if length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)) < 2 then
              cMascaraBenef:=cContrato+Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                                         RepeatChar(2-length(Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)),'0')+
                                         Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString)
         else
              cMascaraBenef:=cContrato+Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)+
                                    Trim(DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsString);
      end
      else //=Dep.Indiretos /Contrato + Matricula + Nr.sequencial de acordo com a Matrícula + 00
      begin
         cMascaraBenef:=cContrato+cCodAfinidade;//repeatChar(8-length(IntToStr(StrToInt(cMatAtual))),'0')+IntToStr(StrToInt(cMatAtual))+IntToStr(nNrDepInd)+'00';
      end;
   end
   else
     cMascaraBenef:=RetornaMascaraBenef(cFamilia,cContrato,InttoStr(nCodDep));

   //Tipo Dependente - C
   If not(nPlano=110) then
     if Find_CodVinculo(DM.Adoquery.Fieldbyname('CSC037WCODVINC').AsInteger) <> -1 then
        cTipoDep:=IntToStr(Find_CodVinculo(DM.Adoquery.Fieldbyname('CSC037WCODVINC').AsInteger));

   //Parentesco da Sam_beneficiário - somente Família II
   cParentesco:='';
   if nContrato in [110,140] then //família II - Familia III incluído no dia 11/01/2008
      cParentesco:=ProcurarParentesco(DM.Adoquery.Fieldbyname('CSC037WCODVINC').AsString);


   //Estado Civil - C
   cCivil:='';
   if (Trim(DM.Adoquery.Fieldbyname('CSC037WINDECIV').AsString)<>'') and
      (not (DM.Adoquery.Fieldbyname('CSC037WINDECIV').IsNull)) then
   begin
      cEstadoCiv:=DM.Adoquery.Fieldbyname('CSC037WINDECIV').AsString;
      if cEstadoCiv[1] in ['1','2','3','4','5','6'] then
      begin
         cCivil:='6';
         if (nPlano = 0) or (nPlano = 1) or (nPlano=2) then
         begin
            Case DM.Adoquery.Fieldbyname('CSC037WINDECIV').AsInteger of
               1 : cCivil:='1';
               2 : cCivil:='2';
               3 : cCivil:='3';
               4 : cCivil:='4';
               5 : cCivil:='5';
               6 : cCivil:='6';
            end;
         end
         else
         begin
            Case DM.Adoquery.Fieldbyname('CSC037WINDECIV').AsInteger of
               1 : cCivil:='1';
               2 : cCivil:='2';
               3 : cCivil:='6';
            end;
         end;
      end;
   end;
   //Carência - C
   nIndiSitu:=DM.Adoquery.Fieldbyname('CSC037WINDSITY').AsInteger;
   cCarencia:='';
   comando:='SELECT CSC039WINDCARE,CSC039WDMAVIGE,TO_CHAR(CSC039WNROCELU) CELULAR,TO_CHAR(CSC039WDDDCELU) DDD,TO_CHAR(CSC039WENDMAIL) EMAIL, '+
            '       CSC039WINDADIA,CSC039WVLRSLDO,CSC039WDMAVIGEPGTO,CSC039WINDACID '+
            '  FROM SOCPRO.TCSC039_DIFF '+
            ' WHERE CSC039WMTRBENF =:CSC039WMTRBENF AND'+
            '       CSC039WNRODEPY =:CSC039WNRODEPY';
   LoadStringQuery(comando);
   DM.QrGeral.Parameters.ParamByName('CSC039WMTRBENF').DataType := ftstring;
   DM.QrGeral.Parameters.ParamByName('CSC039WMTRBENF').Value := DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
   DM.QrGeral.Parameters.ParamByName('CSC039WNRODEPY').DataType := ftInteger;
   DM.QrGeral.Parameters.ParamByName('CSC039WNRODEPY').Value := DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger;
   DM.QrGeral.open;
   if nHandleContrato in [23,24,25,34,40,41,51,57,37] then //Só Famílias I-II-PAQ-PDE - contrato 34,41 cfme e-mail Benedito 01/08/2003
   begin                                 //Contrato 51,57 cfme e-mail Benedito 07/07/2006 / incluído contrato 37 no dia 11/01/2008
      if ((DM.QrGeral.FieldByName('CSC039WINDCARE').AsInteger = 0)or
          (DM.QrGeral.FieldByName('CSC039WINDCARE').AsInteger = 2)) then
          cCarencia:='S'
      else
          cCarencia:='N';
   end
   else
      cCarencia:=cCarenciaDef;

   //Data adesão - C
   cDataAdesao:='';
   if not (nhandleContrato in [4,2,7,6,5,30]) then //somente os contratos 1 para 1 - não tem dependentes
   begin
      if not DM.QrGeral.FieldByName('CSC039WDMAVIGEPGTO').IsNull then
      begin
         if Trim(DM.QrGeral.FieldByName('CSC039WDMAVIGEPGTO').AsString) <> '' then
         begin
            nAno:=YearOf(DM.QrGeral.FieldByName('CSC039WDMAVIGEPGTO').value);
            nMes:=MonthOfTheYear(DM.QrGeral.FieldByName('CSC039WDMAVIGEPGTO').value);
            ndia:=dayOf(DM.QrGeral.FieldByName('CSC039WDMAVIGEPGTO').value);
            if ((nAno > 1800) and (nAno <= YearOf(now))) then
              if (nMes in [1..12]) then
                if (ndia in [1..31]) then
                    cDataAdesao:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('CSC039WDMAVIGEPGTO').value)
         end;
      end;
  end
  else //conforme e-mail Cláudio Márcio
     if nIndiSitu <> 0 then //Excluído
        cDataAdesao:='01/01/190100:00:00';

   //Família III - Incluído dia 11/01/2008
   cDescontoEscalonado:='';
   if nHandleContrato=37 then
      if StrToDate(formatDateTime('dd/mm/yyyy',StrToDateTime(cDataAdesao))) <= strToDate('12/07/2008') then //campanha promocional somente até julho
      begin
         case DM.QrGeral.FieldByName('CSC039WINDACID').AsInteger of
              0           :begin
                              cCarencia          :='S';
                              cDescontoEscalonado:='S';
                           end;
              3           :begin
                              cCarencia          :='S';
                              cDescontoEscalonado:='S';
                           end;
              4,5,6,7,8,9 :begin
                              cCarencia          :='N';
                              cDescontoEscalonado:='N';
                           end;
         end;
      end;


   //Celular - C
   If trim(DM.QrGeral.FieldByName('DDD').AsString) <> '0' Then
      cCelular := trim(DM.QrGeral.FieldByName('DDD').AsString) + trim(DM.QrGeral.FieldByName('CELULAR').AsString)
   Else
      cCelular := trim(DM.QrGeral.FieldByName('CELULAR').AsString);
   //E-Mail - C
   cMail   :=Trim(DM.QrGeral.FieldByName('EMAIL').AsString);

   //direito a adiantamento - C
   cDireitoAdto:=DM.QrGeral.FieldByName('CSC039WINDADIA').AsString;

   //Limite adiantemento - C
   cLimiteAdto:='';
   If not DM.QrGeral.FieldByName('CSC039WVLRSLDO').IsNull then
      cLimiteAdto:=DM.QrGeral.FieldByName('CSC039WVLRSLDO').AsString;

   //Data 1ª Adesão - C
   cData1Adesao:='';
   if not (nhandleContrato in [4,2,7,6,5,30]) then //(COPY(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').value,1,3)='100') and (nContrato=110)then //Beneficiário migrou de família I para II
   Begin
      if not DM.QrGeral.FieldByName('CSC039WDMAVIGE').IsNull then
      begin
         if Trim(DM.QrGeral.FieldByName('CSC039WDMAVIGE').AsString) <> '' then
         begin
            nAno:=YearOf(DM.QrGeral.FieldByName('CSC039WDMAVIGE').value);
            nMes:=MonthOfTheYear(DM.QrGeral.FieldByName('CSC039WDMAVIGE').value);
            ndia:=dayOf(DM.QrGeral.FieldByName('CSC039WDMAVIGE').value);
            if ((nAno > 1800) and (nAno <= YearOf(now))) then
              if (nMes in [1..12]) then
                if (ndia in [1..31]) then
                  cData1Adesao:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('CSC039WDMAVIGE').value);
         end;
      end
   end
   else
   begin
       if not DM.Adoquery.Fieldbyname('CSC037WDMACADY').IsNull then
       begin
         if Trim(DM.Adoquery.Fieldbyname('CSC037WDMACADY').AsString) <> '' then
         begin
            nAno:=YearOf(DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
            nMes:=MonthOfTheYear(DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
            ndia:=dayOf(DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
            if ((nAno > 1800) and (nAno <= YearOf(now))) then
              if (nMes in [1..12]) then
                if (ndia in [1..31]) then
                   cData1Adesao:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.Adoquery.Fieldbyname('CSC037WDMACADY').value);
         end
       end
       else //conforme e-mail Cláudio Márcio
       begin
          if DM.Adoquery.Fieldbyname('CSC037WINDSITY').value <> 0 then //Excluído
             cData1Adesao:='01/01/190100:00:00';
       end;
   end;

   //ATENDIMENTO ATÉ -DATA DE CANCELAMENTO - C
   nSuspensao:=DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger;
   //cDataAtenAte:='';
   cMemoAnotacao:='';


   //Data de Adesão é igual a data 1ª adesão para planos que possuem dependentes - data deve ser igual a data de cadastro no csc
   if nContrato in [30,1,3,130,50,131,80] then
      cDataAdesao:=cData1Adesao
   else if ncontrato = 2 then //dependentes indiretos - data do contrato
      cDataAdesao:='01/04/200000:00:00';

   if nContrato=300 then
      cDataAdesao:=cData1Adesao
   else if ncontrato = 2 then //dependentes indiretos - data do contrato
      cDataAdesao:='01/04/200000:00:00';


   //Motivo Cancelamento - C
   cMotCancel:='';
   if (Tratar_MotivoCancelamento <> 0) then
      cMotCancel:=IntToStr(nSituacao);

   //CBO - C   19/05/2009
   cCBOHandle := 0;
   cEstrutura:= '';
   comando:='SELECT B.CD_BRL_OCP '+
            'FROM SOCPRO.TCSC037_DIFF A, '+
            '     TCSC039_DIFF B '+
            'WHERE B.CSC039WMTRBENF=A.CSC037WMTRBENF AND '+
            'A.HANDLE =:HANDLE';
   LoadStringQuery(comando);
   DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftinteger;
   DM.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
   DM.Qrgeral.open;
   cEstrutura:=DM.QrGeral.Fieldbyname('CD_BRL_OCP').AsString;
   if cEstrutura = '0' then
     cEstrutura:='000000';

   comando:='';
   comando:='SELECT HANDLE '+
           'FROM SOCPRO.SAM_CBO '+
           'WHERE ESTRUTURA =:ESTRUTURA';
   LoadStringQuery(comando);
   DM.QrGeral.Parameters.ParamByName('ESTRUTURA').DataType := ftstring;
   DM.QrGeral.Parameters.ParamByName('ESTRUTURA').Value := cEstrutura;
   DM.Qrgeral.open;

   if not DM.QrGeral.fieldByname('HANDLE').IsNull then
      cCBOHandle:=DM.QrGeral.fieldByname('HANDLE').AsInteger;

   if cCBOHandle = 0 then
   begin
     //titulares associados
     if (ncontrato = 1) and (cTitu = 'S') then
       cCBOHandle := 3933;

     if ((nContrato in [4,5]) and (cTitu = 'S')) or (cTitu = 'N') then
     begin
       if cTitu = 'S' then
       begin
         cCBOHandle := 5233;
       end
       else
       begin
         if cDataNasc <> '' then
         begin
           if  ((now - StrToDateTime(cDataNasc))/365) < 18 then
           begin
             cCBOHandle := 5233;
           end;
         end;
       end;
     end;
   end;

   //Situação RH - C
   cSitRH:='';
   comando:='SELECT HANDLE '+
            '  FROM SOCPRO.SAM_SITUACAORH '+
            ' WHERE CODIGO =:CODIGO';
   LoadStringQuery(comando);
   DM.QrGeral.Parameters.ParamByName('CODIGO').DataType := ftinteger;
   DM.QrGeral.Parameters.ParamByName('CODIGO').Value := DM.Adoquery.Fieldbyname('CSC037WCODSITU').AsInteger;
   DM.Qrgeral.open;
   if not DM.QrGeral.fieldByname('HANDLE').IsNull then
      cSitRH:=DM.QrGeral.fieldByname('HANDLE').AsString;

   //Data adoção - C
   cDataAdocao:='';
   if not DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').IsNull  then
     if (Trim(DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').AsString) <> '') and (Trim(DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').AsString) <> '01/01/01') then
     begin
       nAno:=YearOf(DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').AsDateTime);
       nMes:=MonthOfTheYear(DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').AsDateTime);
       ndia:=dayOf(DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').AsDateTime);
       if ((nAno > 1800) and (nAno <= YearOf(now))) then
          if (nMes in [1..12]) then
            if (ndia in [1..31]) then
              cDataAdocao:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.Adoquery.Fieldbyname('CSC037WDMAADCAO').AsDateTime);
     end;

   //Matrícula Funcional -C
   if nPlano=0 then //
   begin
      cMatriculaFuncional:='';
      if cTitu='S' then //Somente para o Titular
         cMatriculaFuncional:=Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString);
   end;

   LoadStringQuery('SELECT CSC039WDMAVIGEPGTO,CSC039WDIAPGTO,CSC039WDMAATUA FROM SOCPRO.TCSC039 WHERE CSC039WMTRBENF=:CSC039WMTRBENF AND CSC039WNRODEPY=:CSC039WNRODEPY');
   DM.QrGeral.Parameters.ParamByName('CSC039WMTRBENF').DataType := ftString;
   DM.QrGeral.Parameters.ParamByName('CSC039WMTRBENF').Value := DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
   DM.QrGeral.Parameters.ParamByName('CSC039WNRODEPY').DataType := ftInteger;
   DM.QrGeral.Parameters.ParamByName('CSC039WNRODEPY').Value := DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger;
   DM.QrGeral.Open;

   cDiaCobranca:='';
   if not(cCobrancaDef='C') then //Cobrança não é no Contrato
      if not DM.QrGeral.FieldByName('CSC039WDIAPGTO').IsNull then
         cDiaCobranca:=DM.QrGeral.FieldByName('CSC039WDIAPGTO').AsString;


   cDataAlter:='';
   if not DM.QrGeral.FieldByName('CSC039WDMAATUA').IsNull then
     if Trim(DM.QrGeral.FieldByName('CSC039WDMAATUA').AsString) <> '' then
     begin
        nAno:=YearOf(DM.QrGeral.FieldByName('CSC039WDMAATUA').value);
        nMes:=MonthOfTheYear(DM.QrGeral.FieldByName('CSC039WDMAATUA').value);
        ndia:=dayOf(DM.QrGeral.FieldByName('CSC039WDMAATUA').value);
        if ((nAno > 1800) and (nAno <= YearOf(now))) then
          if (nMes in [1..12]) then
             if (ndia in [1..31]) then
                cDataAlter:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('CSC039WDMAATUA').value);
     end;

   cDataCancF:='';
   If DM.Adoquery.Fieldbyname('CSC037WINDSITY').AsInteger > 0 THEN //está excluído no CSC-cancelado no benner
     If ((nSuspensao <> 55) Or (nSuspensao <> 60) Or (nSuspensao <> 61) Or (nSuspensao <> 63)) then //60,61,63 Suspensos - 55 não está excluído no sisbb
       Begin
         If (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger > 19000101) and (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger < 22000101) then //validar a data
            Begin
              cAno:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),1,4); //+' 00:00:00';
              cMes:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),5,2);
              cDia:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),7,2);
              cDataCancF:=(cDia+'/'+cMes+'/'+cAno);
              cDataCancF:=FormatDateTime('dd/mm/yyyyhh:nn:ss', strtodate(cDataCancF));
            End
         Else
           cDataCancF:=FormatDateTime('dd/mm/yyyyhh:nn:ss',StrToDateTime('01/01/180000:00:00'));//ACORDO COM SOLANGE E FERNANDA
       End
     Else
      If (DM.Adoquery.Fieldbyname('CSC037WINDSITY').AsInteger = 0) And (nSuspensao <> 55) And (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger <> 0) And (DM.Adoquery.Fieldbyname('CSC037WINDMOTV').AsInteger <> 0) Then     //Alterado em 08/02/2012
         Begin
           cAno:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),1,4); //+' 00:00:00';
           cMes:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),5,2);
           cDia:=Copy(Trim(DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsString),7,2);
           cDataCancF:=(cDia+'/'+cMes+'/'+cAno);
           cDataCancF:=FormatDateTime('dd/mm/yyyyhh:nn:ss', strtodate(cDataCancF));
         End;
   //End;

   //if (cMotCSC in [60,61,63, 0]) then         //wilson aqui não reativar beneficiários cancelados
   //   cDataCancF:= '';

   if nPlano in [100,101,140] then //Família I e II //Família III incluído no dia 11/01/2008
     cIncBenef:='S'
   else
     cIncBenef:='N';

   if nContrato=300 then
     cIncBenef:='S'
   else
     cIncBenef:='N';

   //Seção e Lotação
   If nHandleContrato=2 then //Associados
   begin
      nSecaoFam:=nSecaoDef;
      nLotacaoFam:=-1;
      if (cTitu='S')and not(DM.Adoquery.Fieldbyname('CSC039WENDTRAB').IsNull) and
         (Trim(DM.Adoquery.Fieldbyname('CSC039WENDTRAB').AsString)<>'') then
      begin
         DM.QrSaudePro1.Close;
         DM.QrSaudePro1.Sql.Clear;
         DM.QrSaudePro1.Sql.Add('SELECT ' +
                                '   B.CSC039WMTRBENF, ' +
                                '   B.CSC039WENDTRAB, ' +
                                '   B.CSC039WNROSCAO, ' +
                                '  (SELECT C.HANDLE '+
                                '   FROM SOCPRO.SAM_CONTRATO_LOTACAO C '+
                                '   WHERE C.CONTRATO=2 AND '+
                                '         C.CODIGO=TO_NUMBER(SUBSTR(TRIM(B.CSC039WENDTRAB),1,LENGTH(TRIM(B.CSC039WENDTRAB))-1)) AND '+
                                '         C.DV= SUBSTR(TRIM(B.CSC039WENDTRAB),LENGTH(TRIM(B.CSC039WENDTRAB)),1)) HANDLELOTACAO '+
                                ' FROM ' +
                                '	TCSC039 B' +
                                ' WHERE ' +
                                '	B.CSC039WMTRBENF = :CSC039WMTRBENF AND' +
                                '	B.CSC039WNRODEPY = :CSC039WNRODEPY');
        //DM.QrSaudePro1.Parameters.ParamByName('CONTRATO').AsInteger      :=nHandleContrato;
        DM.QrSaudePro1.Parameters.ParamByName('CSC039WMTRBENF').DataType := ftString;
        DM.QrSaudePro1.Parameters.ParamByName('CSC039WMTRBENF').Value := DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
        DM.QrSaudePro1.Parameters.ParamByName('CSC039WNRODEPY').DataType := ftinteger;
        DM.QrSaudePro1.Parameters.ParamByName('CSC039WNRODEPY').Value := DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger;
        DM.QrSaudePro1.Open;
        if not DM.QrSaudePro1.FieldByname('HANDLELOTACAO').IsNull then
           nLotacaoFam:=DM.QrSaudePro1.FieldByname('HANDLELOTACAO').AsInteger;
     end;
   end
   else if nHandleContrato in [28,35] then //Func.Cassi - Serviço Próprio
   begin
      nSecaoFam:=nSecaoDef;
      nLotacaoFam:=-1;
      if (cTitu='S')and(nLotacaoMigFunc <> 999) then
      begin
         DM.QrSaudePro1.Close;
         DM.QrSaudePro1.Sql.Clear;
         DM.QrSaudePro1.Sql.Add('SELECT C.HANDLE '+
                                ' FROM SOCPRO.SAM_CONTRATO_LOTACAO C '+
                                'WHERE C.CONTRATO=:HCONTRATO AND'+
                                '      C.CODIGO='+IntToStr(nLotacaoMigFunc));
         Dm.QrSaudePro1.Parameters.ParamByName('hcontrato').value:=nHandleContrato;
         DM.QrSaudePro1.Open;
         if not DM.QrSaudePro1.FieldByName('handle').IsNull then
            nLotacaoFam:=DM.QrSaudePro1.FieldByname('HANDLE').value;
     end
   end
   else
   begin
      nLotacaoFam:=nLotacaoDef;
      nSecaoFam:=nSecaoDef;
   end;

   //cMemoAnotacao:='';
   cMotCancF:='';
   if Tratar_MotivoCancelamento <> 0 then
      cMotCancF:=IntToStr(nSituacao);

   cCartaoAntigo:=CartaoAntigo(RepeatChar(8-length(Trim(DM.Adoquery.Fieldbyname('CSC037WNROCART').AsString)),'0')+
                               Trim(DM.Adoquery.Fieldbyname('CSC037WNROCART').AsString),
                               DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger);

   //e-mail Serafim 23/03/2007 - Informativos
   cInformativo:='N';
   cInformativoCorreioEmail:=DM.Adoquery.Fieldbyname('TX_RCBR_INFM').AsString;
   if ((copy(cCodAfinidade,1,3)='150') or
      (copy(cCodAfinidade,1,3)='140')) then //140 - incluído dia 11/01/2008
       if trim(cInformativoCorreioEmail) <> '' then
         If trim(cInformativoCorreioEmail) <> '1' then
             cInformativo:='S';

end;

Function TFrmBeneficiario.Balance_line(cTipo:string):boolean;
{COMPARA AS DUAS STRINGS MONTADAS A PARTIR DOS CAMPOS DO CSC E BENNER
 Para o Balance-Line é considerado apenas os campos passíveis de mudança no CSC,ou seja,
 os campos que podem sofrer alterações nas tabelas do CSC.}
var cDataNascB,cDataCadB,cLimiteAdtoB,cSitRHB,cDataAdocaoB,
    cDataAdesaoB,{cDataAtenAteB,}cDataCancB,cData1adesaoB,cDataAdesaoFB,
    {cDataUltReajB,}cDataCancFB,cDiaCobrancaB,cDataAlterB,cBenefIndB,cMaeB:string;
begin
   Result:=false;
   if cTipo='M' then //Matrícula
   begin
      //Campos CSC
      cRegistroCSC.Add(cNome+cSexo+cCpf+cDataNasc+cDataCad+cNomeMae);

      //Campos da Sam_Matrícula
      cDataNascB:='';
      if not DM.QrGeral.fieldByName('DATANASCIMENTO').IsNull then
         cDataNascB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldByName('DATANASCIMENTO').value);

      cDataCadB:='';
      if not DM.QrGeral.fieldByName('DATAINGRESSO').IsNull then
         cDataCadB :=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldByName('DATAINGRESSO').value);

      cMaeB:='';
      if not DM.QrGeral.FieldByname('NOMEMAE').IsNull then
         cMaeB:=Trim(DM.QrGeral.FieldByname('NOMEMAE').AsString);

      cRegistroBenner.Add(DM.QrGeral.fieldByName('NOME').AsString + DM.QrGeral.fieldByName('SEXO').AsString +
                          DM.QrGeral.fieldByName('CPF').AsString + cDataNascB + cDataCadB + cMaeB);

      //Criar Registro para Recálculo de Mensalidade
//      if cDataNasc <> cDataNascB then
//         RecalculoMensalidade('N',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);

   end
   else if cTipo='B' then //Beneficiário
   begin
      //Campos CSC
      cRegistroCSC.Add(IntToStr(nHandleContrato)+cNome+IntToStr(nCodDep)+
                       cTitu+cHandleFamilia+cTipoDep+cCivil+cCarencia+cDataAdesao+
                       cCelular+cMail+cDireitoAdto+cLimiteAdto+{cDataAtenAte+}cDataCancF+
                       cData1Adesao+cMotCancel+cCodAfinidade+
                       cSitRH+cDataAdocao+cMatriculaFuncional+cBenfIndicadorAntigo+
                       cMascaraBenef+Trim(cCartaoAntigo));

      //Campos Benner
      if not DM.QrGeral.fieldbyName('LIMITEADIANTAMENTO').IsNull then
         cLimiteAdtoB:=DM.QrGeral.fieldbyName('LIMITEADIANTAMENTO').AsString
      else
         cLimiteAdtoB:='';

      cDataAdesaoB:='';
      if not DM.QrGeral.fieldbyName('DATAADESAO').IsNull then
         cDataAdesaoB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldbyName('DATAADESAO').value);

      {cDataAtenAteB:='';
      if not DM.QrGeral.fieldbyName('ATENDIMENTOATE').IsNull then
         cDataAtenAteB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldbyName('ATENDIMENTOATE').value);}

      cDataCancB:='';
      if not DM.QrGeral.fieldbyName('DATACANCELAMENTO').IsNull then
         cDataCancB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldbyName('DATACANCELAMENTO').value);

      cData1AdesaoB:='';
      if not DM.QrGeral.fieldbyName('DATAPRIMEIRAADESAO').IsNull then
         cData1AdesaoB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldbyName('DATAPRIMEIRAADESAO').value);

      cSitRHB:='';
      if not DM.QrGeral.fieldbyName('SITUACAORH').IsNull then
         cSitRHB:=DM.QrGeral.fieldbyName('SITUACAORH').AsString;

      cDataAdocaoB:='';
      if not DM.QrGeral.fieldbyName('DATAADOCAO').IsNull then
         cDataAdocaoB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldbyName('DATAADOCAO').value);

      cBenefIndB:='';
      if Not DM.QrGeral.FieldByname('BENEFICIARIOINDICADOR').IsNull then
         cBenefIndB:=DM.QrGeral.FieldByname('BENEFICIARIOINDICADOR').AsString;



      cRegistroBenner.Add(DM.QrGeral.fieldbyName('CONTRATO').AsString+
                          Trim(DM.QrGeral.fieldbyName('NOME').AsString)+
                          DM.QrGeral.fieldbyName('CODIGODEPENDENTE').AsString+
                          DM.QrGeral.fieldbyName('EHTITULAR').AsString+
                          DM.QrGeral.fieldbyName('FAMILIA').AsString+
                          DM.QrGeral.fieldbyName('TIPODEPENDENTE').AsString+
                          DM.QrGeral.fieldbyName('ESTADOCIVIL').AsString+
                          DM.QrGeral.fieldbyName('NAOTEMCARENCIA').AsString+
                          cDataAdesaoB + DM.QrGeral.fieldbyName('CELULAR').AsString+
                          DM.QrGeral.fieldbyName('EMAIL').AsString+
                          DM.QrGeral.fieldbyName('DIREITOAADIANTAMENTO').AsString+
                          cLimiteAdtoB+{cDataAtenAteB+}cDataCancB+cData1AdesaoB+
                          DM.QrGeral.fieldbyName('MOTIVOCANCELAMENTO').AsString+
                          DM.QrGeral.fieldbyName('matriculacassi').AsString+
                          cSitRHB+cDataAdocaoB+
                          DM.QrGeral.fieldbyName('MATRICULAFUNCIONAL').AsString+
                          cBenefIndB+DM.QrGeral.Fieldbyname('BENEFICIARIO').AsString+
                          Trim(DM.QrGeral.FieldbyName('CODIGOANTIGO').AsString));

      //  Atualiza Data Adesão - 29/09/2008
      DM.QrySaudePro16.Close;
      DM.QrySaudePro16.SQL.Clear;
      DM.QrySaudePro16.SQL.Add('select contrato FROM SOCPRO.SAM_beneficiario_mod where handle in');
      DM.QrySaudePro16.SQL.Add(' ( select bmh.beneficiariomodorigem                             ');
      DM.QrySaudePro16.SQL.Add('     FROM SOCPRO.SAM_beneficiario                  ben                ');
      DM.QrySaudePro16.SQL.Add('     JOIN SOCPRO.SAM_beneficiario_mod              bmo on ben.handle = bmo.beneficiario');
      DM.QrySaudePro16.SQL.Add('     JOIN SOCPRO.SAM_beneficiario_mod_historico    bmh on bmo.handle = bmh.beneficiariomod');
      DM.QrySaudePro16.SQL.Add('    where ben.handle = :HANDLE)');
      DM.QrySaudePro16.Parameters.ParamByName('HANDLE').DataType := ftInteger;
      DM.QrySaudePro16.Parameters.ParamByName('HANDLE').value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;//DM.Qrhmigrado.FieldByName('vhandle').AsInteger;
      DM.QrySaudePro16.Open;

      if not DM.QrySaudePro16.IsEmpty then
      nContrato_Old:=DM.QrySaudePro16.FieldByName('CONTRATO').Value;

      if nContrato=110 then //SMS 18172 - 13/08/2003
      begin
         if nContrato_Old in [43,25,40] then // Atualiza Data de Adesão - 29/09/2008
           cDataAdesao := cDataAdesaoB
         else if StrToDateTime(cDataAdesaoB) < StrToDateTime(cDataAdesao) then
            //Data de adesão que esta vindo do CSC recebe a data do benner que é a menor - não terá alteração
            cDataAdesao :=cDataAdesaoB;
            nContrato_Old:=0;
         end;
        // else
            //Criar Registro para Recálculo de Mensalidade -mantém-se a data que está vindo do CSC que é a menor
        //    RecalculoMensalidade('A',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
      

      //Implementação Solicitação Leonardo Service Desk nº
      lIncluiHistoricoNovo:=false;
      if Trim(cDataCancB) <> '' then //Registro que informa o cancelamento no SOC --estava cancelado no SOC
        if (Trim(cDataCancF)='') And (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger = 0) And
           (DM.QrGeral.fieldbyName('MOTIVOCANCELAMENTO').AsInteger <> 2) And (DM.QrGeral.fieldbyName('MOTIVOCANCELAMENTO').AsInteger <> 45) then //Registro que informa cancelamento no CSC --Reativado no CSC
           Begin
              Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'BM','I');
              lIncluiHistoricoNovo:=true;
           End;
   end
   else //Família
   begin
      //Campos CSC

      if nLotacaoFam <> -1 then
         cRegistroCSC.Add(IntToStr(StrToInt(cFamilia))+cDataAdesao+{cDataUltReaj+}cDataCancF+
                          cMotCancF+IntToStr(nLotacaoFam)+IntToStr(nSecaoFam)+cDiaCobranca+cDataAlter)
      else
         cRegistroCSC.Add(IntToStr(StrToInt(cFamilia))+cDataAdesao+{cDataUltReaj+}cDataCancF+
                          cMotCancF+''+IntToStr(nSecaoFam)+cDiaCobranca+cDataAlter);

      //Campos Benner
      cDataAdesaoFB:='';
      if not (DM.QrGeral.fieldbyName('DATAADESAO').IsNull) then
         cDataAdesaoFB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.fieldbyName('DATAADESAO').value);


      cDataCancFB:='';
      if not(DM.QrGeral.FieldByName('DATACANCELAMENTO').IsNull) then
         cDataCancFB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('DATACANCELAMENTO').value);

      cDataAlterB:='';
      if not(DM.QrGeral.FieldByName('DATAALTERACAO').IsNull) then
         cDataAlterB:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('DATAALTERACAO').value);

      cDiaCobrancaB:='';
      if not(DM.QrGeral.fieldbyName('DIACOBRANCA').IsNull) then
         cDiaCobrancaB:=DM.QrGeral.fieldbyName('DIACOBRANCA').AsString;

      cRegistroBenner.Add(DM.QrGeral.Fieldbyname('FAMILIA').AsString+
                          cDataAdesaoFB+{cDataUltReajB+}cDataCancFB+
                          DM.QrGeral.fieldbyName('MOTIVOCANCELAMENTO').AsString+
                          DM.QrGeral.fieldbyName('LOTACAO').AsString+
                          DM.QrGeral.fieldbyName('SECAO').AsString+cDiaCobrancaB+
                          cDataAlterB);
   end;

   //Comparação das Strings
   if cRegistroCSC.Text=cRegistroBenner.Text then
      Result:=true;
   //Limpar os dados armazenados nas strings para próx. comparação
   cRegistroCSC.Clear;
   cRegistroBenner.Clear;
end;

//**************************************DOCUMENTOS ENTREGUES*********************************

Procedure TFrmBeneficiario.Documentos_Entregues(nHandle:integer);
{Parâmetros in -> nHandle :Handle do Beneficiário
        Lógica ->Verifica (sam_contrato_tpdep_doc) se existem documentos para o beneficiario de acordo
                 com a sua dependência;
                 Faz a validação considerando-se a idade inicial e meses de validade para cada Doc(contrato);
                 Executa a operação de Insert ou Update no Doc;}
var cTexto,cDataBase,cDataVal:string;
    nIdadeBenef :integer;
    dDataValid:TDateTime;
begin
    cDataBase:='31/12/200300:00:00';//Data Base para cálculo da Idade
    cTexto:='SELECT DOC.CONTRATOTPDEP,DOC.MESESVALIDADE,DOC.ACAOFALTA,'+
            '       DOC.TIPODOCUMENTO,DOC.DIASAPRESENTACAO,DOC.CONTRATO,'+
            '       DOC.TIPODEPENDENTE,DOC.IDADEINICIAL,BEN.DATAADESAO '+
            '  FROM SOCPRO.SAM_CONTRATO_TPDEP_DOC DOC,'+
            '       SAM_BENEFICIARIO BEN '+
            ' WHERE DOC.CONTRATOTPDEP=BEN.TIPODEPENDENTE AND '+
            '       BEN.HANDLE=:HANDLE ';
    LoadStringQuery(cTexto);
    DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftinteger;
    DM.QrGeral.Parameters.ParamByName('HANDLE').Value := nHandle;
    //LoadStringQuery(cTexto+IntToStr(nHandle));
    DM.QrGeral.Open;
    if (Trim(cDataNasc)<>'')and(Trim(cDataAdesao)<>'') then
    begin
      nIdadeBenef:=Trunc((StrToDateTime(cDataBase) - StrToDateTime(cDataNasc))/365);
      While not DM.QrGeral.Eof do
      begin
         if (nIdadeBenef >= DM.QrGeral.FieldByName('IDADEINICIAL').AsInteger ) then
         begin
            //Regra para Data de Validade
            if (DM.QrGeral.fieldByname('MESESVALIDADE').AsInteger=999)or
               (DM.QrGeral.fieldByname('MESESVALIDADE').IsNull) then
            begin
               dDataValid:=0;
               cDataVal:='';
            end
            else
            begin //Regra passada por Hélio Mazza - E-MAIL
               dDataValid:=IncMonth(StrToDateTime(cDataAdesao),DM.QrGeral.fieldByname('MESESVALIDADE').AsInteger);
               While dDataValid < StrToDateTime(cDataBase) do
                   dDataValid:=IncMonth(dDataValid,12);
               cDataVal:=FormatDateTime('dd/mm/yyyyhh:nn:ss',dDataValid);
            end;

            //Verificar se documento já foi cadastrado para o Benef.
            DM.QrSaudePro.close;
            DM.QrSaudePro.sql.clear;
            DM.QrSaudePro.sql.Add('SELECT HANDLE,DATAENTREGA,DATAVALIDADE '+
                                  '  FROM SOCPRO.SAM_BENEFICIARIO_DOCENTREGUE '+
                                  ' WHERE BENEFICIARIO=:BENEFICIARIO AND '+
                                  '       CONTRATO=:CONTRATO AND '+
                                  '       TIPODOCUMENTO=:TIPODOCUMENTO ');
            DM.QrSaudePro.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
            DM.QrSaudePro.Parameters.ParamByName('BENEFICIARIO').Value := nHandle;
            DM.QrSaudePro.Parameters.ParamByName('CONTRATO').DataType := ftinteger;
            DM.QrSaudePro.Parameters.ParamByName('CONTRATO').Value     :=nHandleContrato;
            DM.QrSaudePro.Parameters.ParamByName('TIPODOCUMENTO').DataType := ftinteger;
            DM.QrSaudePro.Parameters.ParamByName('TIPODOCUMENTO').Value := DM.QrGeral.Fieldbyname('TIPODOCUMENTO').AsInteger;
            DM.QrSaudePro.open;
            Try
              if DM.QrSaudePro.FieldByname('HANDLE').IsNull then //INSERÇÃO
              begin
                nMaxHandleDoc:=0;
                DM.Qr_Handle.Close;
                DM.Qr_Handle.SQL.clear;
                Dm.Qr_Handle.SQL.Add('SELECT SEQ_BENDOCENTR.NEXTVAL HANDLE FROM DUAL');
                Dm.Qr_handle.Open;
                nMaxHandleDoc := DM.Qr_handle.Fieldbyname('HANDLE').AsInteger;
                DM.Qr_InsDoc.Parameters.ParamByName('HANDLE').DataType := ftinteger;
                DM.Qr_InsDoc.Parameters.ParamByName('HANDLE').Value       := nMaxHandleDoc;
                DM.Qr_InsDoc.Parameters.ParamByName('BENEFICIARIO').DataType := ftinteger;
                DM.Qr_InsDoc.Parameters.ParamByName('BENEFICIARIO').Value := nHandle;
                DM.Qr_InsDoc.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
                DM.Qr_InsDoc.Parameters.ParamByName('CONTRATO').Value     := nHandleContrato;
                DM.Qr_InsDoc.Parameters.ParamByName('TIPODOCUMENTO').DataType := ftinteger;
                DM.Qr_InsDoc.Parameters.ParamByName('TIPODOCUMENTO').Value := DM.QrGeral.Fieldbyname('TIPODOCUMENTO').AsInteger;
                DM.Qr_InsDoc.Parameters.ParamByName('DATAENTREGA').DataType := ftDateTime;
                DM.Qr_InsDoc.Parameters.ParamByName('DATAENTREGA').Value :=StrToDateTime(cDataAdesao);

                DM.Qr_InsDoc.Parameters.ParamByName('DATAVALIDADE').DataType := ftDateTime;
                if dDataValid=0 then
                  DM.Qr_InsDoc.Parameters.ParamByName('DATAVALIDADE').value := null
                else
                  DM.Qr_InsDoc.Parameters.ParamByName('DATAVALIDADE').Value:=dDataValid;

                DM.Qr_InsDoc.ExecSQL;
                nIDoc:=nIDoc + 1;
                SGGrade.Cells[7,1]:=IntToStr(nIDoc);
                SGGrade.Refresh;
              end
              else //BALANCE LINE / UPDATE
              begin
                cRegistroCSC.Add(DM.QrGeral.FieldByname('DATAADESAO').AsString+cDataVal);

                if not DM.QrSaudePro.FieldByname('DATAVALIDADE').IsNull then
                   cRegistroBenner.Add(DM.QrSaudePro.FieldByname('DATAENTREGA').AsString+
                                       FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrSaudePro.FieldByname('DATAVALIDADE').value))
                else
                   cRegistroBenner.Add(DM.QrSaudePro.FieldByname('DATAENTREGA').AsString+'');

                if cRegistroCSC.Text <> cRegistroBenner.Text then
                begin
                  DM.Qr_UpDoc.Parameters.ParamByName('HANDLE').DataType := ftinteger;
                  DM.Qr_UpDoc.Parameters.ParamByName('HANDLE').Value       := DM.QrSaudePro.Fieldbyname('HANDLE').AsInteger;
                  DM.Qr_UpDoc.Parameters.ParamByName('DATAENTREGA').DataType := ftDateTime;
                  DM.Qr_UpDoc.Parameters.ParamByName('DATAENTREGA').Value := DM.QrGeral.Fieldbyname('DATAADESAO').AsDateTime;
                  DM.Qr_UpDoc.Parameters.ParamByName('DATAVALIDADE').DataType := ftDatetime;
                  if dDataValid <> 0 then
                    DM.Qr_UpDoc.Parameters.ParamByName('DATAVALIDADE').Value :=dDataValid
                  else
                    DM.Qr_UpDoc.Parameters.ParamByName('DATAVALIDADE').value := null;

                  DM.Qr_UpDoc.ExecSql;
                  nUDoc:=nUDoc + 1;
                  SGGrade.Cells[7,2]:=IntToStr(nUDoc);
                  SGGrade.Refresh;
                end;
                cRegistroCSC.Clear;
                cRegistroBenner.Clear;
              end;
            Except
               On E:Exception do
               begin
                  Grava_log('2',IntToStr(nhandle),'BD','I');
                  nEDoc:=nEDoc + 1;
                  SGGrade.Cells[7,3]:=IntToStr(nEDoc);
                  SGGrade.Refresh;
                  RegistraLog(nNrImport,'TIPO DOCUMENTO->'+DM.QrGeral.Fieldbyname('TIPODOCUMENTO').AsString+'BENEF->'+IntToStr(nhandle)+' '+E.Message,'INSERT/UPDATE SOCPRO.SAM_BENEFICIARIO_DOCENTREGUE');
               end;
            end;
         end;
         DM.QrGeral.Next;
     end;
    end
    else
    begin
       nEDoc:=nEDoc + 1;
       SGGrade.Cells[7,3]:=IntToStr(nEDoc);
       SGGrade.Refresh;
       RegistraLog(nNrImport,'Data de Nascimento Null ou Data de Adesão Inválida para BENEF->'+IntToStr(nhandle),'INSERT/UPDATE SOCPRO.SAM_BENEFICIARIO_DOCENTREGUE');
    end;
end;


//***************************************MÓDULOS*********************************************

Procedure TFrmBeneficiario.Modulos_Beneficiario(nHandle,contrato:integer);
{Parâmetros in -> nHandle:Handle do Benef. em questão
 Lógica -> Verifica se Existem módulos cadastrados para o Contrato em questão;
           Se True, prepara-se os campos para Inserção/Update/Balance-Line;
           Verifica se módulo já foi cadastrado para o Benef.;
           Se false,insere o módulo para o Benef -
           se True, faz-se o Balance-line e Atualiza campos caso Strings CSC e Benner sejam <> }
var cDataAux1,cDataAux2,cParcDias,
    cMot,cDataAux3,cDataAux4,cParcDiasB,cMotB,cCodTabPrecoB:String;
begin
   //query de recupera os módulos cadastrados para o Contrato
   if not(contrato in [27,37]) then //diferente do contrato STF - inserir somente os módulos obrigatórios
     LoadStringQuery('SELECT BEN.HANDLE, '+ //contrato 37 incluído no dia 11/01/2008
                     '        CASE '+
                     '           WHEN BEN.DATAADESAO > MOD.DATAADESAO THEN BEN.DATAADESAO '+
                     '           ELSE MOD.DATAADESAO '+
                     '        END DATAADESAO, '+
                     '  BEN.DATACANCELAMENTO,BEN.MOTIVOCANCELAMENTO,'+
                     '       MOD.HANDLE HANDLEMOD,MOD.MODULO,MOD.PRIMEIRAPARCELA,MOD.PARCELADIAS'+
                     '  FROM SOCPRO.SAM_BENEFICIARIO BEN,'+
                     '       SAM_CONTRATO_MOD MOD'+
                     ' WHERE MOD.CONTRATO=BEN.CONTRATO AND '+
                     '       BEN.HANDLE=:HANDLE AND MOD.OBRIGATORIO=''S'' AND MOD.DATACANCELAMENTO IS NULL ')
   else //STF - inserir todos os módulos do contrato
     LoadStringQuery('SELECT BEN.HANDLE, '+
                     '        CASE '+
                     '           WHEN BEN.DATAADESAO > MOD.DATAADESAO THEN BEN.DATAADESAO '+
                     '           ELSE MOD.DATAADESAO '+
                     '        END DATAADESAO, '+
                     '       BEN.DATAADESAO,BEN.DATACANCELAMENTO,BEN.MOTIVOCANCELAMENTO,'+
                     '       MOD.HANDLE HANDLEMOD,MOD.MODULO,MOD.PRIMEIRAPARCELA,MOD.PARCELADIAS'+
                     '  FROM SOCPRO.SAM_BENEFICIARIO BEN,'+
                     '       SAM_CONTRATO_MOD MOD'+
                     ' WHERE MOD.CONTRATO=BEN.CONTRATO AND '+
                     '       BEN.HANDLE=:HANDLE AND MOD.DATACANCELAMENTO IS NULL ');
   DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
   DM.QrGeral.Parameters.ParamByName('HANDLE').Value := nHandle;
   DM.QrGeral.Open;
   If not DM.QrGeral.FieldByname('HANDLEMOD').IsNull then //Existem Módulos
   begin
      While not DM.QrGeral.Eof do //Percorrer todos os Módulos
      begin
         cParcDias:='';
         if not DM.QrGeral.FieldByName('PARCELADIAS').IsNull then
            cParcDias:=DM.QrGeral.FieldByName('PARCELADIAS').AsString;

         cDataAux1:='';
         if not DM.QrGeral.FieldByName('DATAADESAO').IsNull then
            cDataAux1:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('DATAADESAO').value);

         cDataAux2:='';
         if not DM.QrGeral.FieldByName('DATACANCELAMENTO').IsNull then
            cDataAux2:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('DATACANCELAMENTO').value);

         cMot:='';
         if not DM.QrGeral.FieldByName('MOTIVOCANCELAMENTO').IsNull then
            cMot:=DM.QrGeral.FieldByName('MOTIVOCANCELAMENTO').AsString;

         //Verifica se módulo já foi cadastrado para o benef.
         DM.QrSaudePro.Close;
         DM.QrSaudePro.Sql.Clear;
         DM.QrSaudePro.Sql.Add('SELECT HANDLE,MODULO,DATAADESAO,DATACANCELAMENTO,MOTIVOCANCELAMENTO,'+
                               '       PRIMEIRAPARCELA,PARCELADIAS,CODIGOTABELAPRC '+
                               '  FROM SOCPRO.SAM_BENEFICIARIO_MOD '+
                               ' WHERE BENEFICIARIO = :BENEFICIARIO '+
                               ' AND CONTRATO =:CONTRATO '+
                               ' AND MODULO=:MODULO');
         DM.QrSaudePro.Parameters.ParamByName('BENEFICIARIO').DataType := ftinteger;
         DM.QrSaudePro.Parameters.ParamByName('BENEFICIARIO').Value := nHandle;
         DM.QrSaudePro.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
         DM.QrSaudePro.Parameters.ParamByName('CONTRATO').Value := contrato;
         DM.QrSaudePro.Parameters.ParamByName('MODULO').DataType := ftInteger;
         DM.QrSaudePro.Parameters.ParamByName('MODULO').Value      := DM.QrGeral.FieldByname('HANDLEMOD').AsInteger;
         DM.QrSaudePro.open;
         TRY
           if DM.QrSaudePro.Fieldbyname('MODULO').IsNull then //não foi cadastrado - Inserção
           begin
              Dm.qAux.Close;
              Dm.qAux.SQL.Clear;
              Dm.qAux.SQL.Add('SELECT BMOD.HANDLE');
              Dm.qAux.SQL.Add('  FROM SOCPRO.SAM_BENEFICIARIO_MOD BMOD');
              Dm.qAux.SQL.Add('  JOIN SOCPRO.SAM_CONTRATO_MOD CMOD ON CMOD.HANDLE = BMOD.MODULO');
              Dm.qAux.SQL.Add(' WHERE BMOD.BENEFICIARIO = :BENEFICIARIO');
              Dm.qAux.SQL.Add('   AND (BMOD.MODULO <> :MODULO OR BMOD.CONTRATO <> :CONTRATO)');
              Dm.qAux.SQL.Add('   AND CMOD.OBRIGATORIO = ''S''');
              Dm.qAux.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
              Dm.qAux.Parameters.ParamByName('BENEFICIARIO').Value := nHandle;
              Dm.qAux.Parameters.ParamByName('MODULO').DataType := ftInteger;
              Dm.qAux.Parameters.ParamByName('MODULO').Value := DM.QrGeral.FieldByname('HANDLEMOD').AsInteger;
              DM.qAux.Parameters.ParamByName('CONTRATO').DataType := ftinteger;
              DM.qAux.Parameters.ParamByName('CONTRATO').Value := contrato;
              Dm.qAux.Open;

              if (contrato = 4) and (not DM.qAux.FieldByName('HANDLE').IsNull) then
              begin
                Grava_log('1',IntToStr(nHandle),'BM','U');
                DM.qUpModuloPensionista.Close;
                Dm.qUpModuloPensionista.SQL.Clear;
                Dm.qUpModuloPensionista.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO_MOD');
                Dm.qUpModuloPensionista.SQL.Add('SET                        ');
                Dm.qUpModuloPensionista.SQL.Add('   CONTRATO=:CONTRATO,');
                Dm.qUpModuloPensionista.SQL.Add('   MODULO=:MODULO');
                Dm.qUpModuloPensionista.SQL.Add('WHERE HANDLE=:HANDLE');

                DM.qUpModuloPensionista.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
                DM.qUpModuloPensionista.Parameters.ParamByName('CONTRATO').Value := contrato;
                DM.qUpModuloPensionista.Parameters.ParamByName('MODULO').DataType := ftInteger;
                DM.qUpModuloPensionista.Parameters.ParamByName('MODULO').Value := DM.QrGeral.FieldByname('HANDLEMOD').AsInteger;
                DM.qUpModuloPensionista.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                DM.qUpModuloPensionista.Parameters.ParamByName('HANDLE').Value := DM.qAux.FieldByname('HANDLE').AsInteger;

                DM.qUpModuloPensionista.ExecSQL;
              end
              else
              begin
                Grava_log('1',IntToStr(nHandle),'BM','I');
                //Inserir o Sequence do MODULO - 28/08/2006 - S.C JULIANO - 134924
                DM.qrmaxMod_hist.SQL.Clear;
                DM.qrmaxMod_hist.sql.Add('select SEQ_SAM0010.nextval HANDLE FROM DUAL'); //sam_beneficiario_mod
                DM.QrMaxMod_hist.Open;
                nMaxHandleModulos:=DM.QrMaxMod_hist.fieldbyName('handle').Value;

                DM.Qr_InsModulo.Close;
                DM.Qr_InsModulo.SQL.Clear;
                DM.Qr_InsModulo.SQL.Add('INSERT INTO SAM_BENEFICIARIO_MOD');
                DM.Qr_InsModulo.SQL.Add('      (HANDLE,BENEFICIARIO,MODULO,PRIMEIRAPARCELA,PARCELADIAS,CONTRATO,');
                DM.Qr_InsModulo.SQL.Add('        DATAADESAO,DATACANCELAMENTO,MOTIVOCANCELAMENTO,CODIGOTABELAPRC,');
                DM.Qr_InsModulo.SQL.Add('        SEGUNDAPARCELA,INSCRICAO,SOFREUADAPTACAO)');
                DM.Qr_InsModulo.SQL.Add('      VALUES');
                DM.Qr_InsModulo.SQL.Add('       (:HANDLE,:BENEFICIARIO,:MODULO,:PRIMEIRAPARCELA,:PARCELADIAS,:CONTRATO,');
                DM.Qr_InsModulo.SQL.Add('       :DATAADESAO,:DATACANCELAMENTO,:MOTIVOCANCELAMENTO,:CODIGOTABELAPRC,');
                DM.Qr_InsModulo.SQL.Add('         :SEGUNDAPARCELA,:INSCRICAO,:SOFREUADAPTACAO)                                                 ');

                DM.Qr_InsModulo.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                DM.Qr_InsModulo.Parameters.ParamByName('HANDLE').Value         :=nMaxHandleModulos;
                DM.Qr_InsModulo.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
                DM.Qr_InsModulo.Parameters.ParamByName('BENEFICIARIO').Value   :=nHandle;
                DM.Qr_InsModulo.Parameters.ParamByName('MODULO').DataType := ftInteger;
                DM.Qr_InsModulo.Parameters.ParamByName('MODULO').Value         :=DM.QrGeral.FieldByName('HANDLEMOD').AsInteger;
                DM.Qr_InsModulo.Parameters.ParamByName('PRIMEIRAPARCELA').DataType := ftString;
                DM.Qr_InsModulo.Parameters.ParamByName('PRIMEIRAPARCELA').Value :=DM.QrGeral.FieldByName('PRIMEIRAPARCELA').AsString;
                DM.Qr_InsModulo.Parameters.ParamByName('PARCELADIAS').DataType := ftInteger;
                if Trim(cParcDias)<>'' then
                  DM.Qr_InsModulo.Parameters.ParamByName('PARCELADIAS').Value :=StrToInt(cParcDias)
                else
                  DM.Qr_InsModulo.Parameters.ParamByName('PARCELADIAS').value := null;

                DM.Qr_InsModulo.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
                DM.Qr_InsModulo.Parameters.ParamByName('CONTRATO').Value       :=nHandleContrato;

                DM.Qr_InsModulo.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
                if Trim(cDataAux1)<>'' then
                   DM.Qr_InsModulo.Parameters.ParamByName('DATAADESAO').Value :=StrToDateTime(cDataAux1)
                else
                   DM.Qr_InsModulo.Parameters.ParamByName('DATAADESAO').value := null;

                if (Trim(cDataAux2)<>'') And (Trim(cMot)<>'') then
                Begin
                  DM.Qr_InsModulo.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
                  DM.Qr_InsModulo.Parameters.ParamByName('DATACANCELAMENTO').Value :=StrToDateTime(cDataAux2);
                  DM.Qr_InsModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
                  DM.Qr_InsModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value :=StrToInt(cMot);
                End
                else
                Begin
                  DM.Qr_InsModulo.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
                  DM.Qr_InsModulo.Parameters.ParamByName('DATACANCELAMENTO').value := null;
                  DM.Qr_InsModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
                  DM.Qr_InsModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;
                End;
                DM.Qr_InsModulo.Parameters.ParamByName('CODIGOTABELAPRC').DataType := ftString;
                DM.Qr_InsModulo.Parameters.ParamByName('CODIGOTABELAPRC').Value :=cCodTabPreco;

                DM.Qr_InsModulo.Parameters.ParamByName('SEGUNDAPARCELA').DataType := ftString;
                if nHandleContrato in [23,24,7,37] then //37 incluído no dia 11/01/2008
                   DM.Qr_InsModulo.Parameters.ParamByName('SEGUNDAPARCELA').Value := '2'
                else
                   DM.Qr_InsModulo.Parameters.ParamByName('SEGUNDAPARCELA').Value :='1';

                DM.Qr_InsModulo.Parameters.ParamByName('INSCRICAO').DataType := ftString;
                DM.Qr_InsModulo.Parameters.ParamByName('INSCRICAO').Value := '1';

                DM.Qr_InsModulo.Parameters.ParamByName('SOFREUADAPTACAO').DataType := ftString;
                DM.Qr_InsModulo.Parameters.ParamByName('SOFREUADAPTACAO').Value := 'N';
                DM.Qr_InsModulo.ExecSQL;

                //Inclusão do registro na Sam_beneficairio_mod_historico
                //Inserir o Sequence do MOD_HISTORICO - 28/08/2006 - S.C JULIANO - 134924
                DM.qrmaxMod_hist.SQL.Clear;
                DM.qrmaxMod_hist.sql.Add('select SEQ_SAM0011.nextval HANDLE FROM DUAL');
                DM.QrMaxMod_hist.Open;
                nMaxHandleHistMod:=DM.QrMaxMod_hist.fieldbyName('handle').Value;

                Dm.QrInsHistMod.Close;
                Dm.QrInsHistMod.Sql.Clear;
                Dm.QrInsHistMod.SQL.Add('insert into sam_beneficiario_mod_historico');
                Dm.QrInsHistMod.SQL.Add(' (handle,beneficiariomod,dataativacao,datacancelamento,motivocancelamento,origem,datamovimentoativacao)');
                Dm.QrInsHistMod.SQL.Add('values');
                Dm.QrInsHistMod.SQL.Add(' (:handle,:beneficiariomod,:dataativacao,:datacancelamento,:motivocancelamento,:origem,:datamovimentoativacao)');
                Dm.QrInsHistMod.Parameters.ParamByName('handle').DataType := ftInteger;
                Dm.QrInsHistMod.Parameters.ParamByName('handle').value:=nMaxHandleHistMod;
                Dm.QrInsHistMod.Parameters.ParamByName('beneficiariomod').DataType := ftInteger;
                Dm.QrInsHistMod.Parameters.ParamByName('beneficiariomod').value:=nMaxHandleModulos;
                dm.QrInsHistMod.Parameters.ParamByName('dataativacao').DataType := ftDateTime;
                dm.QrInsHistMod.Parameters.ParamByName('dataativacao').value:=StrToDateTime(cDataAux1);
                Dm.QrInsHistMod.Parameters.ParamByName('datacancelamento').DataType := ftDateTime;
                Dm.QrInsHistMod.Parameters.ParamByName('datacancelamento').value := null;
                Dm.QrInsHistMod.Parameters.ParamByName('motivocancelamento').DataType := ftInteger;
                Dm.QrInsHistMod.Parameters.ParamByName('motivocancelamento').value := null;
                dm.QrInsHistMod.Parameters.ParamByName('origem').DataType := ftString;
                dm.QrInsHistMod.Parameters.ParamByName('origem').Value:='I';
                Dm.QrInsHistMod.Parameters.ParamByName('datamovimentoativacao').DataType := ftDateTime;
                Dm.QrInsHistMod.Parameters.ParamByName('datamovimentoativacao').value:=Now; // Inserido em 08/09/2009
                Dm.QrInsHistMod.ExecSQL;

                nIMod:=nIMod + 1;
                SGGrade.Cells[6,1]:=IntToStr(nIMod);
                SGGrade.Refresh;
              end;
           end
           else
           begin
             Grava_log('1',IntToStr(nHandle),'BM','U');
             //If (Not DM.QrGeral.Parameters.ParamByName('DATACANCELAMENTO').AsInteger.Isnull) And (DM.Adoquery.Fieldbyname('CSC037WINDSITY').AsInteger > 0) And (DM.Adoquery.Fieldbyname('CSC037WDMAFIMYDRTO').AsInteger <> 0) Then     //Alterado em 14/02/2012
             If not (Contrato in [23,24]) then
             Begin
               //BALANCE LINE

               //Registro Ref. ao Módulo
               cRegistroCSC.Add(cParcDias+cDataAux1+cDataAux2+cMot+DM.QrGeral.FieldbyName('PRIMEIRAPARCELA').AsString+cCodTabPreco);

               //Registro cad. para benef.
               cParcDiasB:='';
               if not DM.QrSaudePro.FieldByName('PARCELADIAS').IsNull then
                  cParcDiasB:=DM.QrSaudePro.FieldByName('PARCELADIAS').AsString;

               cDataAux3:='';
               if not DM.QrSaudePro.FieldByName('DATAADESAO').IsNull then
                  cDataAux3:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrSaudePro.FieldByName('DATAADESAO').value);

               cDataAux4:='';
               if not DM.QrSaudePro.FieldByName('DATACANCELAMENTO').IsNull then
                  cDataAux4:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrSaudePro.FieldByName('DATACANCELAMENTO').value);

               cMotB:='';
               if not DM.QrSaudePro.FieldByName('MOTIVOCANCELAMENTO').IsNull then
                  cMotB:=DM.QrSaudePro.FieldByName('MOTIVOCANCELAMENTO').AsString;

               cCodTabPrecoB:='';

               cCodTabPrecoB:=DM.QrSaudePro.FieldByName('CODIGOTABELAPRC').AsString;

               cRegistroBenner.Add(cParcDiasB+cDataAux3+cDataAux4+cMotB+DM.QrSaudePro.FieldbyName('PRIMEIRAPARCELA').AsString+cCodTabPrecoB);

               DM.Qr_UpModulo.Parameters.ParamByName('HANDLE').DataType := ftInteger;
               DM.Qr_UpModulo.Parameters.ParamByName('HANDLE').Value := DM.QrSaudePro.FieldByName('HANDLE').AsInteger;
               DM.Qr_UpModulo.Parameters.ParamByName('PRIMEIRAPARCELA').DataType := ftString;
               DM.Qr_UpModulo.Parameters.ParamByName('PRIMEIRAPARCELA').Value := DM.QrGeral.FieldByName('PRIMEIRAPARCELA').AsString;

               DM.Qr_UpModulo.Parameters.ParamByName('PARCELADIAS').DataType := ftInteger;
               if Trim(cParcDias)<>'' then
                  DM.Qr_UpModulo.Parameters.ParamByName('PARCELADIAS').Value :=StrToInt(cParcDias)
               else
               begin
                  DM.Qr_UpModulo.Parameters.ParamByName('PARCELADIAS').value := null;
               end;

               DM.Qr_UpModulo.Parameters.ParamByName('DATAADESAO').DataType := ftDateTime;
               if Trim(cDataAux1)<>'' then
                  DM.Qr_UpModulo.Parameters.ParamByName('DATAADESAO').Value :=StrToDateTime(cDataAux1)
               else
               begin
                  DM.Qr_UpModulo.Parameters.ParamByName('DATAADESAO').value := null;
               end;

               cDataAux4:='';
               if not DM.QrGeral.FieldByName('DATACANCELAMENTO').IsNull then
                 cDataAux4:=FormatDateTime('dd/mm/yyyyhh:nn:ss',DM.QrGeral.FieldByName('DATACANCELAMENTO').value);

               cMotB:='';
               if not DM.QrGeral.FieldByName('MOTIVOCANCELAMENTO').IsNull then
                 cMotB:=DM.QrGeral.FieldByName('MOTIVOCANCELAMENTO').AsString;


               DM.Qr_UpModulo.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
               DM.Qr_UpModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
               if (Trim(cDataAux4)<>'') And (Trim(cMotb)<>'') then
               Begin
                 DM.Qr_UpModulo.Parameters.ParamByName('DATACANCELAMENTO').Value := StrToDateTime(cDataAux4);
                 DM.Qr_UpModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := StrToInt(cMotb);
                 CancelarHistoricoBen(cDataAux4,cMotb,nHandle);
               End
               else
               Begin
                 DM.Qr_UpModulo.Parameters.ParamByName('DATACANCELAMENTO').value := null;
                 DM.Qr_UpModulo.Parameters.ParamByName('MOTIVOCANCELAMENTO').value := null;
                 CancelarHistoricoBen('','',DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
               End;

                //DM.Qr_UpModulo.Parameters.ParamByName('CODIGOTABELAPRC').value:=cCodTabPreco;
                //Retirada a atualização do campo CODIGOTABELAPRC da query QR_UPMODULO - 16/03/2011 Chamado SD99442

               DM.Qr_UpModulo.ExecSQL;

               //Implementação mod_historico - Service Desk Leonardo - Nº - dia 26/04/06
               if lIncluiHistoricoNovo then //beneficiario foi reativado no CSC
               begin
                  Grava_log('1',IntToStr(nHandle),'BMH','I');
                  //Incluir novo mod_histórico
                  //Inclusão do registro na Sam_beneficairio_mod_historico
                  //Inserir o Sequence do MOD_HISTORICO - 28/08/2006 - S.C JULIANO - 134924
                  DM.qrmaxMod_hist.SQL.Clear;
                  DM.qrmaxMod_hist.sql.Add('select SEQ_SAM0011.nextval HANDLE FROM DUAL');
                  DM.QrMaxMod_hist.Open;
                  nMaxHandleHistMod:=DM.QrMaxMod_hist.fieldbyName('handle').Value;
                                      Dm.QrInsHistMod.Parameters.ParamByName('handle').value:=nMaxHandleHistMod;
                  Dm.QrInsHistMod.Parameters.ParamByName('beneficiariomod').value:=DM.QrSaudePro.FieldByName('HANDLE').value;
                  dm.QrInsHistMod.Parameters.ParamByName('dataativacao').value:=now;
                  dm.QrInsHistMod.Parameters.ParamByName('origem').DataType := ftString;
                  dm.QrInsHistMod.Parameters.ParamByName('origem').Value :='R';
                  Dm.QrInsHistMod.Parameters.ParamByName('datacancelamento').value := null;
                  Dm.QrInsHistMod.Parameters.ParamByName('motivocancelamento').value := null;
                  Dm.QrInsHistMod.Parameters.ParamByName('datamovimentoativacao').value:=Now; // Inserido em 08/09/2009
                  Dm.QrInsHistMod.ExecSQL;
               end
               else //cancelar o Mod_histórico
               begin
                 try
                    if (Trim(cDataAux2)<>'') And (Trim(cMot) <> '') then
                      begin
                         Grava_log('1',IntToStr(nHandle),'BMH','U');
                         DM.QrMaxHandleHist.Close;
                         DM.QrMaxHandleHist.Parameters.ParamByName('modulo').value:=DM.QrSaudePro.FieldByName('HANDLE').value;
                         dm.QrMaxHandleHist.Open;
                         DM.QrUpdateModHist.Parameters.ParamByName('handle').Value            :=DM.QrMaxHandleHist.FieldByName('HANDLE').value;
                         DM.QrUpdateModHist.Parameters.ParamByName('motivocancelamento').value:=StrToInt(cMot);
                         DM.QrUpdateModHist.Parameters.ParamByName('datacancelamento').value  :=StrToDateTime(cDataAux2);
                         DM.QrUpdateModHist.Parameters.ParamByName('datamovimento').value     :=now;
                         DM.QrUpdateModHist.ExecSQL;
                      end;
                 except
                    on E:exception do
                    Begin
                      Grava_log('2',IntToStr(nhandle),'BMH','U');
                      //Showmessage(e.message);
                      RegistraLog(nNrImport,'MÓDULO->'+DM.QrSaudePro.Fieldbyname('MODULO').AsString+'BENEF->'+IntToStr(nhandle)+' '+E.Message,'INSERT/UPDATE SOCPRO.SAM_BENEFICIARIO_MOD');
                    End;
                 end;
               end;
               nUMod:=nUMod + 1;
               SGGrade.Cells[6,2]:=IntToStr(nUMod);
               SGGrade.Refresh;
             End;
           end;

           cRegistroCSC.Clear;
           cRegistroBenner.Clear;

           //DM.QRGERAL.Next; comentado para não entrar em loop
         EXCEPT
             On E:Exception do
             begin
                Grava_log('2',IntToStr(nHandle),'BM','I');
                nEMod:=nEMod + 1;
                SGGrade.Cells[6,3]:=IntToStr(nEMod);
                SGGrade.Refresh;
                RegistraLog(nNrImport,'MÓDULO->'+DM.QrSaudePro.Fieldbyname('MODULO').AsString+'BENEF->'+IntToStr(nhandle)+' '+E.Message,'INSERT/UPDATE SOCPRO.SAM_BENEFICIARIO_MOD');
             end;
         END;
         DM.QRGERAL.Next; //habilitado novamente senão entrará em loop
      end;
   end
end;

//***************************************CONTA FINANCEIRA************************************
Procedure TFrmBeneficiario.Conta_Financeira(nHandle:integer);
{Parâmetro in -> nHandle:handle do Beneficiário Titular
       Lógica -> Busca os dados da Conta do Beneficiário Titular;
                 Verifica se Conta Financeira existe para o Benef.;
                 Se False - Cria-se a conta; se true - faz-se o Balance-line
                 para eventual atualização
                 O Handle da SFN_CONTAFIN é igual ao handle do beneficiário + 10.000.000 - Regra criada para facilitar a identificação}
var cSqlTexto:string;
begin
    //Query que recupera os dados da Conta Financeira(CSC) do Beneficiário em Questão
    cSqlTexto:='SELECT AGE.HANDLE AGENCIA,'+
               '       SUBSTR(CSC39.CSC039WNROCNTACORR,1,9) CONTACORRENTE,'+
               '       SUBSTR(CSC39.CSC039WNROCNTACORR,LENGTH(CSC39.CSC039WNROCNTACORR),1) DV, '+
               '       CSC039WTPOPGTO, CSC39.NR_CPF_RSP_FNCO CPFRESPFIN, SUBSTR(CSC39.NM_RSP_FNCO,1,30) RESPFIN '+
               '  FROM SOCPRO.TCSC039 CSC39,SFN_AGENCIA AGE '+
              // '    FROM SOCPRO.TCSC039_DIFF CSC39,SFN_AGENCIA AGE '+ //UTILIZADO PARA O BALANCE LINE NA DEV
               ' WHERE (SUBSTR(CSC39.CSC039WPRFAGEN,1,4)) = AGE.AGENCIA '+
               //' WHERE TO_NUMBER(SUBSTR(CSC39.CSC039WPRFAGEN,1,4)) = AGE.AGENCIA '+
               '       AND CSC39.CSC039WMTRBENF =:CSC039WMTRBENF '+
               '       AND CSC39.CSC039WNRODEPY =:CSC039WNRODEPY ';
    LoadStringQuery(cSqlTexto);
    DM.QrGeral.Parameters.ParamByName('CSC039WMTRBENF').DataType := ftString;
    DM.QrGeral.Parameters.ParamByName('CSC039WMTRBENF').Value :=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
    DM.QrGeral.Parameters.ParamByName('CSC039WNRODEPY').DataType := ftInteger;
    DM.QrGeral.Parameters.ParamByName('CSC039WNRODEPY').Value :=DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger;
    DM.QrGeral.Open;

    //Verifica se existe Conta Financeira(Benner) para o Beneficiário
    DM.QrSaudePro.Close;
    DM.QrSaudePro.Sql.Clear;
    DM.QrSaudePro.Sql.Add('SELECT HANDLE,BANCO,AGENCIA,CONTACORRENTE,TABGERACAOPAG,TABGERACAOREC,DV FROM SOCPRO.SFN_CONTAFIN WHERE BENEFICIARIO =:BENEFICIARIO');
    DM.QrSaudePro.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
    DM.QrSaudePro.Parameters.ParamByName('BENEFICIARIO').Value :=nHandle;//+10000000;
    //DM.QrSaudePro.Sql.Add('SELECT HANDLE,BANCO,AGENCIA,CONTACORRENTE,DV FROM SOCPRO.SFN_CONTAFIN WHERE HANDLE ='+IntToStr(nHandle+10000000));
    DM.QrSaudePro.open;
    Try
      if DM.QrSaudePro.fieldByName('HANDLE').IsNull then //INSERÇÃO
      begin
         Grava_log('1',IntToStr(nHandle),'CF','I');
         //nMaxContaFin := nMaxContaFin + 1;
         nMaxContaFin:=0;
         LoadStringQueryAux('SELECT SEQ_CONTAFIN01.nextval MAXH FROM DUAL'); //Marcelo Barbosa - 12/08/2010
         DM.QrGeralAux.Open;
         nMaxContaFin := DM.QrGeralAux.Fieldbyname('MAXH').AsInteger;
         DM.QR_InsContaFin.Close;
         DM.QR_InsContaFin.SQL.Clear;
         DM.QR_InsContaFin.SQL.Add('INSERT INTO SFN_CONTAFIN');
         DM.QR_InsContaFin.SQL.Add(' (HANDLE,BENEFICIARIO,TABRESPONSAVEL,BANCO,AGENCIA,CONTACORRENTE,DV,INCLUSAOUSUARIO,INCLUSAODATA, NAOPARCELAR,');
         DM.QR_InsContaFin.SQL.Add('  TABINSTRUCAOPARCELAMENTO,NAOGERARDOCUMENTO, NAOCOBRARTARIFA,TABINSTRUCAOPARCELAMENTOPROX,TABGERACAOREC,TABGERACAOPAG,');
         DM.QR_InsContaFin.SQL.Add('  TIPODOCUMENTOREC,TIPODOCUMENTOPAG,CCNOME,CCCPFCNPJ,BENEFICIARIODESTINOCOBRANCA,CARTAOCREDITO,CARTAOOPERADORA,COMPETENCIALIQUIDACAO,CREDITOCONTATERCEIROS,PERCENTUALDESCONTOFOLHA)');
         DM.QR_InsContaFin.SQL.Add('VALUES ');
         DM.QR_InsContaFin.SQL.Add(' (:HANDLE,:BENEFICIARIO,:TABRESPONSAVEL,:BANCO,:AGENCIA,:CONTACORRENTE,:DV,:INCLUSAOUSUARIO,:INCLUSAODATA,:NAOPARCELAR,');
         DM.QR_InsContaFin.SQL.Add('  :TABINSTRUCAOPARCELAMENTO,:NAOGERARDOCUMENTO,:NAOCOBRARTARIFA,:TABINSTRUCAOPARCELAMENTOPROX,:TABGERACAOREC,:TABGERACAOPAG,');
         DM.QR_InsContaFin.SQL.Add('  :TIPODOCUMENTOREC,:TIPODOCUMENTOPAG,:CCNOME,:CCCPFCNPJ,:BENEFICIARIODESTINOCOBRANCA,:CARTAOCREDITO,:CARTAOOPERADORA,:COMPETENCIALIQUIDACAO,:CREDITOCONTATERCEIROS,:PERCENTUALDESCONTOFOLHA)');
         DM.QR_InsContaFin.Parameters.ParamByName('HANDLE').DataType := ftInteger;
         DM.QR_InsContaFin.Parameters.ParamByName('HANDLE').Value  := nMaxContaFin ; //;10000000 + nHandle;
         DM.QR_InsContaFin.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
         DM.QR_InsContaFin.Parameters.ParamByName('BENEFICIARIO').Value    := nHandle;
         DM.QR_InsContaFin.Parameters.ParamByName('TABRESPONSAVEL').DataType := ftinteger;
         DM.QR_InsContaFin.Parameters.ParamByName('TABRESPONSAVEL').Value  := 1;
         If DM.QrGeral.FieldByname('CSC039WTPOPGTO').AsInteger in [0,1] then //CONTA CORRENTE
         begin
           DM.QR_InsContaFin.Parameters.ParamByName('BANCO').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('BANCO').Value := 1;

           DM.QR_InsContaFin.Parameters.ParamByName('AGENCIA').DataType := ftInteger;
           If Not DM.QrGeral.FieldByName('AGENCIA').Isnull Then
             DM.QR_InsContaFin.Parameters.ParamByName('AGENCIA').Value := DM.QrGeral.FieldByName('AGENCIA').AsInteger
           Else
             DM.QR_InsContaFin.Parameters.ParamByName('AGENCIA').value := null;

           DM.QR_InsContaFin.Parameters.ParamByName('CONTACORRENTE').DataType := ftString;
           If Not DM.QrGeral.FieldByName('CONTACORRENTE').Isnull Then
             DM.QR_InsContaFin.Parameters.ParamByName('CONTACORRENTE').Value := IntToStr(DM.QrGeral.FieldByName('CONTACORRENTE').AsInteger)
           Else
             DM.QR_InsContaFin.Parameters.ParamByName('CONTACORRENTE').value := null;

           DM.QR_InsContaFin.Parameters.ParamByName('DV').DataType := ftString;
           If Not DM.QrGeral.FieldByName('DV').Isnull Then
             DM.QR_InsContaFin.Parameters.ParamByName('DV').Value := DM.QrGeral.FieldByName('DV').AsString
           Else
             DM.QR_InsContaFin.Parameters.ParamByName('DV').value := null;

           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAOUSUARIO').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAOUSUARIO').Value := 78;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAODATA').DataType := ftDateTime;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAODATA').Value   := Now;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOPARCELAR').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOPARCELAR').Value      :='N';
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTO').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTO').Value := 1;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOGERARDOCUMENTO').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOGERARDOCUMENTO').Value := 'N';
           DM.QR_InsContaFin.Parameters.ParamByName('NAOCOBRARTARIFA').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOCOBRARTARIFA').Value  := 'N';
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTOPROX').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTOPROX').Value := 1;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOREC').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOREC').Value := 1;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOPAG').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOPAG').Value := 1;
           DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOREC').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOREC').value := null;
           DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOPAG').DataType := ftinteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOPAG').value := null;

           DM.QR_InsContaFin.Parameters.ParamByName('CCNOME').DataType := ftString;
           If Not DM.QrGeral.FieldByName('RESPFIN').Isnull Then
             DM.QR_InsContaFin.Parameters.ParamByName('CCNOME').Value := DM.QrGeral.FieldByName('RESPFIN').AsString
           Else
             DM.QR_InsContaFin.Parameters.ParamByName('CCNOME').value := null;

           DM.QR_InsContaFin.Parameters.ParamByName('CCCPFCNPJ').DataType := ftString;
           If Not DM.QrGeral.FieldByName('CPFRESPFIN').Isnull Then
             DM.QR_InsContaFin.Parameters.ParamByName('CCCPFCNPJ').Value := DM.QrGeral.FieldByName('CPFRESPFIN').AsString
           Else
             DM.QR_InsContaFin.Parameters.ParamByName('CCCPFCNPJ').value := null;

         end
         else //2 = boleto(CSC) - 3=TÍTULO(BENNER)
         begin
           DM.QR_InsContaFin.Parameters.ParamByName('BANCO').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('BANCO').value := null;
           DM.QR_InsContaFin.Parameters.ParamByName('AGENCIA').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('AGENCIA').value := null;
           DM.QR_InsContaFin.Parameters.ParamByName('CONTACORRENTE').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('CONTACORRENTE').value := null;
           DM.QR_InsContaFin.Parameters.ParamByName('DV').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('DV').value := null;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAOUSUARIO').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAOUSUARIO').Value := 78;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAODATA').DataType := ftDateTime;
           DM.QR_InsContaFin.Parameters.ParamByName('INCLUSAODATA').Value   := Now;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOPARCELAR').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOPARCELAR').Value      :='N';
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTO').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTO').Value := 1;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOGERARDOCUMENTO').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOGERARDOCUMENTO').Value := 'N';
           DM.QR_InsContaFin.Parameters.ParamByName('NAOCOBRARTARIFA').DataType := ftString;
           DM.QR_InsContaFin.Parameters.ParamByName('NAOCOBRARTARIFA').Value  := 'N';
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTOPROX').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABINSTRUCAOPARCELAMENTOPROX').Value := 1;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOREC').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOREC').Value := 3;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOPAG').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TABGERACAOPAG').Value := 3;
           DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOREC').DataType := ftInteger;
           DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOPAG').DataType := ftInteger;
           if nHandleContrato in [23,24,37] then //somente para família I e II - email - 02/01/2003
           begin                                 //37 incluído dia 11/01/2008
             DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOREC').Value :=1;
             DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOPAG').Value :=1;
           end
           else
           begin
             DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOREC').value := null;
             DM.QR_InsContaFin.Parameters.ParamByName('TIPODOCUMENTOPAG').value := null;
           end;
         end;
         DM.QR_InsContaFin.Parameters.ParamByName('CCNOME').DataType := ftString;
         If Not DM.QrGeral.FieldByName('RESPFIN').Isnull Then
           DM.QR_InsContaFin.Parameters.ParamByName('CCNOME').Value := DM.QrGeral.FieldByName('RESPFIN').AsString
         Else
           DM.QR_InsContaFin.Parameters.ParamByName('CCNOME').value := null;

         DM.QR_InsContaFin.Parameters.ParamByName('CCCPFCNPJ').DataType := ftString;
         If Not DM.QrGeral.FieldByName('CPFRESPFIN').Isnull Then
           DM.QR_InsContaFin.Parameters.ParamByName('CCCPFCNPJ').Value      := DM.QrGeral.FieldByName('CPFRESPFIN').AsString
         Else
           DM.QR_InsContaFin.Parameters.ParamByName('CCCPFCNPJ').value := null;

         DM.QR_InsContaFin.Parameters.ParamByName('BENEFICIARIODESTINOCOBRANCA').DataType := ftInteger;
         DM.QR_InsContaFin.Parameters.ParamByName('BENEFICIARIODESTINOCOBRANCA').Value := nHandle;
         DM.QR_InsContaFin.Parameters.ParamByName('CARTAOCREDITO').DataType := ftString;
         DM.QR_InsContaFin.Parameters.ParamByName('CARTAOCREDITO').value := null;
         DM.QR_InsContaFin.Parameters.ParamByName('CARTAOOPERADORA').DataType := ftInteger;
         DM.QR_InsContaFin.Parameters.ParamByName('CARTAOOPERADORA').value := null;
         DM.QR_InsContaFin.Parameters.ParamByName('COMPETENCIALIQUIDACAO').DataType := ftDateTime;
         DM.QR_InsContaFin.Parameters.ParamByName('COMPETENCIALIQUIDACAO').value := null;
         DM.QR_InsContaFin.Parameters.ParamByName('CREDITOCONTATERCEIROS').DataType := ftString;
         DM.QR_InsContaFin.Parameters.ParamByName('CREDITOCONTATERCEIROS').value := 'N';
         DM.QR_InsContaFin.Parameters.ParamByName('PERCENTUALDESCONTOFOLHA').DataType := ftFloat;
         DM.QR_InsContaFin.Parameters.ParamByName('PERCENTUALDESCONTOFOLHA').value := 0;

         DM.QR_InsContaFin.ExecSQL;
         nICF:=nICF + 1;
         SGGrade.Cells[5,1]:=IntToStr(nICF);
         SGGrade.Refresh;
      end
      else //UPDATE
      begin
         if not(nHandleContrato in [23,24,7,37]) then //incluído no dia 27/02/08 - E-mail Solange
         begin
            Grava_log('1',IntToStr(nHandle),'CF','I');
            If DM.QrGeral.FieldByname('CSC039WTPOPGTO').AsInteger in [0,1] then //Débito CSC
            begin

               //Registro CSC
               If Not DM.QrGeral.FieldByName('CONTACORRENTE').isnull then
               cRegistroCSC.Add(DM.QrGeral.FieldByName('AGENCIA').AsString+
                                IntToStr(DM.QrGeral.FieldByName('CONTACORRENTE').AsInteger)+
                                DM.QrGeral.FieldByName('DV').AsString);
               //Registro Benner
               cRegistroBenner.Add(DM.QrSaudePro.FieldByName('AGENCIA').AsString+
                                   DM.QrSaudePro.FieldByName('CONTACORRENTE').AsString+
                                   DM.QrSaudePro.FieldByName('DV').AsString);

               if cRegistroCSC.Text <> cRegistroBenner.Text then //Update
               begin
                  DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').DataType := ftInteger;
                  DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').Value := 1;

                  DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').DataType := ftinteger;
                  If Not DM.QrGeral.FieldByName('AGENCIA').Isnull Then
                    DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').Value :=DM.QrGeral.FieldByName('AGENCIA').AsInteger
                  Else
                    DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').value := null;

                  DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').DataType := ftstring;
                  If Not DM.QrGeral.FieldByName('CONTACORRENTE').isnull then
                    DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').Value :=IntToStr(DM.QrGeral.FieldByName('CONTACORRENTE').AsInteger)
                  Else
                    DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').value := null;

                  DM.Qr_UpContaFin.Parameters.ParamByName('DV').DataType := ftString;
                  If Not DM.QrGeral.FieldByName('DV').Isnull Then
                    DM.Qr_UpContaFin.Parameters.ParamByName('DV').Value :=DM.QrGeral.FieldByName('DV').AsString
                  Else
                    DM.Qr_UpContaFin.Parameters.ParamByName('DV').value := null;

                  DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOREC').DataType := ftinteger;
                  DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOPAG').DataType := ftinteger;
                  DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOREC').Value:=1;
                  DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOPAG').Value:=1;

                  DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').DataType := ftString;
                  If Not DM.QrGeral.FieldByName('RESPFIN').Isnull Then
                    DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').Value := DM.QrGeral.FieldByName('RESPFIN').AsString
                  Else
                    DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').value := null;

                  DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').DataType := ftstring;
                  If Not DM.QrGeral.FieldByName('CPFRESPFIN').Isnull Then
                    DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').Value := DM.QrGeral.FieldByName('CPFRESPFIN').AsString
                  Else
                    DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').value := null;

                  DM.Qr_UpContaFin.Parameters.ParamByName('HANDLE').DataType := ftinteger;
                  If Not DM.QrSaudePro.FieldbyName('HANDLE').isnull Then
                    DM.Qr_UpContaFin.Parameters.ParamByName('HANDLE').Value :=DM.QrSaudePro.FieldbyName('HANDLE').AsInteger
                  Else
                    DM.Qr_UpContaFin.Parameters.ParamByName('HANDLE').value := null;

                  DM.Qr_UpContaFin.ExecSql;
                  nUCF:=nUCF + 1;
                  SGGrade.Cells[5,2]:=IntToStr(nUCF);
                  SGGrade.Refresh;
               end;
               cRegistroCSC.Clear;
               cRegistroBenner.Clear;
               //end;

            end
            else  ////2 = boleto(CSC) - 3=TÍTULO(BENNER)
            begin
               Grava_log('1',IntToStr(nHandle),'CF','I');
               DM.Qr_UpContaFin.Parameters.ParamByName('HANDLE').DataType := ftInteger;
               DM.Qr_UpContaFin.Parameters.ParamByName('HANDLE').Value:=DM.QrSaudePro.FieldbyName('HANDLE').AsInteger;
               DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').DataType := ftInteger;
               DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').value := null;
               DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').DataType := ftInteger;
               DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').value := null;
               DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').DataType := ftString;
               DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').value := null;
               DM.Qr_UpContaFin.Parameters.ParamByName('DV').DataType := ftString;
               DM.Qr_UpContaFin.Parameters.ParamByName('DV').value := null;
               DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOREC').DataType := ftinteger;
               DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOREC').Value:=3;
               DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOPAG').DataType := ftinteger;
               DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOPAG').Value:=3;

               DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').DataType := ftString;
               If Not DM.QrGeral.FieldByName('RESPFIN').isnull then
                  DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').Value  := DM.QrGeral.FieldByName('RESPFIN').AsString
               Else
                  DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').value := null;

               DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').DataType := ftstring;
               If Not DM.QrGeral.FieldByName('CPFRESPFIN').Isnull Then
                  DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').Value  := DM.QrGeral.FieldByName('CPFRESPFIN').AsString
               Else
                  DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').value := null;
               //-------- //SC. 109235 - dia 14/02/06 - Érica - manter a mesma
               if nHandleContrato in [23,24,37] then //37 incluído no dia 11/01/08
               begin
                  IF  ((DM.QrSaudePro.FieldByName('TABGERACAOREC').AsInteger = 3) AND
                      (DM.QrSaudePro.FieldByName('TABGERACAOPAG').AsInteger = 1)) then
                  begin //mantém as informações do SOC
                    DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').DataType := ftInteger;
                    If Not DM.QrSaudePro.FieldByName('BANCO').Isnull Then
                       DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').Value :=DM.QrSaudePro.FieldByName('BANCO').AsInteger
                    Else
                       DM.Qr_UpContaFin.Parameters.ParamByName('BANCO').value := null;

                    DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').DataType := ftInteger;
                    If Not DM.QrSaudePro.FieldByName('AGENCIA').Isnull Then
                      DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').Value := DM.QrSaudePro.FieldByName('AGENCIA').AsInteger
                    Else
                      DM.Qr_UpContaFin.Parameters.ParamByName('AGENCIA').value := null;

                    DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').DataType := ftInteger;
                    If Not DM.QrSaudePro.FieldByName('CONTACORRENTE').Isnull Then
                      DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').Value := IntToStr(DM.QrSaudePro.FieldByName('CONTACORRENTE').AsInteger)
                    Else
                      DM.Qr_UpContaFin.Parameters.ParamByName('CONTACORRENTE').value := null;

                    DM.Qr_UpContaFin.Parameters.ParamByName('DV').DataType := ftString;
                    If Not DM.QrSaudePro.FieldByName('DV').Isnull Then
                      DM.Qr_UpContaFin.Parameters.ParamByName('DV').Value :=DM.QrSaudePro.FieldByName('DV').AsString
                    Else
                      DM.Qr_UpContaFin.Parameters.ParamByName('DV').value := null;

                    DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOPAG').DataType := ftInteger;
                    DM.Qr_UpContaFin.Parameters.ParamByName('TABGERACAOPAG').Value := 1;

                    DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').DataType := ftString;
                    If Not DM.QrGeral.FieldByName('RESPFIN').IsNull Then
                      DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').Value := DM.QrGeral.FieldByName('RESPFIN').AsString
                    Else
                      DM.Qr_UpContaFin.Parameters.ParamByName('CCNOME').value := null;

                    DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').DataType := ftString;
                    If Not DM.QrGeral.FieldByName('CPFRESPFIN').IsNull Then
                      DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').Value := DM.QrGeral.FieldByName('CPFRESPFIN').AsString
                    Else
                      DM.Qr_UpContaFin.Parameters.ParamByName('CCCPFCNPJ').value := null;
                  end;
                end;
               //---------------------------------------------------------
               DM.Qr_UpContaFin.ExecSql;
               nUCF:=nUCF + 1;
               SGGrade.Cells[5,2]:=IntToStr(nUCF);
               SGGrade.Refresh;
            end;
         end;
      end;
    Except
        On E:Exception do
        begin
           Grava_log('2',IntToStr(nHandle),'CF','I');
           nECF:=nECF + 1;
           SGGrade.Cells[5,3]:=IntToStr(nECF);
           SGGrade.Refresh;
           RegistraLog(nNrImport,'CONTAFIN PARA BENEFICIÁRIO->'+IntToStr(nHandle)+' '+'HANDLE CONTAFIN->'+inttostr(nMaxContafin)+' '+e.message,'INCLUSAO/ATUALIZACAO SFN_CONTAFIN');
        end;
    end;
end;

//****************************************ENDEREÇOS******************************************

procedure TFrmBeneficiario.Enderecos_Beneficiario_Titular;
{Este processo gera todos os endereços dos Benef.titulares em SAM_ENDERECO
 Lógica -> Faz-se a busca de todos os dados dos endereços;(TCSC039)
           Verifica se existe município válido;(MUNICIPIOBENNER ou MUNICIPIOTCSC004);
           O Handle do endereço é necessariamento o mesmo handle do Benef.;(Regra Criada facilitar a Identificação)
           Verifica se Endereço já Existe.Se False, faz-se a sua inserção - se true
           faz-se o Balance-line para a Atualização}
var cSelectTCSC039,cSqlEndereco: string;
    nIE,nUE,nEE,nReg:integer;
begin
   nIE:=0; nUE:=0; nEE:=0; nReg:=0;
   nNrImport:= AbreLog('SAM_ENDERECO');
   lblImp.Caption:=lblImp.Caption+IntToStr(nNrImport);
   lblImp.Refresh;
   cSqlEndereco:=' SELECT ESTADO,MUNICIPIO,BAIRRO,COMPLEMENTO,NUMERO,'+
                 '        LOGRADOURO,TELEFONE1,TELEFONE2,'+
                 '        FAX,CEP,HANDLE '+
                 '   FROM SOCPRO.SAM_ENDERECO '+
                 '  WHERE HANDLE=:HANDLE';

   cSelectTCSC039:='SELECT SUBSTR(CSC37.CSC037WMTRBENF,1,3) MATR,CSC37.HANDLE BENEFICIARIO, UPPER(CSC039WMUNCORR) CSC039WMUNCORR, '+
                   '       CSC039WUFYCORR, CSC039WBAICORR BAIRRO,CSC039WCEPCORR CEP,'+
                   '       CSC039WENDCORR LOGRADOURO,CSC039WDDDRESI DDDR,CSC039WTELRESI TELEFONE1,'+
                   '       CSC039WDDDCOME DDDC,CSC039WTELCOME TELEFONE2,	CSC039WDDDFAXY DDDF,'+
                   '       CSC039WNROFAXY FAX, NR_LGR NUMERO, TX_CMPT COMPLEMENTO,'+
                   '       ESTADOS.HANDLE ESTADO,'+
                   '       (SELECT MAX(BENNER) HandleMunicipio from SOCPRO.DEPARA_CIDADE Depara where Depara.CSC IN '+
                   '       (SELECT MAX(CSC4.CSC004WCODMUNI) FROM SOCPRO.TCSC004 CSC4 WHERE RTRIM(LTRIM(UPPER(CSC4.CSC004WNOMMUNI))) = RTRIM(LTRIM(UPPER(CSC39.CSC039WMUNCORR))))) MUNICIPIOTCSC004, '+
                   '       (SELECT MAX( MUNI.HANDLE) HANDLEMUNICIPIO FROM MUNICIPIOS MUNI, ESTADOS EST  WHERE  MUNI.ESTADO = EST.HANDLE AND RTRIM(LTRIM(UPPER(MUNI.Z_NOME))) =RTRIM(LTRIM(UPPER(CSC39.CSC039WMUNCORR)))  AND EST.SIGLA = CSC39.CSC039WUFYCORR) MUNICIPIOBENNER, '+
                   '       (select max(muncep.handle) from municipios muncep,tcsc039 csc39 where RTRIM(LTRIM(muncep.cep))=RTRIM(LTRIM(Substr(to_char(csc39.csc039wcepcorr),1,5) || ''-'' || substr(to_char(csc39.csc039wcepcorr),6,3)))) municipiodocep '+
                   '  FROM SOCPRO.TCSC039_DIFF CSC39, TCSC037_DIFF CSC37, ESTADOS '+
                   ' WHERE CSC039WUFYCORR = ESTADOS.SIGLA AND '+
                   '       CSC39.CSC039WMTRBENF = CSC37.CSC037WMTRBENF AND '+
                   '       CSC39.CSC039WNRODEPY = CSC37.CSC037WNRODEPY AND CSC37.HANDLE <> 0 ';

   DM.QrSaudePro.Close;
   DM.QrSaudePro.SQL.Clear;
   DM.QrSaudePro.Sql.Add(cSelectTCSC039);
   DM.QrSaudePro.Open;
   DM.QrSaudePro.DisableControls;
   lblQuery.Caption:=FormatDateTime('hh:nn:ss',now);
   lblQuery.Refresh;
   While not DM.QrSaudePro.Eof do
   begin
      if (not DM.QrSaudePro.FieldByName('MUNICIPIOBENNER').IsNull) or
         (not DM.QrSaudePro.FieldByName('MUNICIPIOTCSC004').IsNull) or
         (not DM.QrSaudePro.FieldByName('MUNICIPIODOCEP').IsNull)then
      begin
          cMunicipio:='';
          if (not DM.QrSaudePro.FieldbyName('MUNICIPIOBENNER').IsNull) then
             cMunicipio:=DM.QrSaudePro.FieldbyName('MUNICIPIOBENNER').AsString
          else if (not DM.QrSaudePro.FieldbyName('MUNICIPIOTCSC004').IsNull) then
             cMunicipio:=DM.QrSaudePro.FieldbyName('MUNICIPIOTCSC004').AsString
          else if (not DM.QrSaudePro.FieldbyName('MUNICIPIODOCEP').IsNull) then
             cMunicipio:=DM.QrSaudePro.FieldbyName('MUNICIPIODOCEP').AsString;


          cCep :='';
          cCEP := RepeatChar(8-Length(Trim(DM.QrSaudePro.FieldByName('CEP').AsString)),'0') + Trim(DM.QrSaudePro.FieldByName('CEP').AsString);
          cCEP := COPY(cCEP,1,5) + '-' + COPY(cCEP,6,3);

          If (Trim(DM.QrSaudePro.FieldByName('DDDR').AsSTRING) = '0') And (Trim(DM.QrSaudePro.FieldByName('TELEFONE1').AsSTRING) = '0') Then
             cTelefone1:= '0'
          Else
             cTelefone1:= Trim(DM.QrSaudePro.FieldByName('DDDR').AsSTRING) + DM.QrSaudePro.FieldByName('TELEFONE1').AsSTRING;

          If (Trim(DM.QrSaudePro.FieldByName('DDDC').AsSTRING) = '0') And (Trim(DM.QrSaudePro.FieldByName('TELEFONE2').AsSTRING) = '0') Then
             cTelefone2:= '0'
          Else
             cTelefone2:= Trim(DM.QrSaudePro.FieldByName('DDDC').AsSTRING) + Trim(DM.QrSaudePro.FieldByName('TELEFONE2').AsSTRING);

          If (Trim(DM.QrSaudePro.FieldByName('DDDF').AsSTRING) = '0') And (Trim(DM.QrSaudePro.FieldByName('FAX').AsSTRING) = '0') Then
             cFax      := '0'
          Else
             cFax      := Trim(DM.QrSaudePro.FieldByName('DDDF').AsSTRING) + Trim(DM.QrSaudePro.FieldByName('FAX').AsSTRING);

          cComplemento:='';
          cComplemento:=Trim(DM.QrSaudePro.FieldByname('COMPLEMENTO').AsString);

          cNumero:=0;
          cNumero:= DM.QrSaudePro.FieldByName('NUMERO').AsInteger;

          Try
            LoadStringQuery(cSqlEndereco);
            DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
            DM.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.QrSaudePro.fieldbyName('BENEFICIARIO').AsInteger;
            DM.QrGeral.Open;

           //Para Testes

           //if DM.QrSaudePro.fieldbyName('BENEFICIARIO').AsInteger = 1821431 then

              //MessageDlg('ENCONTRADO!!!',mtConfirmation, [mbYes, mbNo],0);


            If DM.QrGeral.FieldByName('HANDLE').IsNull then //inclusão do registro
            Begin
              If (Not (DM.QrGeral.Fieldbyname('HANDLE').IsNull)) Then
                 Grava_Log('1',DM.QrGeral.Fieldbyname('HANDLE').AsString,'E','I');
              LoadQuerys('I','E');
              InsertUpdate_Sam_Endereco;
              Inc(nIE);
              SGGrade.Cells[1,1]:=IntToStr(nIE);
              SGGrade.Refresh;
            End
            Else
            begin  //update
               //Balance Line
               //Campos CSC
               //Correção para bloqueio de update nos dados oriundos da internet - 12/11/2008
               if (DM.QrSaudePro.fieldbyName('MATR').AsInteger) > 160 then // Alterado em 08/09/2009
               begin
                 cRegistroCSC.Add(DM.QrSaudePro.FieldbyName('ESTADO').AsString+
                                  cMunicipio+DM.QrSaudePro.FieldbyName('BAIRRO').AsString+
                                  DM.QrSaudePro.FieldbyName('LOGRADOURO').AsString+
                                  cTelefone1+cTelefone2+cFax+cCep);

                 //Campos Benner
                 cRegistroBenner.Add(DM.QrGeral.FieldbyName('ESTADO').AsString+
                                     DM.QrGeral.FieldbyName('MUNICIPIO').AsString+
                                     DM.QrGeral.FieldbyName('BAIRRO').AsString+
                                     DM.QrGeral.FieldbyName('LOGRADOURO').AsString+
                                     DM.QrGeral.Fieldbyname('COMPLEMENTO').AsString+
                                     DM.QrGeral.FieldbyName('TELEFONE1').AsString+
                                     DM.QrGeral.FieldbyName('TELEFONE2').AsString+
                                     DM.QrGeral.FieldbyName('FAX').AsString+
                                     DM.QrGeral.FieldByName('CEP').AsString+
                                     DM.QrGeral.FieldByName('NUMERO').AsString+
                                     DM.QrGeral.FieldByName('COMPLEMENTO').AsString);

                 if cRegistroCSC.Text <> cRegistroBenner.Text then
                 begin
                   Grava_Log('1',DM.QrGeral.Fieldbyname('HANDLE').AsString,'E','U');
                   LoadQuerys('U','E');
                   InsertUpdate_Sam_Endereco;
                   Inc(nUE);
                   SGGrade.Cells[1,2]:=IntToStr(nUE);
                   SGGrade.Refresh;
                 end;
               cRegistroCSC.Clear;
               cRegistroBenner.Clear;
               end
            end;
          Except
             On E:Exception do
             begin
                Grava_Log('2',DM.QrGeral.Fieldbyname('HANDLE').AsString,'E','I');
                Inc(nEE);
                SGGrade.Cells[1,3]:=IntToStr(nEE);
                SGGrade.Refresh;
                RegistraLog(nNrImport,'MUNICIPIO ='+ DM.QrSaudePro.Fieldbyname('MUNICIPIOBENNER').Asstring+' '+E.Message,'INCLUSAO/ATUALIZACAO SAM_ENDERECO');
             end;
          end;
      end
      else
      begin
         Grava_Log('2',DM.QrSaudePro.fieldByName('BENEFICIARIO').AsString,'E','I');
         RegistraLog(nNrImport,'CODIGO MUNICIPIO = NULL/HANDLE END.='+DM.QrSaudePro.fieldByName('BENEFICIARIO').AsString ,'INCLUSAO/ATUALIZACAO SAM_ENDERECO');
         Inc(nEE);
         SGGrade.Cells[1,3]:=IntToStr(nEE);
         SGGrade.Refresh;
      end;

      DM.QrSaudePro.Next;
      Inc(nReg);
      lblProcess.Caption:='Endereços dos Beneficiários - Nr.Reg.Lidos->'+IntToStr(nReg);
      lblProcess.Refresh;
   end;
end;

procedure TFrmBeneficiario.InsertUpdate_Sam_Endereco;
begin
  Try
    DM.QrEndereco.Parameters.ParamByName('ESTADO').DataType := ftinteger;
    If Not DM.QrSaudePro.FieldByName('ESTADO').IsNull Then
      DM.QrEndereco.Parameters.ParamByName('ESTADO').Value := DM.QrSaudePro.FieldByName('ESTADO').AsINTEGER
    Else
      DM.QrEndereco.Parameters.ParamByName('ESTADO').value := null;

    DM.QrEndereco.Parameters.ParamByName('MUNICIPIO').DataType := ftinteger;
    If Trim(cMunicipio) <> '' Then
      DM.QrEndereco.Parameters.ParamByName('MUNICIPIO').Value := StrToInt(cMunicipio)
    Else
      DM.QrEndereco.Parameters.ParamByName('MUNICIPIO').value := null;

    DM.QrEndereco.Parameters.ParamByName('BAIRRO').DataType := ftstring;
    If Not DM.QrSaudePro.FieldByName('BAIRRO').Isnull Then
      DM.QrEndereco.Parameters.ParamByName('BAIRRO').Value := Trim(DM.QrSaudePro.FieldByName('BAIRRO').AsSTRING)
    Else
      DM.QrEndereco.Parameters.ParamByName('BAIRRO').value := null;

    DM.QrEndereco.Parameters.ParamByName('LOGRADOURO').DataType := ftstring;
    If Not DM.QrSaudePro.FieldByName('LOGRADOURO').IsNull Then
      DM.QrEndereco.Parameters.ParamByName('LOGRADOURO').Value:= Copy(Trim(DM.QrSaudePro.FieldByName('LOGRADOURO').AsSTRING),1,50)
    Else
      DM.QrEndereco.Parameters.ParamByName('LOGRADOURO').value := null;

    DM.QrEndereco.Parameters.ParamByName('TELEFONE1').DataType := ftString;
    DM.QrEndereco.Parameters.ParamByName('TELEFONE1').value := cTelefone1;
    DM.QrEndereco.Parameters.ParamByName('TELEFONE2').DataType := ftstring;
    DM.QrEndereco.Parameters.ParamByName('TELEFONE2').value := cTelefone2;
    DM.QrEndereco.Parameters.ParamByName('FAX').DataType := ftstring;
    DM.QrEndereco.Parameters.ParamByName('FAX').value       := cFax;
    DM.QrEndereco.Parameters.ParamByName('CEP').DataType := ftstring;
    DM.QrEndereco.Parameters.ParamByName('CEP').value       := cCep;
    DM.QrEndereco.Parameters.ParamByName('NUMERO').DataType := ftInteger;
    DM.QrEndereco.Parameters.ParamByName('NUMERO').value    := cNumero;
    DM.QrEndereco.Parameters.ParamByName('COMPLEMENTO').DataType := ftstring;
    DM.QrEndereco.Parameters.ParamByName('COMPLEMENTO').value  := cComplemento;

    DM.QrEndereco.Parameters.ParamByName('HANDLE').DataType := ftinteger;
    If Not DM.QrSaudePro.FieldByName('BENEFICIARIO').IsNull Then
      DM.QrEndereco.Parameters.ParamByName('HANDLE').Value   := DM.QrSaudePro.FieldByName('BENEFICIARIO').AsInteger
    Else
      DM.QrEndereco.Parameters.ParamByName('HANDLE').value := null;

    DM.QrEndereco.ExecSql;
  Except
      On E:Exception do
         Begin
            Grava_Log('2',DM.QrGeral.Fieldbyname('HANDLE').AsString,'E','I');
            RegistraLog(nNrImport,'MUNICIPIO ='+ DM.QrSaudePro.Fieldbyname('MUNICIPIOBENNER').Asstring+' '+E.Message,'INCLUSAO/ATUALIZACAO SAM_ENDERECO');
         End;
    End;
End;

//**********************************************INÍCIO***************************************


procedure TFrmBeneficiario.BtnMigrarClick(Sender: TObject);
{Considere DM.AdoQuery como sendo a Query principal que será
 utilizada para trazer os dados principais para a inserção/update
 em sam_matrícula/sam_beneficiário/sam_família.Cada registro é trabalhado como
 um todo,ou seja,prepara-se os campos e faz todas as verificações de inserção/
 update em todas as tabelas correspondentes.O primeiro processo que se faz é a inserção/
 update de todos os endereços dos benef.Titul pois o endereço é fundamental para buscar
 os campos filial de custo e região do benef.Tit e Dep..Após este processo é realizada a
 inserção/update nas demais tabelas relacionadas.}
var cComandoTexto,cSqlM,cSqlB:string;
    nIndice,ncol,nLin,nReg,nDependente,vTeste:integer;
    teste : boolean;
begin
  //Stored Procedure que verifica se o Arquivo de Balance line é o correto
  //ShowMessage('habilitar as linhas comentadas e mudar database');
   DM.SP_DataBalanceLine.Prepared;
   DM.SP_DataBalanceLine.Parameters.Clear;
   DM.SP_DataBalanceLine.Parameters.Refresh;
   DM.SP_DataBalanceLine.Parameters.ParamByName('data').DataType := ftString;
   DM.SP_DataBalanceLine.Parameters.ParamByName('data').Value := '01/01/2100';
   //teste := DM.DBSaude.Connected;
   DM.SP_DataBalanceLine.ExecProc;
   cDataArquivo:=DM.SP_DataBalanceLine.Parameters.ParamByName('data').Value;
   cDataComp:='01/01/2010';
   Contador:=1;

   //if MessageDlg('Data do Arquivo de Balance Line ->'+DM.SP_DataBalanceLine.Parameters.ParamByName('data').AsString+'.Continuar?',mtConfirmation, [mbYes, mbNo],0) = mrYes then  // Control-M - Sai
   //begin  // Control-M - Sai
     //Execução da Stored Procedure CARGA_CSC

     if not(CBTEmp.Checked) then
     //if (CBTEmp.Checked) then //temporario
     begin
         lblProcess.Caption:='Executando Stored Procedure CARGA_CSC...';
         lblProcess.Refresh;
         DM.SPCarga_CSC.Prepared;
         DM.SPCarga_CSC.Parameters.Clear;
         DM.SPCarga_CSC.Parameters.Refresh;
         DM.SPCarga_CSC.ExecProc;
     end;

     //deletar a tabela migdetlogbenner - tabela de log do balance line
     Dm.QrySaudePro14.SQL.Clear;
     Dm.QrySaudePro14.SQL.Add('delete from migdetlogbenner');
     DM.QrySaudePro14.ExecSQL;

     //Atualizar_Funci_Adm;  //retirado dia 18/01/2010
     //ATUALIZAR_TIPOPDEP_FUNCCASSI;//implementado dia 18/04/08    //retirado dia 18/01/2010

      //Endereços dos Beneficiários
     if CBEnd.Checked then
     //if not(CBEnd.Checked) then //sem endereço
     begin
        lblhorasI.Caption:=FormatDateTime('hh:nn:ss',now);
        lblhorasI.Refresh;
        lblProcess.Caption:='Preparando os dados...';
        lblProcess.Refresh;
        Enderecos_Beneficiario_Titular;
        lblhorasF.Caption:=FormatDateTime('hh:nn:ss',now);
     end;

     //
     cSqlM:='SELECT HANDLE,NOME,SEXO,CPF,DATANASCIMENTO,DATAINGRESSO,NOMEMAE'+
            '  FROM SOCPRO.SAM_MATRICULA WHERE HANDLE=:HANDLE';

     cSqlB:=' SELECT HANDLE,CONTRATO,FAMILIA,CODIGODEPENDENTE,BENEFICIARIO, AGENCIAINCLUSAO,'+
            '        VIACARTAO,DVCARTAO,MATRICULA,NOME,EHTITULAR,matriculacassi,RECEBIMENTOINSS,'+
            '        TIPODEPENDENTE,ESTADOCIVIL,NAOTEMCARENCIA,DIASCOMPRACARENCIA,'+
            '        DATAADESAO,DATAPRIMEIRAADESAO,DATABLOQUEIO,PERMITEADIANTAMENTO,PERMITEREEMBOLSO,'+
            '        DATACANCELAMENTO,MOTIVOBLOQUEIO,MOTIVOCANCELAMENTO,ENDERECOCORRESPONDENCIA,'+
            '        CARTAOIDENTIFICACAO,INFORMATIVOS,CELULAR,EMAIL,PAGERCENTRAL,PAGER,CBO, INCLUSAOPOR,'+
            '        CODIGODEORIGEM,CODIGODEREPASSE,MATRICULAFUNCIONAL,SITUACAORH,NAOFATURARMODULOS,'+
            '        NAOFATURARGUIAS,CODIGOTABELAPRC,DIREITOAADIANTAMENTO,LIMITEADIANTAMENTO,FILIALCUSTO,'+
            '        REGIAO,TIPODEFICIENCIA,GRAUDEDEPENDENCIA,DATAADOCAO,BENEFICIARIOINDICADOR,MATRICULAINDICADORA,CODIGOANTIGO,INCLUSAODATA,PARENTESCO,DEMONSTRATIVOFINANCEIROINDIVID '+
            '   FROM SOCPRO.SAM_BENEFICIARIO WHERE HANDLE=:HANDLE';
     cSqlF:=' SELECT HANDLE,CONTRATO,FAMILIA,DATAADESAO,DATAULTIMOREAJUSTE,'+
            '        DATACANCELAMENTO,MOTIVOCANCELAMENTO,DATABLOQUEIO,MOTIVOBLOQUEIO,'+
            '        LOTACAO,SECAO,NAOINCLUIRBENEFICIARIO,TITULARRESPONSAVEL,CARTAOIDENTIFICACAO,'+
            '        COBRANCA,INFORMATIVOS,COBRANCANOMESSEGUINTE,COBRANCADEEVENTO,'+
            '        ULTIMODEPENDENTE,DIACOBRANCA,DIACOBRANCAORIGINAL,EXTRATOUTILIZACAO,USUARIOINCLUSAO,DATAALTERACAO, '+
            '        USUARIOALTERACAO,DEMONSTRATIVOEMAIL,PROXIMOVENCIMENTO '+
            '   FROM SOCPRO.SAM_FAMILIA WHERE HANDLE=:HANDLE';
     lblhorasI.Caption:=FormatDateTime('hh:nn:ss',now);
     lblhorasI.Refresh;
     nNrImport      := FrmBeneficiario.AbreLog('SAM_MATRICULA/SAM_BENEFICIARIO/SAM_FAMILIA');

     lblImp.Caption:='';
     lblImp.Caption:=lblImp.Caption + IntToStr(nNrImport);
     lblImp.Refresh;

     if Trim(CboContrato.Text)= '' then
     begin
        nIndice:=0;
        CBoContrato.ItemIndex:=nIndice;
        CboContrato.Refresh;
     end
     else
        nIndice:=CboContrato.ItemIndex;

     While nIndice <= CboContrato.Items.Count-1 do //Fazer o Loop em todos os contratos
     begin
        For nCol:=1 to SGGrade.ColCount - 1 do
          For nLin:=1 to SGGRade.RowCount -1 do
              SGGrade.Cells[nCol,nLin]:='0';

        DM.QrUpBalanceLine.Close;
        Dm.QrUpBalanceLine.Parameters.ParamByName('descricao').value  :=CboContrato.Text+' DIFF ';
        Dm.QrUpBalanceLine.Parameters.ParamByName('horainicial').value:=now;
        DM.QrUpBalanceLine.Parameters.ParamByName('HORAFINAL').value  :=now;
        DM.QrUpBalanceLine.ExecSQL;

        nIM:=0;  nUM:=0;   nEM:=0;
        nIB:=0;  nUB:=0;   nEB:=0;
        nIF:=0;  nUF:=0;   nEF:=0;
        nICF:=0;  nUCF:=0;   nECF:=0;
        nIMod:=0;  nUMod:=0;   nEMod:=0;
        nIDoc:=0;  nUDoc:=0;   nEDoc:=0;

        nHandleContrato:= StrToInt(copy(CboContrato.Text,1,3));
        nMaxCarencia:=MaxHandleCarencia;
        //Buscar dados do Contrato
        LoadStringQuery('SELECT COBRANCA,NAOTEMCARENCIA,DATAADESAO,PERMITEREEMBOLSO FROM SOCPRO.SAM_CONTRATO WHERE HANDLE=:HANDLE');
        DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
        DM.QrGeral.Parameters.ParamByName('HANDLE').Value := nHandleContrato;
        DM.QrGeral.Open;
        cCobrancaDef:=DM.QrGeral.fieldbyName('COBRANCA').AsString;
        cCarenciaDef:=DM.QrGeral.Fieldbyname('NAOTEMCARENCIA').AsString;
        cDataAdesaoContrato:=Dm.QrGeral.FieldByName('dataadesao').AsString;
        cPermiteReembolso  :=Dm.QrGeral.FieldByName('PERMITEREEMBOLSO').AsString;
        //Seção
        LoadStringQuery('SELECT HANDLE FROM SOCPRO.SAM_CONTRATO_SECAO WHERE CONTRATO=:CONTRATO ');
        DM.QrGeral.Parameters.ParamByName('CONTRATO').DataType := ftinteger;
        DM.QrGeral.Parameters.ParamByName('CONTRATO').Value := nHandlecontrato;
        DM.QrGeral.Open;
        nSecaoDef:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;


        //SUSPENSAO     SAM0189
{        nMaxHandleSusp:=0;
        LoadStringQuery('SELECT MAX(HANDLE) MAXH FROM SOCPRO.SAM_BENEFICIARIO_SUSPENSAO ');
        DM.QrGeral.Open;
        if not DM.QrGeral.Fieldbyname('MAXH').IsNull then
           nMaxHandleSusp:=DM.QrGeral.Fieldbyname('MAXH').AsInteger;}
        //Conta financeira
        {nMaxContaFin:=0;
        //LoadStringQuery('SELECT MAX(HANDLE) MAXH FROM SOCPRO.SFN_CONTAFIN ');
        LoadStringQuery('SELECT SEQ_CONTAFIN01.nextval MAXH FROM DUAL'); //Marcelo Barbosa - 12/08/2010
        DM.QrGeral.Open;
        if not DM.QrGeral.Fieldbyname('MAXH').IsNull then
           nMaxContaFin:=DM.QrGeral.Fieldbyname('MAXH').AsInteger;}

        if not(nHandleContrato in [2,28,35]) then //Associados e func.cassi - Serviço Próprio
        begin
           //Lotacao
           LoadStringQuery('SELECT HANDLE FROM SOCPRO.SAM_CONTRATO_LOTACAO WHERE CONTRATO=:CONTRATO ');
           DM.QrGeral.Parameters.ParamByName('CONTRATO').DataType := ftInteger;
           DM.QrGeral.Parameters.ParamByName('CONTRATO').Value := nHandlecontrato;
           DM.QrGeral.Open;
           nLotacaoDef:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
        end;
        nContrato      := StrToInt(copy(CboContrato.Text,5,3));
        cContrato      := IntToStr(nContrato);
        if Length(cContrato) < 3 then
           cContrato:=RepeatChar(3-length(cContrato),'0')+cContrato;
        nPlano         := StrToInt(copy(RetornaPlanoGrupo(nContrato),1,3));
        nGrupo         := StrToInt(copy(RetornaPlanoGrupo(nContrato),4,3));

        //Montar os Scripts das Query's de acordo com cada plano e grupo
        cComandoTexto:='';
        cComandoTexto:='SELECT A.HANDLE,A.CSC037WMTRBENF,A.CSC037WNRODEPY,A.CSC037WINDMOTV,A.CSC037WINDSITY,'+
                       '       A.CSC037WMTRREFR,A.CSC037WSEQTITL,A.CSC037WNOMBENF,A.CSC037WINDSEXO,'+
                       '       A.CSC037WDMANASC,A.CSC037WDMACADY,A.CSC037WCODVINC,A.CSC037WINDECIV,'+
                       '       A.CSC037WDMAFIMYDRTO,A.CSC037WCODSITU,CSC037WDMAADCAO ,B.CSC039WENDTRAB,'+
                      { '       A.CSC037WDMAFIMYDRTO,A.CSC037WCODSITU,TO_CHAR(A.CSC037WDMAADCAO) CSC037WDMAADCAO ,B.CSC039WENDTRAB,'+}
                       '       A.CSC037WINDSITY,A.CSC037WNROCART,B.CSC039WMTRANTE,B.CSC039WDEPANTE, '+
                       '       A.CSC037WDMAINICSUSP,A.CSC037WDMAFIMYSUSP,B.CSC039WOPCTRNS,REPLACE(A.CSC037WNOMREDZ,chr(0),'''') CSC037WNOMREDZ,B.TX_RCBR_INFM'+
                       '  FROM SOCPRO.TCSC037_DIFF A,'+
                       '       TCSC039_DIFF B ';

        cComandoTexto:=cComandoTexto+' WHERE B.CSC039WMTRBENF=A.CSC037WMTRBENF AND'+
                                     '       A.CSC037WCODVINC <> 97 AND A.HANDLE <> 0 ';
        if nContrato=30 then//Aposentados
           cComandoTexto:=cComandoTexto +' AND B.CSC039WNRODEPY=A.CSC037WSEQTITL '+
                                         ' AND A.CSC037WCODGRPOBENF ='+IntToStr(nGrupo)+
                                         ' AND NOT EXISTS (SELECT C.HANDLE '+    //Elimina os Dep.Indiretos - mesmo Grupo
                                         '                        FROM SOCPRO.TCSC037_DIFF C,'+
                                         '                             TCSC039_DIFF D '+
                                         '                       WHERE D.CSC039WMTRBENF=C.CSC037WMTRBENF'+
                                         '                             AND C.CSC037WNRODEPY <> C.CSC037WSEQTITL'+
                                         '                             AND C.CSC037WNRODEPY = D.CSC039WNRODEPY'+
                                         '                             AND D.CSC039WCODPLAN IN (1,2) AND a.handle = c.handle)'
        else if nContrato=1 then //Associados
          cComandoTexto:=cComandoTexto + ' AND B.CSC039WNRODEPY=A.CSC037WSEQTITL '+
                                         ' AND A.CSC037WCODGRPOBENF ='+IntToStr(nGrupo)+
                                         //' AND A.CSC037WCODSITU NOT IN (831) '+ //ELIMINAR OS PDE's
                                         ' AND NOT EXISTS (SELECT C.HANDLE '+    //Elimina os Dep.Indiretos - mesmo Grupo
                                         '                        FROM SOCPRO.TCSC037_DIFF C,'+
                                         '                             TCSC039_DIFF D '+
                                         '                       WHERE D.CSC039WMTRBENF=C.CSC037WMTRBENF'+
                                         '                             AND C.CSC037WNRODEPY <> C.CSC037WSEQTITL'+
                                         '                             AND C.CSC037WNRODEPY = D.CSC039WNRODEPY'+
                                         '                             AND D.CSC039WCODPLAN IN (1,2) AND a.handle = c.handle )'
        else if nContrato=2 then//Depend. Indiretos
          cComandoTexto:=cComandoTexto + 'AND A.CSC037WNRODEPY <> A.CSC037WSEQTITL '+
                                         'AND A.CSC037WNRODEPY = B.CSC039WNRODEPY  '+
                                         'AND B.CSC039WCODPLAN  IN (1,2)'+
                                         'AND A.HANDLE NOT IN (SELECT HANDLE FROM SOCPRO.SAM_BENEFICIARIO WHERE HANDLE = A.HANDLE AND (DATACANCELAMENTO IS NOT NULL AND MOTIVOCANCELAMENTO = 5))'
        else //Outros
           cComandoTexto:=cComandoTexto +' AND B.CSC039WNRODEPY=A.CSC037WSEQTITL '+
                                         ' AND A.CSC037WCODGRPOBENF ='+IntToStr(nGrupo);
        if nPlano <> 824 then //<> Família PAQ
        begin
           if nContrato <> 2 then  //Dep Ind.
               if nPlano <> 831 then //PDE - o Plano não será utilizado
                  if nPlano <> 803 then // PAI  - O plano não será utilizado
                     if nPlano <> 101 then //alterado dia 07/11/2006
                        cComandoTexto := cComandoTexto + ' AND B.CSC039WCODPLAN = ' + inttostr(nPlano)
                     else //alterado dia 07/11/2006
                        cComandoTexto := cComandoTexto + ' AND B.CSC039WCODPLAN in (101,150,160) '; //nova matricula familia 160 - wilson aqui

           if nPlano=831 then //PDE
               cComandoTexto := cComandoTexto + ' AND ( (A.CSC037WCODSITU=831 and sysdate <= (csc039wdmavigepgto + 366)) or (b.CSC039WCODOCUP=831 and sysdate <= (csc039wdmavigepgto + 366)) )';

           if nPlano=803 then //PAI
               cComandoTexto := cComandoTexto + ' AND A.CSC037WCODSITU=803 ';

           if nPlano=80 then //Paraguaios --incluído dia 31/05/2005
              cComandoTexto := cComandoTexto + ' AND A.CSC037WCODSITU=600 ';

           if (nPlano = 100) then
               cComandoTexto := cComandoTexto + ' AND B.CSC039WDMAVIGEPGTO < ''15-JUN-1999'' AND A.CSC037WCODSITU <> 831 AND B.CSC039WCODOCUP <> 831 '
           else if (nPlano = 101) then
              cComandoTexto := cComandoTexto + ' and (B.CSC039WDMAVIGEPGTO >= ''15-JUN-1999'') AND A.CSC037WCODSITU <> 831 AND B.CSC039WCODOCUP <> 831 '+
                                               ' and not exists (SELECT ''1'' FROM SOCPRO.TCSC037_DIFF A1 '+          //excluir os PAQ
                                               '                                      JOIN SOCPRO.TCSC039_DIFF B1 ON A1.CSC037WMTRBENF=CSC039WMTRBENF AND '+
                                               '                                                        A1.CSC037WNRODEPY=B1.CSC039WNRODEPY '+
                                               '                        WHERE CSC039WCODOCUP=824 and sysdate <= (csc039wdmavigepgto + 366) and '+
                                               '                              CSC039WDMAVIGEpgto>=''01/01/2004'' AND ( (SUBSTR(CSC037WMTRBENF,1,3)=''120'') OR ((SUBSTR(CSC037WMTRBENF,1,3)=''150'') OR (SUBSTR(CSC037WMTRBENF,1,3)=''160'')OR (SUBSTR(CSC037WMTRBENF,1,3)=''170'')))  '+ //OR-ALTERADO DIA 07/11/06 //familia 160 - wilson aqui
                                               '                              AND A.HANDLE=A1.HANDLE) '+
                                               ' union '+    //02/09/2004 - Migrar os PDE onde a data atual seja maior que a data de adesão + 366 dias ( O beneficiário tem que pagar a mensalidade)
                                               ' select A.HANDLE,A.CSC037WMTRBENF,A.CSC037WNRODEPY,A.CSC037WINDMOTV,A.CSC037WINDSITY,'+
                                               '        A.CSC037WMTRREFR,A.CSC037WSEQTITL,A.CSC037WNOMBENF,A.CSC037WINDSEXO,'+
                                               '        A.CSC037WDMANASC,A.CSC037WDMACADY,A.CSC037WCODVINC,A.CSC037WINDECIV,'+
                                               '        A.CSC037WDMAFIMYDRTO,A.CSC037WCODSITU,CSC037WDMAADCAO ,B.CSC039WENDTRAB,'+
                                               {'        A.CSC037WDMAFIMYDRTO,A.CSC037WCODSITU,TO_CHAR(A.CSC037WDMAADCAO) CSC037WDMAADCAO ,B.CSC039WENDTRAB,'+}
                                               '        A.CSC037WINDSITY,A.CSC037WNROCART,B.CSC039WMTRANTE,B.CSC039WDEPANTE,'+
                                               '        A.CSC037WDMAINICSUSP,A.CSC037WDMAFIMYSUSP,B.CSC039WOPCTRNS,REPLACE(A.CSC037WNOMREDZ,chr(0),'''') CSC037WNOMREDZ,B.TX_RCBR_INFM '+
                                               '    FROM  TCSC037_diff A,'+
                                               '          TCSC039_diff B'+
                                               '   WHERE B.CSC039WMTRBENF=A.CSC037WMTRBENF AND'+
                                               '         A.CSC037WCODVINC <> 97 AND A.HANDLE <> 0'+
                                               '         AND B.CSC039WNRODEPY=A.CSC037WSEQTITL'+
                                               '         AND A.CSC037WCODGRPOBENF =5'+
                                               '         AND ( (A.CSC037WCODSITU=831 and sysdate >= (csc039wdmavigepgto + 366)) or (b.CSC039WCODOCUP=831 and sysdate >= (csc039wdmavigepgto + 366)) )';
        end
        else //Família PAQ
           ccomandoTexto  := cComandoTexto + ' and ((SUBSTR(csc037wmtrbenf,1,3) = ''120'') OR ((SUBSTR(CSC037WMTRBENF,1,3)=''150'')OR(SUBSTR(CSC037WMTRBENF,1,3)=''160'')OR(SUBSTR(CSC037WMTRBENF,1,3)=''170'')))and CSC039WDMAVIGEPGTO >=''01/01/2004'' '+//ALTERADO DIA 07/11/2006 - INCLUSÃO DO OR
                                             '  and csc037wmtrrefr in ( select csc039wmtrbenf '+   //INCLUÍDO CONFORME E-MAIL ALEXANDRE PAREDES
                                             '                            FROM SOCPRO.TCSC037_diff A, '+
                                             '                                 TCSC039_diff B   '+
                                             '                           WHERE B.CSC039WMTRBENF=A.CSC037WMTRBENF AND '+
                                             '                                 A.CSC037WCODVINC <> 97 AND A.HANDLE <> 0 '+
                                             '                                 AND B.CSC039WNRODEPY=A.CSC037WSEQTITL    '+
                                             '                                 and csc039wcodocup=824 and sysdate <= (csc039wdmavigepgto + 366) ) ';
        if nContrato = 130 then //FUNCI CASSI ADM
           cComandoTexto:=cComandoTexto + ' AND SERVICOPROPRIO=0 '
        else if nContrato=131 then //FUNCI CASSI - SERVIÇO PROPRIO
           cComandoTexto:=cComandoTexto + ' AND SERVICOPROPRIO=1 ';

        //ccomandotexto:=cComandoTexto + 'and a.handle not in (select handle from benner.sam_beneficiario where contrato='+IntToStr(nHandleContrato)+')';

        If nContrato=2 then //Dep.Indireto --Habilitar quando for rodar o balance line full
          cComandoTexto:=cComandoTexto + ' ORDER BY A.CSC037WMTRBENF,A.CSC037WNRODEPY,A.CSC037WNOMBENF ';

        With DM.AdoQuery do
        begin
           //Active:=false;
           Close;
           Sql.Clear;
           SQL.Add(cComandoTexto);
           try
             //Active:=true;
             open;
           except
             if DM.AdoQuery.IsEmpty then
                Raise;
           end;
           DisableControls;
           lblQuery.Caption:=FormatDateTime('hh:nn:ss',now);
           lblQuery.Refresh;
           lblhorasF.Caption:='';
           //DM.Adoquery.First;
        end;
        //showMessage(ccomandotexto);
        nReg:=0;
        //Dep.Indireto -
        if nHandleContrato=7 then
        begin
           ///cMatAtual    :=RepeatChar(9-length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
           ///               Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString);
           cMatAtual    :=RepeatChar(9-length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
                          Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString);
           cMatAnterior :=cMatAtual;
        end;



        While Not DM.AdoQuery.Eof do //While na Query Principal - cada registro contém todos os campos da migração
        begin

           //Verificar na tabela de handle migrado se o mesmo existe
           DM.QrHMigrado.Close;
           DM.QrHMigrado.SQL.Clear;
           DM.QrHMigrado.SQL.Add('select handle from mighandlemigrado where handle=:vhandle');
           DM.Qrhmigrado.Parameters.ParamByName('vhandle').DataType := ftInteger;
           DM.Qrhmigrado.Parameters.ParamByName('vhandle').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
           DM.QrHMigrado.Open;

           if DM.Qrhmigrado.fieldByName('handle').Isnull then //inserir na tabela mighandlemigrado
           begin
             DM.QrInsHMigrado.Close;
             DM.QrInsHMigrado.SQL.Clear;
             DM.QrInsHMigrado.sql.Add('INSERT INTO MIGHANDLEMIGRADO(HANDLE) VALUES(:HANDLE)');
             DM.QrInsHMigrado.Parameters.ParamByName('HANDLE').DataType := ftInteger;
             DM.QrInsHMigrado.Parameters.ParamByName('HANDLE').Value :=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
             DM.QrINsHMigrado.ExecSql;

               lblProcess.Caption:='HANDLE->'+DM.Adoquery.Fieldbyname('HANDLE').AsString;
               ///lblProcess.Caption:='HANDLE->'+DM.Adoquery.Fieldbyname('HANDLE').AsString;
                                   //' BENEF.: '+cNome;
               lblProcess.Refresh;

               if nHandleContrato=30 then //contratos exonerados - S.C. 201.798 - mantê-los no contrato associados e cancelá-los - alterado 18/02/2008
               begin
                  CancelarAssociadoExonerado(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                  if DM.Adoquery.Fieldbyname('CSC037WCODVINC').value > -1 then
                  begin
                     LoadStringQuery('UPDATE SOCPRO.SAM_BENEFICIARIO SET TIPODEPENDENTE=:DEP WHERE HANDLE=:HANDLE');
                     DM.QrGeral.Parameters.ParamByName('DEP').DataType := ftInteger;
                     DM.QrGeral.Parameters.ParamByName('DEP').Value := Find_CodVinculo(DM.Adoquery.Fieldbyname('CSC037WCODVINC').AsInteger);
                     DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                     DM.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                     DM.QrGeral.ExecSQL;
                  end;
               end
               else If Validou_Funci_Cassi(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString) then
               begin
                  Preparar_Campos_Registro;

                  cCodTabPreco:='P';
                  if (not DM.Adoquery.Fieldbyname('CSC039WOPCTRNS').IsNull) and
                     (Trim(DM.Adoquery.Fieldbyname('CSC039WOPCTRNS').AsString)<>'') and
                     (Trim(DM.Adoquery.Fieldbyname('CSC039WOPCTRNS').AsString)<>'0') then
                     cCodTabPreco:=DM.Adoquery.Fieldbyname('CSC039WOPCTRNS').AsString;

                  //Matrícula
                  LoadStringQuery(cSqlM);
                  ///Dm.QrGeral.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                  Dm.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;                  ///
                  Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                  //DM.QrGeral.Open;
                  DM.QrGeral.Open;

                  If DM.QrGeral.FieldByName('HANDLE').IsNull then
                     Begin
                        If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                           Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'M','I');
                        LoadQuerys('I','M');
                        InsertUpdate_Matricula('I');
                        Inc(nIM);
                        SGGrade.Cells[2,1]:=IntToStr(nIM);
                        SGGrade.Refresh;
                     End
                  Else
                  begin
                     If not Balance_line('M') then
                     begin
                     //Correção para bloqueio de update no CPF para Associados Titular - 12/01/2009
                     If cTitu='S' then
                       If (nhandleContrato in [6,30]) then //Atualizado 09/03/2009 - Retirados Contratos 2,4 29/09/2009
                        begin
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'C','U');
                          LoadQuerys('UA','C');
                          Update_Matricula_CPF('U');
                          Inc(nUM);
                          SGGrade.Cells[2,2]:=IntToStr(nUM);
                          SGGrade.Refresh;
                        end;
                     //Correção para bloqueio de update nos dados oriundos da internet - 12/11/2008
                     If (nhandleContrato in [2,4,5,6,7,25,30,32,37,40,43,46,61]) then //retirado dos contratos 23,24,28,35 em 11/05/2009
                        begin
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'M','U');
                          LoadQuerys('UA','M');
                          Update_Matricula_Internet('U');
                          Inc(nUM);
                          SGGrade.Cells[2,2]:=IntToStr(nUM);
                          SGGrade.Refresh;
                        end
                     else
                        If not (nhandleContrato in [23,24]) Then
                        begin
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'M','U');
                          LoadQuerys('U','M');
                          InsertUpdate_Matricula('U');
                          Inc(nUM);
                          SGGrade.Cells[2,2]:=IntToStr(nUM);
                          SGGrade.Refresh;
                        end
                     end;
                  end;

                  //Beneficiário
                  //cMemoAnotacao:='';
                  LoadStringQuery(cSqlB);
                  ///Dm.QrGeral.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                  Dm.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                  Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                  DM.QrGeral.Open;
                  cNaoFaturarModulos:='N';
                  If DM.QrGeral.FieldByName('HANDLE').IsNull then
                     Begin
                        If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                           Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','I');
                        LoadQuerys('I','B');
                        If (nhandleContrato in [24,37]) then // Atualizado em 29/09/2009
                           Begin
                              InsertUpdate_Beneficiario_Familia
                           End
                        Else
                           Begin
                              InsertUpdate_Beneficiario('I');
                           End;

                     InsertFamilia_Novo; //19/05/2009
                     Inc(nIB);
                     SGGrade.Cells[3,1]:=IntToStr(nIB);
                     SGGrade.Refresh;
                     if lInseriuBeneficiario then
                     begin
                        //Procedure que atualiza a data de adesão de acordo com a SFN_DOCUMENTO_BAIXA (data de retorno da baixa)
                        //if nHandleContrato in [24,37] then //37 incluído no dia 11/01/2008
                        //begin
                        //   DM.SP_ATUALIZAR_DATA_ADESAO.PREPARE;
                        //   DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.ParamByName('V_HANDLE').AsInteger   :=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                        //   DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.ParamByName('V_MATRICULA').AsString :=cCodAfinidade;
                        //   DM.SP_Atualizar_Data_adesao.Parameters.ParamByName('V_DATAADESAO').AsString:=FormatDateTime('dd/mm/yyyy',StrToDateTime(cDataAdesao));
                        //   DM.SP_Atualizar_Data_adesao.EXECPROC;
                        //end;

                        if (trim(cDescontoEscalonado)='N') and (nHandleContrato=24) then
                        begin
                           ///Inserir_limitacao(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                           Inserir_limitacao(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                           //Inc(nMaxCarencia);
                           ///InserirCarencia(nMaxCarencia,DM.Adoquery.Fieldbyname('HANDLE').AsInteger,20);//PSF - 030 DIAS - Consultas
                           //InserirCarencia(nMaxCarencia,DM.Adoquery.Fieldbyname('HANDLE').AsInteger,20);//PSF - 030 DIAS - Consultas
                        end;
                        if nContrato=1 then //Associados
                           Tratar_CBO;
                        if Trim(cMemoAnotacao)<>'' then
                           Inserir_AnotAdm_Beneficiario(1);
                        //Inserir anotação para data de adesão menor que a data do contrato
                        if StrToDateTime(cDataAdesao) < StrToDateTime(cDataAdesaoContrato) then
                           Inserir_AnotAdm_Beneficiario(2);
                     end;
                  end
                  else
                  begin
                     if not DM.QrGeral.FieldByName('NAOFATURARMODULOS').IsNull then
                       cNaoFaturarModulos:=DM.QrGeral.FieldByName('NAOFATURARMODULOS').AsString
                     else
                       cNaoFaturarModulos:='N';
                     If not Balance_Line('B') then
                        Begin
                        //Correção para bloqueio de update nos dados oriundos da internet - 12/11/2008
                        If (nhandleContrato in [2,4,5,6,7,25,30,32,37,40,43,46,61]) then  //retirado dos contratos 23,24,28,35 em 11/05/2009
                        Begin
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                          LoadQuerys('UA','B');
                          Update_Beneficiario_Internet;
                          Inc(nUB);
                          SGGrade.Cells[3,2]:=IntToStr(nUB);
                          SGGrade.Refresh;
                          if Trim(cMemoAnotacao)<>'' then
                            Inserir_AnotAdm_Beneficiario(1);
                        end
                        else
                        If not (nhandleContrato in [23,24]) then
                        begin
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                          LoadQuerys('U','B');
                          InsertUpdate_Beneficiario('U');
                          Inc(nUB);
                          SGGrade.Cells[3,2]:=IntToStr(nUB);
                          SGGrade.Refresh;
                          if Trim(cMemoAnotacao)<>'' then
                             Inserir_AnotAdm_Beneficiario(1);
                        end;
                     end;
                  end;

                  //Inserção da Filial-Região-Endereço-Conta Financeira-Módulos-Documentos
                  LoadStringQuery('SELECT HANDLE,TIPODEPENDENTE FROM SOCPRO.SAM_BENEFICIARIO WHERE HANDLE=:HANDLE');
                  ///DM.QrGeral.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                  DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                  DM.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;

                  DM.QrGeral.Open;
                  if not DM.QrGeral.Fieldbyname('HANDLE').IsNull then
                  begin
                     nDependente:=-1;
                     if not DM.QrGeral.Fieldbyname('TIPODEPENDENTE').IsNull then
                        nDependente:=DM.QrGeral.Fieldbyname('TIPODEPENDENTE').AsInteger;

                     if cTitu='S' then //é Titular
                     begin
                        Filial_Regiao_Endereco(DM.QrGeral.Fieldbyname('HANDLE').AsInteger,DM.QrGeral.Fieldbyname('HANDLE').AsInteger);
                        ///Conta_Financeira(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                        Conta_Financeira(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                     end
                     else
                     begin
                        if Trim(cHandleFamilia) <> '' then
                           //Filial_Regiao_Endereco(StrToInt(cHandleFamilia),DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                           Filial_Regiao_Endereco(StrToInt(cHandleFamilia),DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                     end;
                     ///Modulos_Beneficiario(DM.Adoquery.Fieldbyname('HANDLE').AsInteger,nHandlecontrato);
                     Modulos_Beneficiario(DM.Adoquery.Fieldbyname('HANDLE').AsInteger,nHandlecontrato);

                     if nDependente <> -1 then //Dependente Válido
                        ///Documentos_Entregues(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                        Documentos_Entregues(DM.Adoquery.Fieldbyname('HANDLE').AsInteger);
                  end;

                  //Família
                  if not (nContrato in [130,131]) then
                     cFamiliaTit:='';
                  If Not(nPlano in [1,110]) then //Diferente de Func.Cassi e Dep.Indiretos
                  begin
                     if (DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger)=
                        (DM.Adoquery.Fieldbyname('CSC037WNRODEPY').AsInteger) then //É Titular
                     begin
                        LoadStringQuery(cSqlF);
                        Dm.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftString;
                        Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                        DM.QrGeral.Open;

                        nHandleFamilia:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
                        if DM.QrGeral.FieldByName('HANDLE').IsNull then //Inserção
                        begin
                           If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                               Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','I');
                           LoadQuerys('I','F');
                           InsertUpdate_Familia('I','T');
                           //Procedure que atualiza a data de adesão de acordo com a SFN_DOCUMENTO_BAIXA (data de retorno da baixa)
                           If nHandleContrato in [24,37] then //37 incluído no dia 11/01/2008
                             begin
                               DM.SP_ATUALIZAR_DATA_ADESAO.PREPARED;
                               DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.Clear;
                               DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.Refresh;
                               DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.ParamByName('V_HANDLE').DataType := ftInteger;
                               DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.ParamByName('V_HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                               DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.ParamByName('V_MATRICULA').DataType := ftString;
                               DM.SP_ATUALIZAR_DATA_ADESAO.Parameters.ParamByName('V_MATRICULA').Value :=cCodAfinidade;
                               DM.SP_Atualizar_Data_adesao.Parameters.ParamByName('V_DATAADESAO').DataType := ftString;
                               DM.SP_Atualizar_Data_adesao.Parameters.ParamByName('V_DATAADESAO').Value := FormatDateTime('dd/mm/yyyy',StrToDateTime(cDataAdesao));
                               DM.SP_Atualizar_Data_adesao.EXECPROC;
                             end;
                           nContrato_Old:=0;
                           if nHandlecontrato in [24,37] then //Família II  - SMS 18172 - 13/08/2003
                           begin                              //37 - Incluído dia 11/01/2008
                               DM.QrMotBloq.Close;
                               DM.QrMotBloq.Sql.Clear;
                               DM.QrMotBloq.Sql.Add('UPDATE SOCPRO.SAM_familia set motivobloqueio = 9, databloqueio = :databloqueio where handle = :handle');
                               DM.QrMotBloq.Parameters.ParamByName('databloqueio').DataType := ftDateTime;
                               DM.QrMotBloq.Parameters.ParamByName('databloqueio').value := StrToDateTime(cDataAdesao);
                               DM.QrMotBloq.Parameters.ParamByName('handle').DataType := ftInteger;
                               DM.QrMotBloq.Parameters.ParamByName('handle').value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                               DM.qrMotBloq.ExecSql;
                           end;
                           Inc(nIF);
                           SGGrade.Cells[4,1]:=IntToStr(nIF);
                           SGGrade.Refresh;
                        end
                        else
                        begin
                          //Alessandro - S.C. 102738 - 22/12/2005
                          if not (Dm.QrGeral.fieldbyname('diacobranca').isnull) then
                             nDiaCobrancaOracle:=Dm.QrGeral.fieldbyname('diacobranca').value
                          else
                             nDiaCobrancaOracle:=0;
                          if not (Dm.QrGeral.fieldbyname('diacobrancaoriginal').isnull) then
                             nDiaCobrancaOrigOracle:=Dm.QrGeral.fieldbyname('diacobrancaoriginal').value
                          else
                             nDiaCobrancaOrigOracle:=0;
                          if not (Dm.QrGeral.fieldbyname('proximovencimento').isnull) then
                             nDiaProximoVencimento:=Dm.QrGeral.fieldbyname('proximovencimento').value
                          else
                             nDiaProximoVencimento:=0;

                          if (not Balance_Line('F')) And (not (nhandleContrato in [23,24])) then //Balance_line False então Update
                          begin
                             If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','U');
                             LoadQuerys('U','F');
                             InsertUpdate_Familia('U','T');
                             Inc(nUF);
                             SGGrade.Cells[4,2]:=IntToStr(nUF);
                             SGGrade.Refresh;
                          end;
                        end;
                        //01/11/02
                        if lInseriuBeneficiario then
                        begin
                           TRY
                             If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                 Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                             DM.QrSaudePro2.Close;
                             DM.QrSaudePro2.Sql.Clear;
                             DM.QrSaudePro2.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO SET FAMILIA=:FAMILIA WHERE HANDLE=:HANDLE');
                             DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').DataType := ftInteger;
                             DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').Value := nHandleFamilia;
                             ///DM.QrSaudePro2.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                             DM.QrSaudePro2.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                             DM.QrSaudePro2.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                             DM.QrSaudePro2.ExecSql;
                           EXCEPT
                             On E:Exception do
                                Begin
                                   If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                      Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                   ///RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                                   RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                                End
                           END;
                        end;//IF
                     end
                     else
                     begin
                        //Procura o Handle do Titular
                        LoadStringQuery('SELECT HANDLE,CSC037WMTRBENF FROM SOCPRO.TCSC037 WHERE CSC037WMTRBENF=:CSC037WMTRBENF AND CSC037WNRODEPY=:CSC037WNRODEPY');
                        ///DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').AsString :=DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
                        ///DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').AsInteger:=DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger;
                        DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').DataType := ftString;
                        DM.QrGeral.Parameters.ParamByName('CSC037WMTRBENF').Value := DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString;
                        DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').DataType := ftInteger;
                        DM.QrGeral.Parameters.ParamByName('CSC037WNRODEPY').Value := DM.Adoquery.Fieldbyname('CSC037WSEQTITL').AsInteger;
                        DM.QrGeral.Open;

                        if not (nHandleFamilia > 0) then
                        begin
                          DM.qAuxFam.Close;
                          DM.qAuxFam.Sql.Clear;
                          DM.qAuxFam.Sql.Add('SELECT F.HANDLE');
                          DM.qAuxFam.Sql.Add('  FROM SOCPRO.SAM_FAMILIA F ');
                          DM.qAuxFam.Sql.Add('  JOIN SOCPRO.SAM_BENEFICIARIO B ON B.FAMILIA = F.HANDLE');
                          DM.qAuxFam.Sql.Add(' WHERE B.HANDLE = :HANDLEBENEF');
                          DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').DataType := ftInteger;
                          DM.qAuxFam.Parameters.ParamByName('HANDLEBENEF').Value := DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
                          DM.qAuxFam.Open;

                          if DM.qAuxFam.fieldbyName('HANDLE').AsInteger > 0 then
                          begin
                            nHandleFamilia:=DM.qAuxFam.fieldbyName('HANDLE').AsInteger;
                            cFamiliaTit:=DM.QrGeral.FieldByName('CSC037WMTRBENF').AsString;
                          end
                          else
                          begin
                            nHandleFamilia:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
                            cFamiliaTit:=DM.QrGeral.Fieldbyname('HANDLE').AsString;
                          end;

                        end;
                        //Procura a Família
                        DM.QrSaudePro1.Close;
                        DM.QrSaudePro1.Sql.Clear;
                        DM.QrSaudePro1.Sql.Add(cSqlF);
                        DM.QrSaudePro1.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                        DM.QrSaudePro1.Parameters.ParamByName('HANDLE').Value := nHandleFamilia;
                        DM.QrSaudePro1.Open;

                        if DM.QrSaudePro1.FieldByName('HANDLE').IsNull then //Insere a Famíla sem os Dados
                        begin
                           If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                              Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','I');
                           LoadQuerys('I','F');
                           InsertUpdate_Familia('I','N');
                           Inc(nIF);
                           SGGrade.Cells[4,1]:=IntToStr(nIF);
                           SGGrade.Refresh;
                        end
                        else
                        begin //Atualizar o Campo Família em Sam_Beneficiário
                           if lInseriuBeneficiario then
                           begin
                              TRY
                                If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                    Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                LoadStringQuery('UPDATE SOCPRO.SAM_BENEFICIARIO SET FAMILIA=:FAMILIA WHERE HANDLE=:HANDLE');
                                DM.QrGeral.Parameters.ParamByName('FAMILIA').DataType := ftinteger;
                                DM.QrGeral.Parameters.ParamByName('FAMILIA').Value := nHandleFamilia;
                                ///DM.QrGeral.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                                DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                                DM.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                                DM.QrGeral.ExecSql;
                              Except
                                On E:Exception do
                                  Begin
                                     If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                        Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                     ///RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA -SAM_BENEFICIARIO');
                                     RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA -SAM_BENEFICIARIO');
                                  End
                              end;
                           end;
                        end;
                     end
                  end
                  else if (nPlano = 110) then//PLANO FUNC.CASSI->110
                  begin
                     if cTitu='S' then //É titular
                     begin
                        //Handle da Família
                        LoadStringQuery(cSqlF);
                        ///Dm.QrGeral.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                        Dm.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                        Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                        DM.QrGeral.Open;

                        nHandleFamilia:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
                        if DM.QrGeral.FieldByName('HANDLE').IsNull then
                        begin
                           If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                              Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','I');
                           LoadQuerys('I','F');
                           InsertUpdate_Familia('I','T');
                           Inc(nIF);
                           SGGrade.Cells[4,1]:=IntToStr(nIF);
                           SGGrade.Refresh;
                        end
                        else
                        begin
                           //Alessandro - S.C. 102738 -22/12/2005
                           if not (Dm.QrGeral.fieldbyname('diacobranca').isnull) then
                              nDiaCobrancaOracle:=Dm.QrGeral.fieldbyname('diacobranca').value
                           else
                              nDiaCobrancaOracle:=0;
                           if not (Dm.QrGeral.fieldbyname('diacobrancaoriginal').isnull) then
                              nDiaCobrancaOrigOracle:=Dm.QrGeral.fieldbyname('diacobrancaoriginal').value
                           else
                              nDiaCobrancaOrigOracle:=0;
                           if not (Dm.QrGeral.fieldbyname('proximovencimento').isnull) then
                              nDiaProximoVencimento:=Dm.QrGeral.fieldbyname('proximovencimento').value
                           else
                             nDiaProximoVencimento:=0;

                           if (not Balance_Line('F')) And (not (nhandleContrato in [23,24])) then
                           begin
                              If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                 Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','U');
                              LoadQuerys('U','F');
                              InsertUpdate_Familia('U','T');
                              Inc(nUF);
                              SGGrade.Cells[4,2]:=IntToStr(nUF);
                              SGGrade.Refresh;
                           end;
                        end;
                        TRY
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Begin
                                Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                DM.QrSaudePro2.Close;
                                DM.QrSaudePro2.Sql.Clear;
                                DM.QrSaudePro2.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO SET FAMILIA=:FAMILIA WHERE HANDLE=:HANDLE');
                                DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').DataType := ftInteger;
                                DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').Value := nHandleFamilia;
                                ///DM.QrSaudePro2.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                                DM.QrSaudePro2.Parameters.ParamByName('HANDLE').DataType := ftInteger;                                ///
                                DM.QrSaudePro2.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                                DM.QrSaudePro2.ExecSql;
                             End;
                        EXCEPT
                          On E:Exception do
                             Begin
                                If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                   Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                ///RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                                RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                             End
                        END;
                     end
                     else
                     begin
                        //Procura a Família
                        DM.QrSaudePro2.Close;
                        DM.QrSaudePro2.Sql.Clear;
                        DM.QrSaudePro2.Sql.Add(cSqlF);
                        DM.QrSaudePro2.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                        DM.QrSaudePro2.Parameters.ParamByName('HANDLE').Value := nHandleFamilia;
                        DM.QrSaudePro2.Open;

                        if DM.QrSaudePro2.FieldByName('HANDLE').IsNull then //Insere a Famíla sem os Dados
                        begin
                           If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                              Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','I');
                           LoadQuerys('I','F');
                           InsertUpdate_Familia('I','N');
                           Inc(nIF);
                           SGGrade.Cells[4,1]:=IntToStr(nIF);
                           SGGrade.Refresh;
                        end
                        else
                        begin //Atualizar o Campo Família/beneficiário em Sam_Beneficiário
                           if lInseriuBeneficiario then
                           begin
                              TRY
                                If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                   Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                DM.QrSaudePro2.Close;
                                DM.QrSaudePro2.Sql.Clear;
                                DM.QrSaudePro2.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO SET FAMILIA=:FAMILIA WHERE HANDLE=:HANDLE');
                                DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').DataType := ftInteger;
                                DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').Value := nHandleFamilia;
                                ///DM.QrSaudePro2.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                                DM.QrSaudePro2.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                                DM.QrSaudePro2.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                                DM.QrSaudePro2.ExecSql;
                              EXCEPT
                                On E:Exception do
                                   Begin
                                      If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                         Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                      ///RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                                      RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                                   End
                              END;
                           end;//IF
                        end;//ELSE
                     end;//ELSE
                  end//BEGIN FUNC.CASSI
                  else //Dep.Indiretos
                  begin
                     LoadStringQuery(cSqlF);
                     ///Dm.QrGeral.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                     Dm.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                     Dm.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                     DM.QrGeral.Open;

                     nHandleFamilia:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;
                     if DM.QrGeral.FieldByName('HANDLE').IsNull then
                     begin
                        If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                           Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','I');
                        LoadQuerys('I','F');
                        InsertUpdate_Familia('I','T');
                        Inc(nIF);
                        SGGrade.Cells[4,1]:=IntToStr(nIF);
                        SGGrade.Refresh;
                     end
                     else
                     begin
                       //Alessandro - S.C. 102738 -22/12/2005
                       if not (Dm.QrGeral.fieldbyname('diacobranca').isnull) then
                          nDiaCobrancaOracle:=Dm.QrGeral.fieldbyname('diacobranca').value
                       else
                          nDiaCobrancaOracle:=0;
                       if not (Dm.QrGeral.fieldbyname('diacobrancaoriginal').isnull) then
                          nDiaCobrancaOrigOracle:=Dm.QrGeral.fieldbyname('diacobrancaoriginal').value
                       else
                          nDiaCobrancaOrigOracle:=0;
                       if not (Dm.QrGeral.fieldbyname('proximovencimento').isnull) then
                          nDiaProximoVencimento:=Dm.QrGeral.fieldbyname('proximovencimento').value
                       else
                         nDiaProximoVencimento:=0;

                       if (not Balance_Line('F')) And (not (nhandleContrato in [23,24])) then
                       begin
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                             Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'F','U');
                          LoadQuerys('U','F');
                          InsertUpdate_Familia('U','T');
                          Inc(nUF);
                          SGGrade.Cells[4,2]:=IntToStr(nUF);
                          SGGrade.Refresh;
                       end;
                     end;
                     //01/11/02
                     if lInseriuBeneficiario then
                     begin
                        TRY
                          If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                              Grava_log('1',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                          DM.QrSaudePro2.Close;
                          DM.QrSaudePro2.Sql.Clear;
                          DM.QrSaudePro2.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO SET FAMILIA=:FAMILIA WHERE HANDLE=:HANDLE');
                          DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').DataType := ftInteger;
                          DM.QrSaudePro2.Parameters.ParamByName('FAMILIA').Value := nHandleFamilia;
                          ///DM.QrSaudePro2.Parameters.ParamByName('HANDLE').AsInteger:=DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                          DM.QrSaudePro2.Parameters.ParamByName('HANDLE').DataType := ftInteger;
                          DM.QrSaudePro2.Parameters.ParamByName('HANDLE').Value := DM.Adoquery.Fieldbyname('HANDLE').AsInteger;
                          DM.QrSaudePro2.ExecSql;
                        EXCEPT
                          On E:Exception do
                             Begin
                                If (Not (DM.Adoquery.Fieldbyname('HANDLE').IsNull)) Then
                                   Grava_log('2',DM.Adoquery.Fieldbyname('HANDLE').AsString,'B','U');
                                ///RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                                RegistraLog(nNrImport,'HANDLE TCSC037.:'+DM.Adoquery.Fieldbyname('HANDLE').AsString+' '+E.Message,'UPDATE NO CAMPO FAMILIA/BENEF/TIPODEPENDENTE -SAM_BENEFICIARIO');
                             End
                        END;
                     end;//IF
                  end;
               end;//validou
           end;//if is null
//           END;
           DM.AdoQuery.Next;
          // DM.DbSaude.Commit;

           //Dep.Indireto
           if nHandleContrato=7 then
              cMatAtual:=RepeatChar(9-length(Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString)),'0')+
                         Trim(DM.Adoquery.Fieldbyname('CSC037WMTRBENF').AsString);

           Inc(nReg);
           lblReg.Caption:=IntToStr(nReg);
           lblReg.Refresh;
           FrmBeneficiario.Refresh;
        end; //WHILE NOT EOF
//        end;
        Inc(nIndice);
        DM.QrUpBalanceLine.Prepared;
        Dm.QrUpBalanceLine.Parameters.ParamByName('descricao').value:=CboContrato.Text;
        Dm.QrUpBalanceLine.Parameters.ParamByName('horafinal').value:=now;
        DM.QrUpBalanceLine.Parameters.ParamByName('HORAFINAL').value:=now;
        DM.QrUpBalanceLine.ExecSQL;
        //Atualizar Módulos
        if nIndice < CboContrato.Items.count then
        begin
//           if Copy(CBOContrato.Text,1,3)='006' then //Paraguaios
//              nIndice:=nIndice + 1;
           CBoContrato.ItemIndex:=nIndice;
           CboContrato.Refresh;
        end;

     if chkselcontrato.Checked=true then Break;

     end; //While Item.Count-1

     //RESET OS HANDLES DAS TABELAS QUE SOFRERAM INCLUSÕES DE REGISTROS
     ResetHandle;

    { If CBCartoes.Checked then
     begin
        lblProcess.Caption:='ATUALIZANDO CAMPO CODIGODEAFINIDADE...';
        lblProcess.Refresh;
        DM.SP_Cartoes.Prepare;
        DM.SP_Cartoes.EXECPROC;
     end;} // Comentado Carlao 30/09/2005

     //CancelarFamilia(7);//Dependente Indireto
     //CancelarFamilia(23);//Família II
     //nContaLoopPSFIII:=0;//executar somente para o PSF I
     //CancelarFamilia(2324);//Família I q migrou Família III
     //nContaLoopPSFIII:=1;//executar somente para o PSF II
     //CancelarFamilia(2324);//Família II q migrou Família III
     //CancelarFamilia(2);//Associado que se aposentou

     //alterado 02/09/2004
     lblProcess.Caption:='ATUALIZANDO MATRÍCULA PDE-->PSF...';
     lblProcess.Refresh;
     Cancelar_PDE_PAQ(0);

     lblProcess.Caption:='ATUALIZANDO MATRÍCULA NOVO PAQ-->PSF...';
     lblProcess.Refresh;
     Cancelar_PDE_PAQ(1);

     lblProcess.Caption:='ATUALIZANDO MATRÍCULA PAQ-->PSF...';
     lblProcess.Refresh;
     Cancelar_PDE_PAQ(2);


     lblProcess.Caption:='INSERINDO SAM_BENEFICIARIO_HISTORICO....';
     lblProcess.Refresh;
     dm.SP_HISTORICO.PREPARED;
     dm.SP_HISTORICO.Parameters.Clear;
     dm.SP_HISTORICO.Parameters.Refresh;
     DM.SP_HISTORICO.EXECPROC;

     //RESET OS HANDLES DAS TABELAS QUE SOFRERAM INCLUSÕES DE REGISTROS
     ResetHandle;

     lblprocess.Caption:='ATUALIZANDO CAMPOS - AGUARDE.....';
     //deletar os registros da tabela de verificação de handles migrados
     Dm.qrdelhMigrado.ExecSql;


     dm.logMessage('SP_COMPLEMENTO');
     lblProcess.Refresh;
     DM.SP_COMPLEMENTO.PREPARED;
     DM.SP_COMPLEMENTO.Parameters.Clear;
     DM.SP_COMPLEMENTO.Parameters.Refresh;
     DM.SP_COMPLEMENTO.EXECPROC;
     


     FechaLog(nNrImport);
     lblhorasF.Caption:=FormatDateTime('hh:nn:ss',now);

     //Atualizar Módulos
    { dm.logMessage('ATUALIZANDO MÓDULOS INVÁLIDOS PARA O CONTRATO');
     lblProcess.Caption:='ATUALIZANDO MÓDULOS INVÁLIDOS PARA O CONTRATO';
     lblProcess.Refresh;
     loadStringQuery(' select count(bm.handle) qtd'+
                     '   FROM SOCPRO.SAM_beneficiario_mod  bm, '+
                     '        sam_beneficiario sb '+
                     '  where sb.handle=bm.beneficiario AND not exists '+
                     '  (select b.handle FROM SOCPRO.SAM_beneficiario b, sam_contrato c1, sam_contrato_mod cm, sam_contrato c2 '+
                     '    where b.handle = bm.beneficiario '+
                     '          and c1.handle = b.contrato '+
                     '          and cm.handle = bm.modulo '+
                     '         and cm.contrato = c2.handle '+
                     '         and c2.handle = c1.handle )');
     Dm.QrGeral.Open;
     if Dm.QrGeral.FieldByName('qtd').Value > 0 then
     begin
        LoadStringQuery('delete FROM SOCPRO.SAM_beneficiario_mod_historico where beneficiariomod in ('+
                        'select handle FROM SOCPRO.SAM_beneficiario_mod '+
                        '  where handle in(select bm.handle '+
                        '                    FROM SOCPRO.SAM_beneficiario_mod  bm '+
                        '                  where not exists '+
                        '                        (Select b.handle '+
                        '                           FROM SOCPRO.SAM_beneficiario b, sam_contrato c1, sam_contrato_mod cm, sam_contrato c2 '+
                        '                               where b.handle = bm.beneficiario '+
                        '                                     and c1.handle = b.contrato '+
                        '                                     and cm.handle = bm.modulo '+
                        '                                     and cm.contrato = c2.handle '+
                        '                                     and c2.handle = c1.handle )))');
        DM.QrGeral.ExecSQL;

     end; }

     //alterado 22/09/2004 --Habilitado para migrar no dia 23/02/05
     dm.logMessage('ATUALIZANDO ESF e População Prioritária...');
     lblProcess.Caption:='ATUALIZANDO ESF e População Prioritária...';
     lblProcess.Refresh;
     DM.SP_ESF.PrepareD;
     DM.SP_ESF.Parameters.Clear;
     DM.SP_ESF.Parameters.Refresh;
     DM.SP_ESF.ExecProc;

     dm.logMessage('ATUALIZANDO Data Inicial da Carência do Benef...');
     lblProcess.Caption:='ATUALIZANDO Data Inicial da Carência do Benef...';
     lblProcess.Refresh;
     LoadStringQuery('UPDATE SOCPRO.SAM_beneficiario_carencia a '+
                     '   set datainicial=(select dataadesao '+
                     '                      FROM SOCPRO.SAM_beneficiario b '+
                     '                     where a.beneficiario=b.handle) '+
                     ' where datainicial is null');
     DM.QrGeral.ExecSQL;

     //Atualizar a seção na sam_familia - alterado no dia 23/03/05
     dm.logMessage('ATUALIZANDO Seção das Famílias...');
     lblProcess.Caption:='ATUALIZANDO Seção das Famílias...';
     lblProcess.Refresh;

     DM.SP_SECAO.PrepareD;
     DM.SP_SECAO.Parameters.Clear;
     DM.SP_SECAO.Parameters.Refresh;
     DM.SP_SECAO.Parameters.ParamByName('P_MIGRACAO').DataType := ftString;
     DM.SP_SECAO.Parameters.ParamByName('P_MIGRACAO').Value := 'D';
     DM.SP_SECAO.ExecProc;

     dm.logMessage('ATUALIZANDO MATRICULAFUNCIONAL FUNCI CASSI....');
     lblProcess.Caption:='ATUALIZANDO MATRICULAFUNCIONAL FUNCI CASSI....';//SC. 187930 dia 18/10/07
     lblProcess.Refresh;
     Atualizar_matricula_funcional_CASSI;

     lblProcess.Caption:='CANCELANDO DEPENDENTES POR ÓBITO....';//SC. 187930 dia 18/10/07
     lblProcess.Refresh;
     CancelarDependentesDiretosObito;

     AtualizarRG;

     dm.logMessage('ATUALIZANDO PF - DEP. INDIRETOS....');
     lblProcess.Caption:='ATUALIZANDO PF - DEP. INDIRETOS....';
     lblProcess.Refresh;
     SAM_BENEFICIARIO_PFEVENTO;

     //dm.logMessage('ATUALIZANDO NOVOS CAMPOS DA SAM_MATRICULA - PCF 150....');
     //lblProcess.Caption:='ATUALIZANDO NOVOS CAMPOS DA SAM_MATRICULA - PCF 150....';
     //lblProcess.Refresh;
     //DM.SP_UpdateMatriculaInternet.Prepare;
     //DM.SP_UpdateMatriculaInternet.ExecProc;

     dm.logMessage('ATUALIZAR_RG');
     lblProcess.Caption:='ATUALIZANDO RG...';
     lblProcess.Refresh;
     DM.SP_ATUALIZAR_RG.PREPARED;
     DM.SP_ATUALIZAR_RG.Parameters.Clear;
     DM.SP_ATUALIZAR_RG.Parameters.Refresh;
     DM.SP_ATUALIZAR_RG.EXECPROC;

     dm.logMessage('ATUALIZAR_RSP_LEGAL');
     lblProcess.Caption:='ATUALIZANDO Responsável Legal...';
     lblProcess.Refresh;
     DM.ATUALIZAR_RSP_LEGAL.PREPARED;
     DM.ATUALIZAR_RSP_LEGAL.Parameters.Clear;
     DM.ATUALIZAR_RSP_LEGAL.Parameters.Refresh;
     DM.ATUALIZAR_RSP_LEGAL.EXECPROC;

     DM.SP_AjustarMigracoes.PrepareD;
     DM.SP_AjustarMigracoes.Parameters.Clear;
     DM.SP_AjustarMigracoes.Parameters.Refresh;
     DM.SP_AjustarMigracoes.Parameters.ParamByName('P_USUARIO').DataType := ftInteger;
     DM.SP_AjustarMigracoes.Parameters.ParamByName('P_USUARIO').Value := 78;
     DM.SP_AjustarMigracoes.ExecProc;
 end;

procedure TFrmBeneficiario.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(wm_nextDlgCtl,0,0);
   end;
end;

procedure TFrmBeneficiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM.DbSaude.Connected:=FALSE;
   //DM.ADOSaudePro.Connected:=FALSE;
   Action:=caFree;
   FrmBeneficiario:=nil;
end;

procedure TFrmBeneficiario.Executar;
begin
  try
     FrmLogin.ShowModal;
     DM.DBSaude.Close;
     Dm.DBSaude.ConnectionString := 'Provider=OraOLEDB.Oracle.1;' +
       'Data Source = SOCPRDBD001;' +
       'User Id=' + FrmLogin.cUsuario + ';' +
       'Password=' + FrmLogin.cSenha;
     Dm.DBSaude.LoginPrompt:= False;
     DM.DBSaude.Open;
     Dm.DBSaude.Connected:= True;
    //Dm.DBSaude.ConnectionString := format('Provider=msdaora; Data Source =SOCMANBD001; User Id = %s; Password = %s',FrmLogin.cUsuario,FrmLogin.cSenha);
     SGGrade.Cells[1,0]:='ENDEREÇO';
     SGGrade.Cells[2,0]:='MATRÍCULA';
     SGGrade.Cells[3,0]:='BENEFICIÁRIO';
     SGGrade.Cells[4,0]:='FAMÍLIA';
     SGGrade.Cells[5,0]:='CONTA FIN.';
     SGGrade.Cells[6,0]:='MÓDULOS';
     SGGrade.Cells[7,0]:='DOCUMENTOS';
     SGGrade.Cells[0,1]:='INSERÇÕES';
     SGGrade.Cells[0,2]:='ATUALIZAÇÕES';
     SGGrade.Cells[0,3]:='ERROS';

     cRegistroCSC   :=TStringList.Create;
     cRegistroBenner:=TStringList.Create;
     DM.QrSAUDEPRO.close;
     DM.QrSAUDEPRO.sql.clear;
     DM.QrSAUDEPRO.sql.add('Select concat(SOCPRO.repeatchar(''0'',3 - length(rtrim(to_char(handle)))),rtrim(to_char(handle))) codigo,'+
                                  'contratante,'+
                                  'concat(SOCPRO.repeatchar(''0'',3 - length(rtrim(to_char(contrato)))),rtrim(to_char(contrato))) contrato '+
                                  ' FROM SOCPRO.SAM_contrato where handle not in (18,19,20,21,27,28,29,34,35,36,38,41,42,44,45,46,51,54,57,59,60,62,63,64,65) order by handle ');   // Incluido em 17/07/2009 os contratos 63,64,65
                                                                                                           // Incluido em 02/10/2009 todos os contratos de reciprocidade   //Incluido em  18/01/2010 os contartos de FunciCassi (28,35,46)
     DM.QrSAUDEPRO.open;
     while not dM.qrsaudepro.eof do
     begin
        //if not (Trim(DM.QrSaudePro.fieldbyName('codigo').AsString)='006') then
         if not (Trim(DM.QrSaudePro.fieldbyName('codigo').AsString)='025') then
           CboContrato.items.Add(dm.Qrsaudepro.fieldbyname('codigo').asstring + '-' + dm.Qrsaudepro.fieldbyname('contrato').asString + dm.Qrsaudepro.fieldbyname('contratante').asString);
        Dm.QrSAUDEPRO.Next;
     end;
     CboContrato.ItemIndex:=0;
     //BeneficiarioClass := TBeneficiarios.Create();  //retirado dia 18/01/2010
     FrmBeneficiario.ShowModal;

  except
    On E:Exception do
    begin
       ShowMessage('Login/Senha Inválidos!'+chr(13)+e.message);
       Application.terminate;
    end;
  end;
end;

procedure TFrmBeneficiario.ResetHandle;
begin
  try
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_ENDERECO',sw_hide);
   //WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SFN_CONTAFIN',sw_hide); //Marcelo Barbosa - 12/08/2010
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_MATRICULA',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_FAMILIA',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_ANOTADM',sw_hide);
//   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv172 HOMOLGACAO_SC_8.19 SAM_BENEFICIARIO_ANOTADM',sw_hide);
//   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_MOD',sw_hide);
//   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_MOD_HISTORICO',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_DOCENTREGUE',sw_hide);
//   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_HISTORICO',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_CARENCIA',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_SUSPENSAO',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_ROTINARECALCULOMENSALID',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_BENEFICIARIO_LIMITACAO',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SAM_CONTRATO_SECAO',sw_hide);
   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SFN_AGENCIA',sw_hide);
//   WinExec('\\sedesrv143\benner$\Migração\Desenvolvimento\Beneficiario\Executavel\BResethandle sedesrv070 PRODUCAO SFN_FATURA_LANC_MOD',sw_hide);
  except
  On E:Exception do
  begin
    RegistraLog(nNrImport,'RESETANDO HANDLES DO SOC USANDO BRESETHANDLE'+e.message,'Não foi possível resetar algum handle');
  end;
  end;
end;

procedure TFrmBeneficiario.RecalculoMensalidade(cTipo: string;beneficiario:integer);
var cDescMensa,cCompetencia:string;
begin
   cCompetencia:='SELECT MIN(COMPETENCIA) PRIMEIRACOMPETENCIA, MAX(COMPETENCIA) ULTIMACOMPETENCIA '+
                '  FROM SOCPRO.SFN_FATURA_LANC_MOD A, SAM_BENEFICIARIO B '+
                ' WHERE B.MATRICULA = :HMATRICULA '+
                '       AND A.BENEFICIARIO = B.HANDLE ';
   LoadStringQuery(cCompetencia);
   Dm.QrGeral.Parameters.ParamByName('hmatricula').value:=beneficiario;//é o handle do beneficiário
   Dm.QrGeral.Open;
   if not Dm.QrGeral.FieldByName('primeiracompetencia').IsNull then //gerar o registro
   begin
       //verificar se já existe registro para o beneficiário e competência em questão
       DM.QrySaudePro14.Close;
       Dm.QrySaudePro14.SQL.Clear;
       DM.QrySaudePro14.SQL.Add('select count(*) qtd FROM SOCPRO.SAM_rotinarecalculomensalid');
       DM.QrySaudePro14.SQL.Add(' where beneficiario=:beneficiario and ');
       DM.QrySaudePro14.SQL.Add('       competenciainicial=:inicial and ');
       DM.QrySaudePro14.SQL.Add('       competenciafinal=:final ');
       Dm.QrySaudePro14.Parameters.ParamByName('beneficiario').value:=beneficiario;
       DM.QrySaudePro14.Parameters.ParamByName('inicial').DataType := ftString;
       DM.QrySaudePro14.Parameters.ParamByName('inicial').Value :=FormatDateTime('dd/mm/yyyy',Dm.QrGeral.fieldbyName('primeiracompetencia').AsDateTime);
       Dm.QrySaudePro14.Parameters.ParamByName('final').DataType := ftString;
       Dm.QrySaudePro14.Parameters.ParamByName('final').Value  :=FormatDateTime('dd/mm/yyyy',Dm.QrGeral.fieldbyName('ultimacompetencia').AsDateTime);
       dm.QrySaudePro14.Open;
       if dm.QrySaudePro14.FieldByName('qtd').Value = 0 then //não tem nenhum registro
       begin
         Try
           if cTipo='A' then //mudança na data de adesão
             cDescMensa:='Alteração na faixa do preço do módulo - mudança na data de adesão - migração'
           else //mudança na data de nascimento
             cDescMensa:='Alteração na faixa do preço do módulo - mudança na data de nascimento - migração';

           nMaxHandleRecalcMens:=0;
           DM.Qr_handle.Close;
           DM.Qr_handle.SQL.Clear;
           DM.Qr_handle.SQL.Add('SELECT SEQ_SAM1024.NEXTVAL HANDLE FROM DUAL');
           DM.Qr_handle.Open;

           nMaxHandleRecalcMens:=DM.QrGeral.Fieldbyname('HANDLE').AsInteger;

           Dm.QrInsRecalculoMens.Parameters.ParamByName('handle').Value            :=nMaxHandleRecalcMens;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('competenciainicial').DataType := ftDateTime;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('competenciainicial').Value := Dm.QrGeral.fieldbyName('primeiracompetencia').AsDateTime;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('competenciafinal').DataType := ftDateTime;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('competenciafinal').Value := Dm.QrGeral.fieldbyName('ultimacompetencia').AsDateTime;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('descricao').Value            :=cDescMensa;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('beneficiario').Value         :=beneficiario;
           Dm.QrInsRecalculoMens.Parameters.ParamByName('codigo').Value               :=nMaxHandleRecalcMens;
           Dm.QrInsRecalculoMens.ExecSQL;
         except
           on E:exception do
             RegistraLog(nNrImport,'HANDLE:'+IntToStr(beneficiario)+' '+E.Message,'INSERT SAM_ROTINARECALCULOMENSALID');
         end;
       end;
   end;
end;


procedure TFrmBeneficiario.BtnDocClick(Sender: TObject);
var comando:string;
begin
     Cancelar_PDE_PAQ(1);
//      SAM_BENEFICIARIO_PFEVENTO;
//    AtualizarRG;
//     CancelarFamilia(7);//Dependente Indireto
//     CancelarFamilia(23);//Família II
//     Cancelar_PDE_PAQ(1);
//   Atualizar_Salario_FunciCassi;
//   Atualizar_matricula_funcional_CASSI;
//    CancelarDependentesDiretosObito;
    //CANCELARFAMILIA(2);
end;


function TFrmBeneficiario.ProcurarParentesco(CodigoVinculo: String): String;
var
  codigoBenner: Integer;
begin
  result:='';
  case strtoint(CodigoVinculo) of
      0: codigoBenner := 25;
      1: codigoBenner := 2;
      2: codigoBenner := 5;
      3: codigoBenner := 22;
      10: codigoBenner := 3;
      11: codigoBenner := 20;
      12: codigoBenner := 27;
      13: codigoBenner := 26;
      14: codigoBenner := 4;
      15: codigoBenner := 17;
      16: codigoBenner := 6;
      17: codigoBenner := 15;
      20: codigoBenner := 7;
      21: codigoBenner := 8;
      22,23: codigoBenner := 13;
      24: codigoBenner := 16;
      30,31: codigoBenner := 10;
      32,33: codigoBenner := 11;
      34,35: codigoBenner := 14;
      36: codigoBenner := 9;
      37: codigoBenner := 24;
      38: codigoBenner := -1;
      39: codigoBenner := -1;
      47: codigoBenner := 4;
      73: codigoBenner := 1995;
      74: codigoBenner := 2015;
      75: codigoBenner := 12;
      76: codigoBenner := 1956;
      77: codigoBenner := 2016;

  end;

  LoadStringQuery('select handle FROM SOCPRO.SAM_parentesco where codigo='+inttostr(codigoBenner)); //Estava pegando o parentesco da tabela sam_tipodependente
  DM.QrGeral.open;
  if not DM.QrGeral.isEmpty then
     result:=DM.QrGeral.fieldbyName('handle').asstring;
end;

procedure TFrmBeneficiario.Atualizar_Salario_FunciCassi;
var handleSalario,maxHandle,v_sequencia:integer;
    v_aux:string;
begin
    //obter o max handle
    LoadStringQuery('select SEQ_BEN0013.nextval max from dual');
    Dm.QrGeral.Open;
    maxHandle:=DM.QrGeral.fieldbyName('max').value;
    //criado dia 10/10/07 - solicitação através do service call     - Marcos Delphin
    LoadStringQuery('select t.handle,csc037wmtrbenf,sb.contrato FROM SOCPRO.TCSC037 t JOIN SOCPRO.SAM_beneficiario sb on sb.handle=t.handle where csc037wcodgrpobenf=7');
    Dm.QrGeral.Open;
    While not Dm.QrGeral.Eof do
    begin
       if BeneficiarioClass.FindBeneficiario(Dm.QrGeral.fieldbyname('csc037wmtrbenf').asinteger,BeneficiarioObj) then
       begin
         if ((BeneficiarioObj.Salario > 0) and (BeneficiarioObj.Titular)) then //verificar se o valor do salário é maior que zero para o funci cassi
         begin
           //verificar se existe registro criado na sam_beneficiario_salario
           Dm.QrySaudePro14.Close;
           Dm.QrySaudePro14.SQL.Clear;
           Dm.QrySaudePro14.SQL.Text:='select handle,salario,sequencia FROM SOCPRO.SAM_beneficiario_salario where beneficiario='+Dm.QrGeral.fieldbyName('handle').AsString;
           Dm.QrySaudePro14.open;
           if DM.QrySaudePro14.IsEmpty then
           begin //inserir o novo registro
              Inc(maxHandle);
              Dm.QrySaudePro14.Close;
              Dm.QrySaudePro14.SQL.Clear;
              Dm.QrySaudePro14.SQL.Add('Insert INTO SOCPRO.SAM_beneficiario_salario ');
              Dm.QrySaudePro14.SQL.Add('(handle,salario,beneficiario,outrasrendas,valoraposentadoria,valoraposentadoriacomplementar,cotapatronalenviada,');
              Dm.QrySaudePro14.SQL.Add(' contribuicaosocialenviada,contratosalario,sequencia,complementar,rotinafin,percentualminimoadiantamento,');
              Dm.QrySaudePro14.SQL.Add(' percentualmaximoadiantamento,rotinaimpsal,salarionormal,decimoterceirosalario,txadmenviada) ');
              Dm.QrySaudePro14.SQL.Add(' Values ');
              Dm.QrySaudePro14.SQL.Add('('+IntToStr(maxHandle)+ ',' +FloatToStrF(beneficiarioObj.Salario,fffixed,15,2) + ',' + Dm.QrGeral.fieldbyName('handle').AsString + ',0,0,0,0,0,Null,null,null,Null,0,0,Null,0,0,0) ');
              Dm.QrySaudePro14.execsql;
           end
           else //apenas atualizar o campo salario
           begin
              if BeneficiarioObj.Salario <> DM.QrySaudePro14.fieldbyName('salario').AsCurrency then
              begin
                Inc(maxHandle);
                Dm.QrySaudePro14.Close;
                Dm.QrySaudePro14.SQL.Clear;
                Dm.QrySaudePro14.SQL.Add('Insert INTO SOCPRO.SAM_beneficiario_salario ');
                Dm.QrySaudePro14.SQL.Add('(handle,salario,beneficiario,outrasrendas,valoraposentadoria,valoraposentadoriacomplementar,cotapatronalenviada,');
                Dm.QrySaudePro14.SQL.Add(' contribuicaosocialenviada,contratosalario,sequencia,complementar,rotinafin,percentualminimoadiantamento,');
                Dm.QrySaudePro14.SQL.Add(' percentualmaximoadiantamento,rotinaimpsal,salarionormal,decimoterceirosalario,txadmenviada) ');
                Dm.QrySaudePro14.SQL.Add(' Values ');
                Dm.QrySaudePro14.SQL.Add('('+IntToStr(maxHandle)+ ',' +FloatToStrF(beneficiarioObj.Salario,fffixed,15,2) + ',' + Dm.QrGeral.fieldbyName('handle').AsString + ',0,0,0,0,0,Null,Null,null,Null,0,0,Null,0,0,0) ');
                {HandleSalario:=DM.QrySaudePro14.fieldbyName('handle').Value;
                Dm.QrySaudePro14.Close;
                Dm.QrySaudePro14.SQL.Clear;
                Dm.QrySaudePro14.SQL.Text:='UPDATE SOCPRO.SAM_beneficiario_salario set salario=' + FloatToStrF(BeneficiarioObj.Salario,fffixed,15,2) + ' where handle='+IntTostr(handleSalario);}
                DM.QrySaudePro14.ExecSQL;
              end;
           end;
         end;
       end;
       Dm.QrGeral.Next;
    end;
end;

procedure TFrmBeneficiario.Atualizar_matricula_funcional_CASSI;
begin
    Dm.QrySaudePro14.Close;
    Dm.QrySaudePro14.SQL.Clear;
    Dm.QrySaudePro14.SQL.Add(' Select csc039wmtrbenf,sb.handle FROM SOCPRO.TCSC037 a JOIN SOCPRO.TCSC039 b on a.csc037wmtrbenf=b.csc039wmtrbenf JOIN SOCPRO.SAM_beneficiario sb On a.handle=sb.handle Where sb.contrato In (28,35) and matriculafuncional is null');
    Dm.QrySaudePro14.Open;
    While not Dm.QrySaudePro14.Eof do
    begin
       LoadStringQuery('UPDATE SOCPRO.SAM_beneficiario set matriculafuncional=' + DM.QrySaudePro14.fieldbyName('csc039wmtrbenf').value + '80' + ' where handle=' + DM.QrySaudePro14.fieldbyName('handle').AsString);
       DM.QrGeral.ExecSQL;
       Dm.QrySaudePro14.next;
    end;
end;

procedure TFrmBeneficiario.AtualizarRG;
//Var MAux_RG,MAux_DOC : String

begin
    Dm.QrySaudePro14.Close;
    Dm.QrySaudePro14.SQL.Clear;
    Dm.QrySaudePro14.SQL.Add('Select CSC039WMTRBENF||CSC039WNRODEPY MATRICULACASSI,TX_NTZ,TX_REG_GRL,TX_ORG_EMT,to_date(DT_REG_GRL, ''DD/MM/YYYY'') DT_REG_GRL FROM SOCPRO.TCSC039_diff c39 JOIN SOCPRO.TCSC037_diff c37 on c39.csc039wmtrbenf=c37.csc037wmtrbenf');
    Dm.QrySaudePro14.Open;
    While not Dm.QrySaudePro14.Eof do
    begin
       if ((not Dm.QrySaudePro14.fieldbyName('TX_REG_GRL').isnull) or (not Dm.QrySaudePro14.fieldbyName('TX_NTZ').isnull) or (trim(Dm.QrySaudePro14.fieldbyName('TX_REG_GRL').AsString)<>'') OR (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString)<>'')) then
       begin
         DM.QrGeralAux.Close;
         DM.QrGeralAux.SQL.Clear;
         DM.QrGeralAux.SQL.Add('SELECT M.RG, M.DOCUMENTOIDENTIFICACAO, M.NATUREZADOCIDENTIFICACAO, M.HANDLE');
         DM.QrGeralAux.SQL.Add('  FROM SOCPRO.SAM_MATRICULA M,                      ');
         DM.QrGeralAux.SQL.Add('       SAM_BENEFICIARIO B                    ');
         DM.QrGeralAux.SQL.Add(' WHERE B.MATRICULA = M.HANDLE                ');
         DM.QrGeralAux.SQL.Add('   AND B.MATRICULACASSI = :MATRICULACASSI');
         DM.QrGeralAux.Parameters.ParamByName('MATRICULACASSI').DataType := ftString;
         DM.QrGeralAux.Parameters.ParamByName('MATRICULACASSI').Value := Dm.QrySaudePro14.fieldbyName('MATRICULACASSI').AsString;
         //DM.QrGeralAux.Parameters.ParamByName('NATUREZADOCIDENTIFICACAO').AsInteger := Tp_Doc;
         DM.QrGeralAux.Open;
         if ((DM.QrGeralAux.FieldByName('RG').IsNull) or (TRIM(DM.QrGeralAux.FieldByName('RG').AsString) = '')) and
           //((DM.QrGeralAux.FieldByName('DOCUMENTOIDENTIFICACAO').IsNull) or (TRIM(DM.QrGeralAux.FieldByName('DOCUMENTOIDENTIFICACAO').AsString) = ''))  then
           ((DM.QrGeralAux.FieldByName('DOCUMENTOIDENTIFICACAO').IsNull) OR (TRIM(DM.QrGeralAux.FieldByName('DOCUMENTOIDENTIFICACAO').AsString) = ''))  then
         begin
           RetornaTipoDocumento;
           DM.QrGeral.Close;
           DM.QrGeral.SQL.Clear;
           DM.QrGeral.SQL.Add('UPDATE SOCPRO.SAM_matricula set');

           if Tp_Doc = 8 then    //rg
           begin
             DM.QrGeral.SQL.Add('  RG=:NRG,');
             DM.QrGeral.SQL.Add('  DATAEXPEDICAORG=:DATAEXPRG,            ');
             DM.QrGeral.Parameters.ParamByName('NRG').DataType := ftString;
             DM.QrGeral.Parameters.ParamByName('NRG').Value := Dm.QrySaudePro14.fieldbyName('TX_REG_GRL').AsString;
             DM.QrGeral.Parameters.ParamByName('DATAEXPRG').DataType := ftDateTime;
             DM.QrGeral.Parameters.ParamByName('DATAEXPRG').Value := Dm.QrySaudePro14.fieldbyName('DT_REG_GRL').AsDateTime;
           end;

           DM.QrGeral.SQL.Add('  ORGAOEMISSORDOCIDENTIFICACAO=:ORGAO,');
           DM.QrGeral.SQL.Add('  NATUREZADOCIDENTIFICACAO=:TPDOC,    ');
           DM.QrGeral.SQL.Add('  DOCUMENTOIDENTIFICACAO=:RG,         ');
           DM.QrGeral.SQL.Add('  DATAEXPEDICAODOCIDENTIFICACAO=:DATARG ');
           DM.QrGeral.SQL.Add(' WHERE HANDLE = :HANDLE');
           DM.QrGeral.Parameters.ParamByName('ORGAO').DataType := ftString;

           If (Dm.QrySaudePro14.fieldbyName('TX_ORG_EMT').Isnull) or (Trim(Dm.QrySaudePro14.fieldbyName('TX_ORG_EMT').Value) = '') then
           begin
             DM.QrGeral.Parameters.ParamByName('ORGAO').value := null
           end
           Else
           begin
             DM.QrGeral.Parameters.ParamByName('ORGAO').Value := Dm.QrySaudePro14.fieldbyName('TX_ORG_EMT').AsString;
           end;

           DM.QrGeral.Parameters.ParamByName('TPDOC').DataType := ftInteger;
           DM.QrGeral.Parameters.ParamByName('TPDOC').Value:=Tp_Doc;

           DM.QrGeral.Parameters.ParamByName('RG').DataType := ftString;
           DM.QrGeral.Parameters.ParamByName('RG').Value := Dm.QrySaudePro14.fieldbyName('TX_REG_GRL').AsString;
           DM.QrGeral.Parameters.ParamByName('DATARG').DataType := ftDateTime;
           DM.QrGeral.Parameters.ParamByName('DATARG').Value := Dm.QrySaudePro14.fieldbyName('DT_REG_GRL').AsDateTime;
           DM.QrGeral.Parameters.ParamByName('HANDLE').DataType := ftInteger;
           DM.QrGeral.Parameters.ParamByName('HANDLE').Value := DM.QrGeralAux.FieldByName('HANDLE').AsInteger;
           DM.QrGeral.ExecSQL;
         end;
       end;
       DM.QrySaudePro14.Next;
    end;
end;

procedure TFrmBeneficiario.RetornaTipoDocumento;
begin
  If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'RG') then
     Tp_Doc := 8
  else If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'CNH') then
     Tp_Doc := 56
  else If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'Cert.Nasc.') then
     Tp_Doc := 2
  else If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'Cart.Prof.') then
     Tp_Doc := 57
  else If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'Cart.Trab.') then
     Tp_Doc := 58
  else If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'Cart.Civil') then
     Tp_Doc := 59
  else If (trim(Dm.QrySaudePro14.fieldbyName('TX_NTZ').AsString) = 'Passaporte') then
     Tp_Doc := 60;
end;

procedure TFrmBeneficiario.SAM_BENEFICIARIO_PFEVENTO;
var dDataCancelTitular:TdateTime;
    maxHandlePF:integer;
begin
   {Para zerar esta PF devemos incluir um registro na tabela SAM_BENEFICIARIO_PFEVENTO com os seguintes campos:
    BENEFICIARIO = Handle do beneficiário
    DATAINICIAL = Data de Cancelamento do beneficiário indicador
    DATAFINAL = NULL
    TABELAPFEVENTO = 36 (Handle da PF limitada do contrato de Dependentes Indirestos)
    TABTIPOPF = Fixa
    CODIGOPF = 8 (é o handle do registro equivalente a 0% da tabela de percentuais de PF - SAM_PF)
    ACEITAFINANCIAMENTO = N
    ACEITAPARCELAMENTO = N}
    DM.QrGeral.SQL.Clear;
    DM.QrGeral.SQL.Add(' Select B.handle,b.matriculaindicadora ');
    DM.QrGeral.SQL.Add('  FROM SOCPRO.SAM_beneficiario b ');
    DM.QrGeral.SQL.Add('       Left JOIN SOCPRO.SAM_BENEFICIARIO_PFEVENTO PF On PF.BENEFICIARIO=B.HANDLE');
    DM.QrGeral.SQL.Add(' Where PF.HANDLE Is Null And B.contrato=7 And matriculaindicadora In ');
    DM.QrGeral.SQL.Add(' (Select handle ');
    DM.QrGeral.SQL.Add('   FROM SOCPRO.SAM_beneficiario ');
    DM.QrGeral.SQL.Add('  Where motivocancelamento=5 And handle In ');
    DM.QrGeral.SQL.Add(' ( ');
    DM.QrGeral.SQL.Add(' Select matriculaindicadora ');
    DM.QrGeral.SQL.Add('  FROM SOCPRO.SAM_beneficiario sb  ');
    DM.QrGeral.SQL.Add('  Where sb.contrato=7 And matriculaindicadora Is Not Null ');
    DM.QrGeral.SQL.Add(' ) ');
    DM.QrGeral.SQL.Add(' ) ');
    DM.QrGeral.Open;
    //HANDLE MAX
    DM.QrySaudePro10.SQL.Clear;
    DM.QrySaudePro10.SQL.Add('select SEQ_SAM0183.nextval maxHandle from DUAL');
    DM.QrySaudePro10.Open;
    maxHandlePF:=1;
    if not DM.QrySaudePro10.FieldByName('maxHandle').IsNull then
       maxHandlePF:=DM.QrySaudePro10.FieldByName('maxHandle').value;
    While not DM.QrGeral.Eof do
    begin
       Dm.QrySaudePro14.Close;
       Dm.QrySaudePro14.SQL.Clear;
       Dm.QrySaudePro14.SQL.Add(' Select datacancelamento FROM SOCPRO.SAM_beneficiario where handle='+dm.QrGeral.fieldbyName('matriculaindicadora').AsString);
       Dm.QrySaudePro14.Open;
       if not dm.QrySaudePro14.FieldByName('datacancelamento').IsNull then
       begin
          dDataCancelTitular:=dm.QrySaudePro14.FieldByName('datacancelamento').value;
          Dm.QrySaudePro14.Close;
          Dm.QrySaudePro14.SQL.Clear;
          Dm.QrySaudePro14.SQL.Add('INSERT INTO SOCPRO.SAM_BENEFICIARIO_PFEVENTO (HANDLE,BENEFICIARIO,DATAINICIAL,DATAFINAL,TABELAPFEVENTO,TABTIPOPF,CODIGOPF,ACEITAFINANCIAMENTO,ACEITAPARCELAMENTO,CONTRATO) ');
          Dm.QrySaudePro14.SQL.Add(' VALUES (:HANDLE,:BENEFICIARIO,:DATAINICIAL,null,36,1,8,''N'',''N'',7 )');
          Dm.QrySaudePro14.Parameters.ParamByName('handle').DataType := ftInteger;
          Dm.QrySaudePro14.Parameters.ParamByName('handle').value:=MaxHandlePF;
          Dm.QrySaudePro14.Parameters.ParamByName('beneficiario').DataType := ftInteger;
          Dm.QrySaudePro14.Parameters.ParamByName('beneficiario').value:=DM.QrGeral.FieldbyName('handle').value;
          Dm.QrySaudePro14.Parameters.ParamByName('datainicial').DataType := ftDateTime;
          Dm.QrySaudePro14.Parameters.ParamByName('datainicial').value :=dDataCancelTitular;
          DM.QrySaudePro14.ExecSQL;
          Inc(MaxHandlePF);
       end;
       DM.QrGeral.next;
    end;
end;

procedure TFrmBeneficiario.Executar_ControlM;
var
  teste, t1: Extended;
  ArqLog :Textfile;
  vNomeArq: string;
begin
  try
    try
       //retorno := 0;
       //t1 := 0;
       //teste := 1000/t1;
       //showmessage(floattostr(teste));
       DM.DBSaude.Close;
       Dm.DBSaude.ConnectionString := 'Provider=OraOLEDB.Oracle.1;' +
         'Data Source = SOCPRDBD001;' +
         'User Id=' + FrmLogin.cUsuario + ';' +
         'Password=' + FrmLogin.cSenha;
       Dm.DBSaude.LoginPrompt:= False;
       DM.DBSaude.Open;
       Dm.DBSaude.Connected:= True;
       SGGrade.Cells[1,0]:='ENDEREÇO';
       SGGrade.Cells[2,0]:='MATRÍCULA';
       SGGrade.Cells[3,0]:='BENEFICIÁRIO';
       SGGrade.Cells[4,0]:='FAMÍLIA';
       SGGrade.Cells[5,0]:='CONTA FIN.';
       SGGrade.Cells[6,0]:='MÓDULOS';
       SGGrade.Cells[7,0]:='DOCUMENTOS';
       SGGrade.Cells[0,1]:='INSERÇÕES';
       SGGrade.Cells[0,2]:='ATUALIZAÇÕES';
       SGGrade.Cells[0,3]:='ERROS';

       cRegistroCSC   :=TStringList.Create;
       cRegistroBenner:=TStringList.Create;
       DM.QrSAUDEPRO.close;
       DM.QrSAUDEPRO.sql.clear;
       DM.QrSAUDEPRO.sql.add('Select concat(SOCPRO.repeatchar(''0'',3 - length(rtrim(to_char(handle)))),rtrim(to_char(handle))) codigo,'+
                                    'contratante,'+
                                    'concat(SOCPRO.repeatchar(''0'',3 - length(rtrim(to_char(contrato)))),rtrim(to_char(contrato))) contrato '+
                                    ' FROM SOCPRO.SAM_contrato where handle not in (18,19,20,21,27,28,29,34,35,36,38,41,42,44,45,46,51,54,57,59,60,62,63,64,65) order by handle ');   // Incluido em 17/07/2009 os contratos 63,64,65
                                                                                                             // Incluido em 02/10/2009 todos os contratos de reciprocidade     //Incluido em  18/01/2010 os contartos de FunciCassi (28,35,46)
       DM.QrSAUDEPRO.open;
       while not dM.qrsaudepro.eof do
       begin
          //if not (Trim(DM.QrSaudePro.fieldbyName('codigo').AsString)='006') then
           if not (Trim(DM.QrSaudePro.fieldbyName('codigo').AsString)='025') then
             CboContrato.items.Add(dm.Qrsaudepro.fieldbyname('codigo').asstring + '-' + dm.Qrsaudepro.fieldbyname('contrato').asString + dm.Qrsaudepro.fieldbyname('contratante').asString);
          Dm.QrSAUDEPRO.Next;
       end;
       CboContrato.ItemIndex:=0;
       //BeneficiarioClass := TBeneficiarios.Create();    //retirado dia 18/01/2010
       BtnMigrarClick(BtnMigrar);  //Control-M - entra
    except
      On E:Exception do
      begin

        // showmessage(e.Message);
         retorno := 1; //Deu erro
         if ParamStr(1) <> '' then
           vNomeArq := ParamStr(1)
         else
           vNomeArq := '..\Log.txt';

         AssignFile(ArqLog, vNomeArq);
         ReWrite(ArqLog);

         WriteLn(ArqLog, e.Message);

         CloseFile(ArqLog);
      end;
    end;

 finally

   //ErrOutput := 'teste';
   dm.LogMessage('Retorno');
   AcertoContaFinanceira;
   ExitCode := retorno;
   self.Close; // Control-M - Entra
   dm.LogMessage('Chama application');
   Application.terminate;
   dm.LogMessage('Fez tudo');
 end;
end;

Procedure TFrmBeneficiario.CancelarHistoricoBen(dataCancelamento, motivoCancel:String; HandleBenf:integer);
var
    maxHandle : integer;

begin
      maxHandle := 0;

     if IntToStr(HandleBenf) <> '' then
       begin
         Dm.QrySaudePro14.Close;
         Dm.QrySaudePro14.SQL.Clear;
         Dm.QrySaudePro14.SQL.Text:= 'SELECT MAX(HIS.HANDLE) MAX_HANDLE_HIS'+
                                     '  FROM SOCPRO.SAM_BENEFICIARIO           BEN'+
                                     ' 	JOIN SOCPRO.SAM_BENEFICIARIO_HISTORICO HIS ON BEN.HANDLE = HIS.BENEFICIARIO'+
                                     ' WHERE BEN.HANDLE = '+ IntToStr(HandleBenf);
         Dm.QrySaudePro14.open;

         if not DM.QrySaudePro14.FieldByName('MAX_HANDLE_HIS').IsNull then
            maxHandle := DM.QrySaudePro14.FieldByName('MAX_HANDLE_HIS').AsInteger;


         Dm.QrySaudePro14.Close;
         Dm.QrySaudePro14.SQL.Clear;
       end;

       if  maxHandle <> 0 then
       begin
           if (dataCancelamento <> '') and (motivoCancel <> '') then
            begin
                Dm.QrySaudePro14.SQL.Text:= 'UPDATE SOCPRO.SAM_BENEFICIARIO_HISTORICO HIS'+
                                            '   SET  HIS.DATACANCELAMENTO   = :DATACANCELAMENTO'+
                                            ' 	    ,HIS.MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO'+
                                            ' WHERE HIS.HANDLE = :vHANDLE';
               Dm.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').value:=StrtoDateTime(dataCancelamento);
               Dm.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').value:=motivoCancel;
            end
           else
            begin
               Dm.QrySaudePro14.SQL.Text:= 'UPDATE SOCPRO.SAM_BENEFICIARIO_HISTORICO HIS'+
                                           '   SET  HIS.DATACANCELAMENTO   = NULL'+
                                           ' 	     ,HIS.MOTIVOCANCELAMENTO = NULL'+
                                           ' WHERE HIS.HANDLE = :vHANDLE';
            end;
           Dm.QrySaudePro14.Parameters.ParamByName('vHANDLE').value :=maxHandle;
           Dm.QrySaudePro14.ExecSQL;
      end;
end;


Procedure TFrmBeneficiario.AcertoContaFinanceira;
var
   query:string;
begin
                Dm.QrySaudePro14.Close;
                Dm.QrySaudePro14.SQL.Clear;
                Dm.QrySaudePro14.SQL.Text:='INSERT INTO SOCPRO.SFN_CONTAFIN '+
                                            '(                              '+
                                            'HANDLE                         '+
                                            ',TABRESPONSAVEL                '+
                                            ',BANCO                         '+
                                            ',AGENCIA                       '+
                                            ',CONTACORRENTE                 '+
                                            ',DV                            '+
                                            ',INCLUSAOUSUARIO               '+
                                            ',INCLUSAODATA                  '+
                                            ',BENEFICIARIO                  '+
                                            ',NAOPARCELAR                   '+
                                            ',TABINSTRUCAOPARCELAMENTO      '+
                                            ',NAOGERARDOCUMENTO             '+
                                            ',NAOCOBRARTARIFA               '+
                                            ',TABINSTRUCAOPARCELAMENTOPROX  '+
                                            ',TABGERACAOREC                 '+
                                            ',TABGERACAOPAG                 '+
                                            ',TIPODOCUMENTOREC              '+
                                            ',TABCOBRANCAOUTRORESPONSAVEL   '+
                                            ',PERCENTUALDESCONTOFOLHA       '+
                                            ')                              '+
                                            '(                              '+
                                            'SELECT SEQ_CONTAFIN01.NEXTVAL                                               HANDLE                           '+
                                            '      ,1                                                                    TABRESPONSAVEL                   '+
                                            '      ,1                                                                    BANCO                            '+
                                            '      ,(SELECT MIN(AGE.HANDLE)                                                                               '+
                                            '          FROM SOCPRO.SFN_AGENCIA AGE                                                                        '+
                                            '         WHERE AGE.BANCO = 1                                                                                 '+
                                            '           AND AGE.AGENCIA = SUBSTR(CSC.CSC039WPRFAGEN,1,4))                AGENCIA                          '+
                                            '      ,TO_NUMBER(SUBSTR(CSC.CSC039WNROCNTACORR,1,9))                        CONTACORRENTE                    '+
                                            '      ,SUBSTR(CSC.CSC039WNROCNTACORR,LENGTH(CSC.CSC039WNROCNTACORR),1)      DV                               '+
                                            '      ,78                                                                   INCLUSAOUSUARIO                  '+
                                            '      ,BEN.DATAADESAO                                                       INCLUSAODATA                     '+
                                            '      ,BEN.HANDLE                                                           BENEFICIARIO                     '+
                                            '      ,''N''                                                                NAOPARCELAR                      '+
                                            '      ,1                                                                    TABINSTRUCAOPARCELAMENTO         '+
                                            '      ,''N''                                                                NAOGERARDOCUMENTO                '+
                                            '      ,''N''                                                                NAOCOBRARTARIFA                  '+
                                            '      ,1                                                                    TABINSTRUCAOPARCELAMENTOPROX     '+
                                            '      ,CASE WHEN CSC.CSC039WTPOPGTO IN (0,1) THEN 1  ELSE 3 END             TABGERACAOREC                    '+
                                            '      ,CASE WHEN CSC.CSC039WTPOPGTO IN (0,1) THEN 1  ELSE 3 END             TABGERACAOPAG                    '+
                                            '      ,CASE WHEN CSC.CSC039WTPOPGTO IN (0,1) THEN ''''   ELSE ''1''  END    TIPODOCUMENTOREC                 '+
                                            '      ,1                                                                    TABCOBRANCAOUTRORESPONSAVEL      '+
                                            '      ,0                                                                    PERCENTUALDESCONTOFOLHA          '+
                                            '   FROM SOCPRO.SAM_BENEFICIARIO_MOD_HISTORICO HIT                                                            '+
                                            '   JOIN SOCPRO.SAM_BENEFICIARIO_MOD           BMH ON BMH.HANDLE = HIT.BENEFICIARIOMOD                        '+
                                            '   JOIN SOCPRO.SAM_BENEFICIARIO               BEN ON BEN.HANDLE = BMH.BENEFICIARIO                           '+
                                            '   JOIN SOCPRO.TCSC039                        CSC ON BEN.MATRICULACASSI = CSC.CSC039WMTRBENF||LPAD(CSC.CSC039WNRODEPY,2,0)'+
                                            '  WHERE HIT.DATAMOVIMENTOATIVACAO >= TO_DATE(''11/08/2010'' , ''DD/MM/YYYY'')                                   '+
                                            '    AND NOT EXISTS (SELECT 1 FROM SOCPRO.SFN_CONTAFIN CFI WHERE CFI.BENEFICIARIO = BEN.HANDLE)'+
                                            '    AND BEN.EHTITULAR = ''S'' '+
                                            '    AND BEN.CONTRATO IN (2, 4, 5, 6, 7, 23, 24, 30, 32, 37, 40, 43, 58, 61, 66, 67)'+
                                            ')';    

                 Dm.qrySaudePro14.ExecSQL;
end;

procedure TFrmBeneficiario.VerificarDependentesObito(dataCancelamento,
  dataFalecimento: tDateTime; HandleFamilia: integer);
begin
  //cancelando dependentes diretos
  //SELECIONAR OS DEPENDENTES DO TITULAR E CANCELÁ-LOS COM MOTIVO=30 - ÓBITO DO TITULAR
  Dm.QrySaudePro10.Close;
  Dm.QrySaudePro10.SQL.Clear;
  Dm.QrySaudePro10.SQL.Add('SELECT HANDLE, (:DATACANCELAMENTO + 60) ATENDIMENTOATE, DATACANCELAMENTO, MOTIVOCANCELAMENTO FROM SOCPRO.SAM_BENEFICIARIO WHERE FAMILIA = :HANDLEFAMILIA AND EHTITULAR = ''N''');
  Dm.QrySaudePro10.SQL.Add('AND ((DATACANCELAMENTO IS NULL) OR (trunc(DATACANCELAMENTO) = trunc(:DATACANCELAMENTO) and MOTIVOCANCELAMENTO <> 30)) ');
  Dm.QrySaudePro10.Parameters.ParamByName('HANDLEFAMILIA').DataType := ftInteger;
  Dm.QrySaudePro10.Parameters.ParamByName('HANDLEFAMILIA').Value := HandleFamilia;
  Dm.QrySaudePro10.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
  Dm.QrySaudePro10.Parameters.ParamByName('DATACANCELAMENTO').Value := dataCancelamento;
  DM.QrySaudePro10.Open;

  While not DM.QrySaudePro10.Eof do
  begin
    if Dm.QrySaudePro10.FieldByName('DATACANCELAMENTO').IsNull then
    begin
      CancelarBeneficiario(dataCancelamento, 30, Dm.QrySaudePro10.FieldByName('HANDLE').AsInteger);
     end
    else
    begin
      //atualizar motivo de cancelamento
      AtualizaMotivoCancelamento(Dm.QrySaudePro10.FieldByName('HANDLE').AsInteger, 30, Dm.QrySaudePro10.FieldByName('DATACANCELAMENTO').AsDateTime);
    end;

    //preencher atendimento até dos dependentes diretos
    Dm.QrySaudePro14.Close;
    Dm.QrySaudePro14.SQL.Clear;
    Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO SET ATENDIMENTOATE = :ATENDIMENTOATE WHERE HANDLE = :HANDLE');
    DM.QrySaudePro14.Parameters.ParamByName('ATENDIMENTOATE').DataType := ftDateTime;
    DM.QrySaudePro14.Parameters.ParamByName('ATENDIMENTOATE').Value := Dm.QrySaudePro10.FieldByName('ATENDIMENTOATE').AsDateTime;
    DM.QrySaudePro14.Parameters.ParamByName('HANDLE').DataType := ftInteger;
    DM.QrySaudePro14.Parameters.ParamByName('HANDLE').Value := Dm.QrySaudePro10.FieldByName('HANDLE').AsInteger;
    Dm.QrySaudePro14.execsql;

    DM.QrySaudePro10.Next;
  end;

  Try
    Begin
      Dm.QrySaudePro14.Close;
      Dm.QrySaudePro14.SQL.Clear;
      Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_FAMILIA SET MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO ,DATACANCELAMENTO = :DATACANCEL WHERE HANDLE = :HANDLE');
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := 5; //obito
      DM.QrySaudePro14.Parameters.ParamByName('DATACANCEL').DataType := ftDateTime;
      DM.QrySaudePro14.Parameters.ParamByName('DATACANCEL').Value := dataCancelamento;
      DM.QrySaudePro14.Parameters.ParamByName('HANDLE').DataType := ftInteger;
      DM.QrySaudePro14.Parameters.ParamByName('HANDLE').Value := HandleFamilia;

      Dm.QrySaudePro14.execsql;
    End;
  Except
   On E:Exception do
     Grava_Log('2','HandleFamilia:' + IntToStr(HandleFamilia),'F','U');
  End;
end;

procedure TFrmBeneficiario.AtualizaMotivoCancelamento(handleBenef,
  motivocancelamento: integer; dataCancelamentoAnt: tDateTime);
begin
  Dm.QrySaudePro14.Close;
  Dm.QrySaudePro14.SQL.Clear;
  Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO SET MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE HANDLE = :HANDLE');
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := motivocancelamento;
  DM.QrySaudePro14.Parameters.ParamByName('HANDLE').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('HANDLE').Value := handleBenef;
  Dm.QrySaudePro14.execsql;

  Dm.QrySaudePro14.Close;
  Dm.QrySaudePro14.SQL.Clear;
  Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO_MOD SET MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE BENEFICIARIO = :BENEFICIARIO AND DATACANCELAMENTO = :DATACANCELAMENTO');
  DM.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
  DM.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').Value := dataCancelamentoAnt;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := motivocancelamento;
  DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Value := handleBenef;
  Dm.QrySaudePro14.execsql;

  Dm.QrySaudePro14.Close;
  Dm.QrySaudePro14.SQL.Clear;
  Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO_MOD_HISTORICO SET MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE DATACANCELAMENTO = :DATACANCELAMENTO AND BENEFICIARIOMOD IN (SELECT HANDLE FROM SOCPRO.SAM_BENEFICIARIO_MOD WHERE BENEFICIARIO = :BENEFICIARIO)');
  DM.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
  DM.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').Value := dataCancelamentoAnt;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := motivocancelamento;
  DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Value := handleBenef;
  Dm.QrySaudePro14.execsql;

  Dm.QrySaudePro14.Close;
  Dm.QrySaudePro14.SQL.Clear;
  Dm.QrySaudePro14.SQL.Add('UPDATE SOCPRO.SAM_BENEFICIARIO_HISTORICO SET MOTIVOCANCELAMENTO = :MOTIVOCANCELAMENTO WHERE DATACANCELAMENTO = :DATACANCELAMENTO AND HANDLE = (SELECT MAX(HANDLE) FROM SOCPRO.SAM_BENEFICIARIO_HISTORICO WHERE BENEFICIARIO = :BENEFICIARIO)');
  DM.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').DataType := ftDateTime;
  DM.QrySaudePro14.Parameters.ParamByName('DATACANCELAMENTO').Value := dataCancelamentoAnt;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').DataType := ftInteger;
  DM.QrySaudePro14.Parameters.ParamByName('MOTIVOCANCELAMENTO').Value := motivocancelamento;
  DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').DataType := ftinteger;
  DM.QrySaudePro14.Parameters.ParamByName('BENEFICIARIO').Value := handleBenef;
  Dm.QrySaudePro14.execsql;
end;

end.

