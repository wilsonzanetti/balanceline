unit uFuncoesGerais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ShellAPI, Mask;

type
  PTokenUser = ^TTokenUser;
  _TOKEN_USER = record
    User: _SID_And_Attributes;
  end;
  TTokenUser = _TOKEN_USER;


type TVersao = record
	MajorVersion: Integer;
  MinorVersion: Integer;
  Release: Integer;
  Build: Integer;
  DebugBuild: Boolean;
	PreRelease: Boolean;
	FlagSpecialBuild: Boolean;
  FlagPrivateBuild: Boolean;
  Patched: Boolean;
	CompanyName: String;
  Signature: String;
  FileDescription: String;
  FileVersion: String;
  InternalName: String;
  LegalCopyright: String;
  OriginalFilename: String;
  ProductName: String;
  ProductVersion: String;
  SpecialBuild: String;
	PrivateBuild: String;
  MemoriaRam: Integer;
end;

type TLimpaObjetos_ = (oEdit, oMaskEdit);

type TLimpaObjetos = set of TLimpaObjetos_;

type TFuncoesGerais = class(TObject)
	public
		//procedure UsuarioEDominio(var User: String, var Domain: String);
		function InformacoesGerais: TVersao;
		function RemoveAcentos(Texto: String): String;
    function RemoveCaracter(Texto: String): String;
    procedure PosicionaTexto(var _String: String; Texto: String; PosicaoInicial: Integer);
		procedure PosicionaTextoADireita(var _String: String; Texto: String; PosicaoFinal: Integer);
		function DiretorioDoWindows: String;
		procedure AbrirArquivoTexto(Arquivo: String);
		function QuantidadeLinhas(Arquivo: String; TamanhoDaLinha: Integer): Integer;
		function TextoToData(TextoData: String): TDate;
		function DVCPF(CPF: String): String;
		function DigitoBB(Numero: Integer): String;
		function DelimitaTexto(Texto: String; Delimitador: Char): TStringList;
		function DiretorioTemporario: String;
		function ArquivoTemporario: String;
		procedure LimpaTexto(var Form: TForm; LimpaObjetos: TLimpaObjetos);
		function BooleanToInt(Flag: Boolean): Integer;
		function IntToBoolean(Flag: Integer): Boolean;
	private
    protected
    published
	end;

implementation

{Objetivo: Informacoes Gerais sobre os dados do aplicativo
 Versao..: 01.001
 Data....: 12/03/2002
 Nota....: Deve-se habilitar a opcao Version Info
 		   menu Project, opcao Option, marcar e configurar Version Info}

function TFuncoesGerais.InformacoesGerais: TVersao;
var
  lpdwHandle: Cardinal;
  puLen: Cardinal;
  lpData: Pointer;
  lpBuffer: Pointer;
  Versao: TVersao;
    //Memoria: TCustomMemoryStream;
