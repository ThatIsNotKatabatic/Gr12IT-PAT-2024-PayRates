object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 364
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblLogin: TLabel
    Left = 8
    Top = 75
    Width = 94
    Height = 53
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    GlowSize = 10
    ParentFont = False
  end
  object lblEnterLoginName: TLabel
    Left = 8
    Top = 134
    Width = 80
    Height = 13
    Caption = 'Enter your name'
  end
  object lblEnterLoginPassword: TLabel
    Left = 8
    Top = 189
    Width = 100
    Height = 13
    Caption = 'Enter your password'
  end
  object edtLoginName: TEdit
    Left = 8
    Top = 153
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object edtLoginPassword: TEdit
    Left = 8
    Top = 208
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnLogin: TButton
    Left = 16
    Top = 266
    Width = 201
    Height = 33
    Caption = 'LOGIN'
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
    Width = 353
    Height = 73
    Caption = 'PayRate'
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
