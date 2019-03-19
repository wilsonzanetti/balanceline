object FrmLogin: TFrmLogin
  Left = 677
  Top = 210
  BorderStyle = bsDialog
  Caption = 'Login - Diferencial Oracle - V.28.01.2010'
  ClientHeight = 120
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 16
    Width = 44
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 56
    Width = 37
    Height = 13
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdUser: TEdit
    Left = 80
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdPwd: TEdit
    Left = 80
    Top = 72
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnExit = EdPwdExit
  end
end
