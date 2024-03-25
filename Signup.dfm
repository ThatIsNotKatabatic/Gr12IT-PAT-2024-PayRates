object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 370
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 126
    Width = 100
    Height = 13
    Caption = 'Enter Your Password'
  end
  object Label2: TLabel
    Left = 12
    Top = 80
    Width = 102
    Height = 13
    Caption = 'Enter Your Username'
  end
  object edtSignUpPassword: TEdit
    Left = 12
    Top = 145
    Width = 205
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtSignUpUsername: TEdit
    Left = 12
    Top = 99
    Width = 205
    Height = 21
    TabOrder = 1
  end
  object btnSignUp: TButton
    Left = 19
    Top = 329
    Width = 105
    Height = 33
    Caption = 'SIGN UP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pnlHeading: TPanel
    Left = 0
    Top = -4
    Width = 241
    Height = 73
    Caption = 'SignUp'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -60
    Font.Name = 'zerpixl'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
end
