object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login to PayRates'
  ClientHeight = 368
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblLogin: TLabel
    Left = 8
    Top = 75
    Width = 95
    Height = 52
    Caption = 'Login'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Consolas'
    Font.Style = [fsBold, fsUnderline]
    GlowSize = 10
    ParentFont = False
  end
  object lblEnterLoginName: TLabel
    Left = 8
    Top = 134
    Width = 78
    Height = 13
    Caption = 'Enter your email'
  end
  object lblEnterLoginPassword: TLabel
    Left = 8
    Top = 189
    Width = 100
    Height = 13
    Caption = 'Enter your password'
  end
  object Label1: TLabel
    Left = 104
    Top = 289
    Width = 50
    Height = 52
    Caption = 'OR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Consolas'
    Font.Style = [fsBold, fsUnderline]
    GlowSize = 10
    ParentFont = False
  end
  object edtLoginEmail: TEdit
    Left = 8
    Top = 153
    Width = 218
    Height = 21
    TabOrder = 0
    Text = 'jonathanleroux2006@gmail.com'
  end
  object edtLoginPassword: TEdit
    Left = 8
    Top = 208
    Width = 218
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = '12345'
  end
  object btnLogin: TButton
    Left = 8
    Top = 250
    Width = 218
    Height = 33
    Caption = 'LOGIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object pnlHeading: TPanel
    Left = 0
    Top = -4
    Width = 233
    Height = 73
    Caption = 'PayRate'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -60
    Font.Name = 'Consolas'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object btnSignUp: TButton
    Left = 8
    Top = 327
    Width = 218
    Height = 33
    Caption = 'Sign Up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnSignUpClick
  end
end