begin
	//Quantidade de memoria
	{
    Memoria := TCustomMemoryStream.Create;
    Versao.MemoriaRam := Memoria.Size / 1024;
    Memoria.Free;
	}

	puLen  := GetFileVersionInfoSize(PChar(Application.ExeName), lpdwHandle);

  	if puLen > 0 then
  	begin
		try
	    	GetMem(lpData, puLen);
			GetFileVersionInfo(PChar(Application.ExeName), 0, puLen, lpData);

			VerQueryValue(lpData, '\', lpBuffer, lpdwHandle);
    	   	with TVSFixedFileInfo (lpBuffer^) do
       		begin
	            Versao.Signature 		:= '0xFEEFO4BD: ' + IntToHex(dwSignature, 16);
				Versao.MajorVersion		:= HiWord(dwFileVersionMS);
				Versao.MinorVersion		:= LoWord(dwFileVersionMS);
         		Versao.Release			:= HiWord(dwFileVersionLS);
	            Versao.Build         	:= LoWord(dwFileVersionLS);
    	     	Versao.DebugBuild		:= (dwFileFlagsMask and dwFileFlags and VS_FF_DEBUG) <> 0;
        	    Versao.PreRelease 		:= (dwFileFlagsMask and dwFileFlags and VS_FF_PRERELEASE) <> 0;
	            Versao.FlagPrivateBuild	:= (dwFileFlagsMask and dwFileFlags and VS_FF_PRIVATEBUILD) <> 0;
    	        Versao.FlagSpecialBuild := (dwFileFlagsMask and dwFileFlags and VS_FF_SPECIALBUILD) <> 0;
				Versao.Patched       	:= (dwFileFlagsMask and dwFileFlags and VS_FF_PATCHED) <> 0;
	       	end;

			//IMPORTANTE:
    	    //A string '\StringFileInfo\041604E4' refere-se a Locale ID = Portugues Brasil (0416)
        	//O padrao e Ingle Estados Unidos (0409)
			VerQueryValue(lpData, '\StringFileInfo\041604E4\CompanyName', lpBuffer, lpdwHandle);
			Versao.CompanyName := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\FileDescription', lpBuffer, lpdwHandle);
			Versao.FileDescription := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\FileVersion', lpBuffer, lpdwHandle);
			Versao.FileVersion := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\InternalName', lpBuffer, lpdwHandle);
			Versao.InternalName := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\LegalCopyright', lpBuffer, lpdwHandle);
			Versao.LegalCopyright := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\OriginalFilename', lpBuffer, lpdwHandle);
			Versao.OriginalFilename := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\ProductName', lpBuffer, lpdwHandle);
			Versao.ProductName := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\ProductVersion', lpBuffer, lpdwHandle);
			Versao.ProductVersion := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\SpecialBuild', lpBuffer, lpdwHandle);
			Versao.SpecialBuild := PChar(lpBuffer);

			VerQueryValue(lpData, '\StringFileInfo\041604E4\PrivateBuild', lpBuffer, lpdwHandle);
			Versao.PrivateBuild := PChar(lpBuffer);

		finally
			FreeMem(lpData);

		end;
    end;

    Result := Versao;
end;


function TFuncoesGerais.RemoveAcentos(Texto: String): String;
var i: Integer;
	S: String;
begin
	for i := 1 to Length(Texto) do
    begin
		if Pos(Texto[i], 'ÂÃÁÀÄÅ') > 0 then
        	S := S + 'A'

		else if Pos(Texto[i], 'âãáàäå') > 0 then
        	S := S + 'a'

		else if Pos(Texto[i], 'ÉÈË') > 0 then
        	S := S + 'E'

		else if Pos(Texto[i], 'éèêë') > 0 then
        	S := S + 'e'

		else if Pos(Texto[i], 'ÍÌÎÏ') > 0 then
        	S := S + 'I'

		else if Pos(Texto[i], 'íìîï') > 0 then
        	S := S + 'i'

		else if Pos(Texto[i], 'ÔÕÓÒÖ') > 0 then
        	S := S + 'O'

		else if Pos(Texto[i], 'õôóòö') > 0 then
        	S := S + 'o'

		else if Pos(Texto[i], 'ÚÙÛÜ') > 0 then
        	S := S + 'U'

		else if Pos(Texto[i], 'úùüû') > 0 then
        	S := S + 'u'

		else if Pos(Texto[i], '¸Ç') > 0 then
        	S := S + 'C'

		else if Pos(Texto[i], 'ç¶') > 0 then
        	S := S + 'c'

		else if Pos(Texto[i], 'Ñ') > 0 then
        	S := S + 'N'

		else S := S + Texto[i];
    end;

	Result := S;
end;

function TFuncoesGerais.RemoveCaracter(Texto: String): String;
var i: Integer;
	S: String;
begin

	Texto := RemoveAcentos(Texto);

	for i := 1 to Length(Texto) do
    begin
		if Pos(UpperCase(Texto[i]), ' /ABCDEFGHIJKLMNOPQRSTUVWXYZ') > 0 then
        	S := S + Texto[i]

		else if Pos(Texto[i], '&') > 0 then
        	S := S + 'E'

		else if Pos(Texto[i], '-,.,:,'',=,´,_,),(,¡,|,¦,0,1,2,3,4,5,6,7,8,9') > 0 then
			S := S + ' '

		else if Pos(Texto[i], '¢,º,®,‡,§,©') > 0 then
        	S := S + 'C'

		else if Pos(Texto[i], '­,µ,»,þ,¼,‰,Ý,+,«,¡') > 0 then
			S := S + 'I'

		else if Pos(Texto[i], '×') > 0 then
        	S := S + 'U'

		else if Pos(Texto[i], '@,¶,Œ,ª,† ') > 0 then
        	S := S + 'A'

		else if Pos(Texto[i], '¨,¨,º,€,²,°,¿,ø,ý') > 0 then
        	S := S + 'O'

		else if Pos(Texto[i], '\,|') > 0 then
        	S := S + '/'

		else ShowMessage(Texto[i] + Chr(13) + IntToStr(Ord(Texto[i])));
    end;

	Result := S;
end;

procedure TFuncoesGerais.PosicionaTexto(var _String: String; Texto: String; PosicaoInicial: Integer);
begin
	if Length(_String) < PosicaoInicial then
    	_String := _String + StringOfChar(' ', PosicaoInicial - Length(_String) - 1)
	else
    	_String := Copy(_String, 1, PosicaoInicial);

	_String := _String + Texto;
end;

procedure TFuncoesGerais.PosicionaTextoADireita(var _String: String; Texto: String; PosicaoFinal: Integer);
begin
	if Length(_String) < PosicaoFinal then
    	_String := _String + StringOfChar(' ', PosicaoFinal - Length(_String));

	_String := Copy(_String, 1, PosicaoFinal - Length(Texto)) + Texto + Copy(_String, PosicaoFinal + 1, 2048);
end;

function TFuncoesGerais.DiretorioDoWindows: String;
var S: String;
	uSize: Cardinal;
begin
    uSize := 256;
    SetLength(S, uSize);
    GetWindowsDirectory(PChar(S), uSize);
	Result := PChar(S);
end;

procedure TFuncoesGerais.AbrirArquivoTexto(Arquivo: String);
begin
	if FileExists(DiretorioDoWindows + '\notepad.exe') then
        WinExec(PAnsiChar(DiretorioDoWindows + '\notepad.exe ' + Arquivo), SW_SHOWMAXIMIZED)

	else if FileExists(DiretorioDoWindows + '\write.exe') then
        WinExec(PAnsiChar(DiretorioDoWindows + '\write.exe ' + Arquivo), SW_SHOWMAXIMIZED)

	else if FileExists(DiretorioDoWindows + '\system32\notepad.exe') then
        WinExec(PAnsiChar(DiretorioDoWindows + '\system32\notepad.exe ' + Arquivo), SW_SHOWMAXIMIZED)

	else if FileExists(DiretorioDoWindows + '\system32\write.exe') then
        WinExec(PAnsiChar(DiretorioDoWindows + '\system32\write.exe ' + Arquivo), SW_SHOWMAXIMIZED)

	else
        MessageDlg('Nenhum aplicativo associado com o arquivo ' + Arquivo, mtInformation, [mbOK], 0);
end;

//Objetivo: retornar a quantidade (prevista de linhas de um arquivo texto)
//			baseado no tamanho do arquivo / tamanho de cada registro/linha
function TFuncoesGerais.QuantidadeLinhas(Arquivo: String; TamanhoDaLinha: Integer): Integer;
var	lpReOpenBuff: _OFSTRUCT;
	hFile: Cardinal;
    lpFileSizeHigh: Integer;
begin
  //2 bytes equivalem ao CR+LF de cada registro do TXT
  Inc(TamanhoDaLinha, 2);

	hFile := OpenFile(PAnsiChar(Arquivo), lpReOpenBuff, OF_READ);
  lpFileSizeHigh := GetFileSize(hFile, nil);
  CloseHandle(hFile);

	Result := lpFileSizeHigh div TamanhoDaLinha;
end;

//Objetivo: recebe uma data sem formatação e retornar o tipo data
//Exemplo.: 31122002 ou 120801
function TFuncoesGerais.TextoToData(TextoData: String): TDate;
var S: String;
begin
	if Length(S) = 6 then
		S := Copy(TextoData, 01, 02) + '/' +
			 Copy(TextoData, 03, 02) + '/' +
			 Copy(TextoData, 05, 02)
	else
		S := Copy(TextoData, 01, 02) + '/' +
			 Copy(TextoData, 03, 02) + '/' +
			 Copy(TextoData, 05, 04);

	Result := StrToDate(S);
end;


function TFuncoesGerais.DVCPF(CPF: String): String;
var y, z: Integer;
begin
	CPF := FormatFloat('000000000', StrToInt(CPF));

  y := 11 - ((StrToInt(Copy(CPF, 9, 1)) * 2 + StrToInt(Copy(CPF, 8, 1)) * 3 +
              StrToInt(Copy(CPF, 7, 1)) * 4 + StrToInt(Copy(CPF, 6, 1)) * 5 +
              StrToInt(Copy(CPF, 5, 1)) * 6 + StrToInt(Copy(CPF, 4, 1)) * 7 +
              StrToInt(Copy(CPF, 3, 1)) * 8 + StrToInt(Copy(CPF, 2, 1)) * 9 +
              StrToInt(Copy(CPF, 1, 1)) * 10) mod 11);

  if (y = 11) or (y = 10) then y := 0;

  CPF := CPF + IntToStr(y);

	z := 11 - ((StrToInt(Copy(CPF, 10,1)) * 2 + StrToInt(Copy(CPF, 9,1)) * 3 +
    		      StrToInt(Copy(CPF, 8,1))  * 4 + StrToInt(Copy(CPF, 7,1)) * 5 +
	        	  StrToInt(Copy(CPF, 6,1))  * 6 + StrToInt(Copy(CPF, 5,1)) * 7 +
		          StrToInt(Copy(CPF, 4,1))  * 8 + StrToInt(Copy(CPF, 3,1)) * 9 +
        		  StrToInt(Copy(CPF, 2,1)) * 10 + StrToInt(Copy(CPF, 1,1)) * 11) mod 11);

  if (z = 11) or (z = 10) then z := 0;

  Result := IntToStr(y) + IntToStr(z);
end;

//Objetivo: Calculo de digito verificar conforme logica do Banco do Brasil
//Exemplo.: Agência 1606-3, Matrícula, etc
function TFuncoesGerais.DigitoBB(Numero: Integer): String;
var
	i: Integer;
	S: String;
    Total: Integer;
    Multiplicador: Integer;
begin
	Multiplicador := 9;
	Total := 0;
    S := IntToStr(Numero);

    for i := Length(S) downto  1 do
    begin
        Total := Total + StrToInt(S[i]) * Multiplicador;

        if Multiplicador = 2 then
			Multiplicador := 9
        else
        	Multiplicador := Multiplicador - 1;
    end;

    Total := Total mod 11;

	if Total = 10 then Result := 'X' else Result := IntToStr(Total);
end;

//Objetivo: retornar Dominio e Usuario do usuario logado
{
procedure FuncoesGerais.UsuarioEDominio(var User: String, var Domain: String);
var hProcess, hAccessToken: THandle;
  	InfoBuffer: array[0..1000] of Char;
  	szAccountName, szDomainName: array [0..200] of Char;
  	dwInfoBufferSize, dwAccountSize, dwDomainSize: DWORD;
  	pUser: PTokenUser;
  	snu: SID_NAME_USE;
begin

  dwAccountSize := 512;

  dwDomainSize := 512;

  hProcess := GetCurrentProcess;

  OpenProcessToken(hProcess, TOKEN_READ, hAccessToken);

  GetTokenInformation(hAccessToken, TokenUser, @InfoBuffer[0], 10240, dwInfoBufferSize);

  pUser := PTokenUser(@InfoBuffer[0]);

  LookupAccountSid(nil, pUser.User.Sid, szAccountName, dwAccountSize, szDomainName, dwDomainSize, snu);

  User := szAccountName;

  Domain := szDomainName;

  CloseHandle(hAccessToken);
end;
}

function TFuncoesGerais.DelimitaTexto(Texto: String; Delimitador: Char): TStringList;
const
	TamanhoDaString: Integer = 2048;

var	PosicaoInicial: Integer;
    PosicaoFinal: Integer;
    SubString: String;
    S: TStringList;

label BlocoLoop;
begin
	S := TStringList.Create;



    Delimitador := ';';

    if Length(Texto) = 0 then
    begin
		S.Add('');
		Result := S;
        Exit;
    end;


	repeat
		BlocoLoop:

		if Texto[1] = Delimitador then
        begin
        	S.Add('');

			if Length(Texto) > 1 then Texto := Copy(Texto, 2, TamanhoDaString)
            else
			begin
				S.Add('');
				Result := S;
                Exit;
            end;

			goto BlocoLoop;

        end;

		PosicaoFinal := Pos(Delimitador, Texto) - 1;

        if PosicaoFinal <= 0 then
        begin
        	SubString := Texto;
			S.Add(SubString);
		end
        else
        begin
        	SubString := Copy(Texto, 1, PosicaoFinal);
            S.Add(SubString);

			Texto := Copy(Texto, PosicaoFinal, TamanhoDaString);

			if Length(Texto) > 1 then
            	Texto := Copy(Texto, 3, TamanhoDaString)
			else
            	Texto := '';

			if Texto = '' then
            begin
            	S.Add('');
				Result := S;
                Exit;
            end;

        end;
    until PosicaoFinal <= 0;

    //Erro no processamento
	Result := S;
end;

//Objetivo: retorna o arquivo temporario definido pela API Windows
//Exemplo.:
function TFuncoesGerais.ArquivoTemporario: String;
var nBufferLength: Cardinal;
	lpBuffer: String;
begin
	SetLength(lpBuffer, nBufferLength);

    GetTempPath(nBufferLength, PChar(lpBuffer));
    GetTempFileName(PChar(lpBuffer), PChar('TMP'), 0, PChar(lpBuffer));

	Result := PChar(lpBuffer);
end;


//Objetivo: retorna o arquivo temporario definido pela API Windows
//Exemplo.:
function TFuncoesGerais.DiretorioTemporario: String;
var nBufferLength: Cardinal;
	lpBuffer: String;
begin
	SetLength(lpBuffer, nBufferLength);

    GetTempPath(nBufferLength, PChar(lpBuffer));

	Result := PChar(lpBuffer);
end;


procedure TFuncoesGerais.LimpaTexto(var Form: TForm; LimpaObjetos: TLimpaObjetos);
var i: Integer;
begin
	for i := 0 to Form.ComponentCount - 1 do
    begin
		if (Form.Components[i] is TEdit) and (oEdit in LimpaObjetos) then TEdit(Form.Components[i]).Text := '';

		if (Form.Components[i] is TMaskEdit) and (oMaskEdit in LimpaObjetos) then TMaskEdit(Form.Components[i]).Text := '';
    end;
end;

function TFuncoesGerais.BooleanToInt(Flag: Boolean): Integer;
begin
	if Flag then Result := 1 else Result := 0;
end;


function TFuncoesGerais.IntToBoolean(Flag: Integer): Boolean;
begin
	if Flag > 0 then Result := True else Result := False;
end;


initialization
//

finalization
//

end.
