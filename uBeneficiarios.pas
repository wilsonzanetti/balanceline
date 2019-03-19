{ *********************************************************************** }
{                                                                         }
{ CASSI - Caixa de Assistência dos Funcionários Banco do Brasil           }
{ Definições para identificação de beneficiários do plano de saúde        }
{ a partir de arquivos SAP                                                }
{                                                                         }
{ Márcio Brener Costa - (marciobrener@hotmail.com)                        }
{ Brasília, 21 de fevereiro de 2006                                       }
{                                                                         }
{ Atualização: 18/04/2006 - Márcio Brener                                 }
{              Usar biblioteca de integração SAP JCO                      }
{                                                                         }
{              12/03/2008 - SAM_CONTRATO_TPDEP.HANDLE implementado        }
{ *********************************************************************** }

unit uBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Contnrs, Math, IniFiles, ValEdit, StrUtils, uSAP;

type
  TBeneficiario = class
  public
    MatriculaSAP: Integer;
      MatriculaCSC: Integer;
      MatriculaCSCTitular: Integer;
      Titular: Boolean;
      DepID: Cardinal;
      TipoMaoDeObra: (tmoNaoIdentificado, tmoAdministrativa, tmoBasica);
      SAM_CONTRATO_TPDEP: Integer; //SAM_CONTRATO_TPDEP.HANDLE
      Salario: Currency;
  end;

type
  TString = class
  public
    Text: String;
  end;

type
  TBeneficiarios = class(TObject)
    Beneficiarios: TObjectList;
    private
      PA0001: TValueListEditor;
    public
      constructor Create; overload;
      function FindBeneficiario(MatriculaCSC: Integer; out Beneficiario: TBeneficiario): Boolean;
      procedure CargaPA0001(ArquivoPA0001: String); overload;
      procedure CargaPA0001; overload;

    private
  end;

implementation

var
  SAP: TSAP;

constructor TBeneficiarios.Create();
var
  MatriculaTitular: Integer;
  i, j, Index: Integer;
  PerNr: Integer;
  Beneficiario: TBeneficiario;
  Lista: THashedStringList;
  ListaPA0008: THashedStringList; //Salários
  ZTHR_MTRPLSAUDE: TZTHR_MTRPLSAUDE;
begin
  PerNr := 0;
  MatriculaTitular := 0;

  Beneficiarios := TObjectList.Create;

  { Carga do Infotipo 0001 - Usando SAP JCO }
  CargaPA0001;
  Lista := SAP.GetZTHR_MTRPLSAUDE;
  ListaPA0008 := SAP.GetPA0008;

  for i := 0 to Pred(Lista.Count) do
  begin
    ZTHR_MTRPLSAUDE := TZTHR_MTRPLSAUDE(Lista.Objects[i]);

    //Criar novo Beneficiario
    j := ZTHR_MTRPLSAUDE.PERNR;
    if PerNr <> j then MatriculaTitular := ZTHR_MTRPLSAUDE.MTRPLANO;
    PerNr := j;

    Beneficiario                     := TBeneficiario.Create;
    Beneficiario.MatriculaSAP        := ZTHR_MTRPLSAUDE.PERNR;
    Beneficiario.Titular             := ZTHR_MTRPLSAUDE.DEPTYP = EmptyStr;
    Beneficiario.MatriculaCSC        := ZTHR_MTRPLSAUDE.MTRPLANO;
    Beneficiario.MatriculaCSCTitular := MatriculaTitular;
    Beneficiario.DepID               := StrToIntDef(ZTHR_MTRPLSAUDE.DepID, 0);
    Beneficiario.SAM_CONTRATO_TPDEP  := ZTHR_MTRPLSAUDE.HANDLE_TPDEP;

    Index := ListaPA0008.IndexOf(IntToStr(ZTHR_MTRPLSAUDE.PERNR));
    if Index > 0 then Beneficiario.Salario := TPA0008(ListaPA0008.Objects[Index]).ANSAL / 12;

    //Formar o sequencial da familia, Titular = 0, Dependente = Dep(n) + 1
    if not Beneficiario.Titular then Beneficiario.DepID := Beneficiario.DepID + 1;

    Beneficiarios.Add(Beneficiario);
  end;
end;

procedure TBeneficiarios.CargaPA0001(ArquivoPA0001: String);
var
  F: TextFile;
  S: String;
  i: Integer;
  List: TStringList;
  IndexPERNR: Cardinal;
  IndexPERSG: Cardinal;
begin
  if not FileExists(ArquivoPA0001) then raise ERangeError.Create('Arquivo nao encontrado: ' + ArquivoPA0001);

  PA0001 := TValueListEditor.Create(nil);

  List := TStringList.Create;
  List.Delimiter := ';';

  try
    AssignFile(F, ArquivoPA0001);
    Reset(F);

    while not Eof(F) do
    begin
      Readln(F, S);

      List.DelimitedText := S;

      //Determinar linha de cabecalho de posições/delimitações
      if AnsiStartsText('MANDT', S) then
      begin
        for i := 0 to Pred(List.Count) do
        begin
          if List.Strings[i] = 'PERNR' then IndexPERNR := i
          else if List.Strings[i] = 'PERSG' then IndexPERSG := i;
        end;
        continue;
      end;


      //Adicionar novo Beneficiario
      PA0001.InsertRow(List.Strings[IndexPERNR], List.Strings[IndexPERSG], True);
    end;

  finally
    CloseFile(F);
  end;
end;

procedure TBeneficiarios.CargaPA0001;
var
  i: Integer;
  Lista: THashedStringList;
  o: TPA0001;
begin
  PA0001 := TValueListEditor.Create(nil);

  Lista := SAP.GetPA0001;
  for i := 0 to Pred(Lista.Count) do
  begin
    o := TPA0001(Lista.Objects[i]);
    PA0001.InsertRow(IntToStr(o.PERNR), o.PERSG, True);
  end;
end;

function TBeneficiarios.FindBeneficiario(MatriculaCSC: Integer; out Beneficiario: TBeneficiario): Boolean;
var
  i: Integer;
  j: Integer;
  _Beneficiario: TBeneficiario;
begin
  Result := False;

  for i := 0 to Pred(Beneficiarios.Count) do
  begin
    _Beneficiario := TBeneficiario(Beneficiarios.Items[i]);

    Result := (_Beneficiario.MatriculaCSC = MatriculaCSC);

    if not Result then Continue;

    Beneficiario := _Beneficiario;

    { Determinar o tipo de mão-de-obra a partir do arquivo de medidas SAP - PA0001 }
    if PA0001.FindRow(IntToStr(Beneficiario.MatriculaSAP), j) then
    begin
      if AnsiPos(PA0001.Values[PA0001.Keys[j]], 'H,I,J,L,M,N') = 0 then
        Beneficiario.TipoMaoDeObra := tmoAdministrativa
      else
        Beneficiario.TipoMaoDeObra := tmoBasica;
    end;

    Exit;
  end;
end;

initialization
  SAP := TSAP.Create;

end.
