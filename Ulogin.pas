unit Ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdUser: TEdit;
    EdPwd: TEdit;
    procedure FormShow(Sender: TObject);
    procedure EdPwdExit(Sender: TObject);
    procedure EdPwdExitControlM(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    cUsuario,cSenha:string;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.FormShow(Sender: TObject);
begin
   EdUser.SetFocus;
end;

procedure TFrmLogin.EdPwdExit(Sender: TObject);
begin
   if ( (Trim(EdUser.Text)='') or (trim(EdPwd.Text)='') ) then 
      ShowMessage('Login/Senha Inválido!')
   else
   begin
      cUsuario :=trim(EdUser.Text);
      cSenha   :=trim(EdPwd.text);
      Close;
   end;
end;

procedure TFrmLogin.EdPwdExitControlM(Sender: TObject);
begin
   //if ( (Trim(EdUser.Text)='') or (trim(EdPwd.Text)='') ) then // Control-M - Sai
      //ShowMessage('Login/Senha Inválido!')  // Control-M - Sai
   //else  // Control-M - Sai
   //begin // Control-M - Sai

      //EdUser.Text := 'socpro'; // Control-M - Entra
      //EdPwd.Text  := 'socpro'; // Control-M - Entra

      EdUser.Text := 'apl_socpro'; // Control-M - Entra
      EdPwd.Text  := 'w98mehfp'; // Control-M - Entra

      cUsuario :=trim(EdUser.Text);
      cSenha   :=trim(EdPwd.text);
      //Close;
   //end;  // Control-M - Sai
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      Perform(wm_nextdlgctl,0,0);
   end;
end;

end.
