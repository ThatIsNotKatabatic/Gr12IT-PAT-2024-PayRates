object frmSignUp: TfrmSignUp
  Left = 0
  Top = 0
  Caption = 'Sign Up'
  ClientHeight = 467
  ClientWidth = 236
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
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 120
    Height = 13
    Caption = 'Enter Your Email Address'
  end
  object Label3: TLabel
    Left = 8
    Top = 316
    Width = 124
    Height = 13
    Caption = 'Enter Your Phone Number'
  end
  object Label4: TLabel
    Left = 8
    Top = 254
    Width = 100
    Height = 13
    Caption = 'Enter Your Full Name'
  end
  object Label1: TLabel
    Left = 8
    Top = 198
    Width = 215
    Height = 13
    Caption = 'Enter Validation Code (it was emailed to you)'
  end
  object Label5: TLabel
    Left = 8
    Top = 372
    Width = 220
    Height = 13
    AutoSize = False
    Caption = 'Enter A Password to Use'
    WordWrap = True
  end
  object edtEmailAddress: TEdit
    Left = 8
    Top = 99
    Width = 220
    Height = 21
    TabOrder = 0
  end
  object btnSignUp: TButton
    Left = 8
    Top = 425
    Width = 220
    Height = 33
    Caption = 'SIGN UP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnSignUpClick
  end
  object pnlHeading: TPanel
    Left = 0
    Top = -4
    Width = 241
    Height = 73
    Caption = 'SignUp'
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
    TabOrder = 2
  end
  object edtPhoneNumber: TEdit
    Left = 8
    Top = 335
    Width = 220
    Height = 21
    TabOrder = 3
  end
  object edtFullName: TEdit
    Left = 8
    Top = 273
    Width = 220
    Height = 21
    TabOrder = 4
  end
  object btnValidate: TButton
    Left = 8
    Top = 126
    Width = 220
    Height = 33
    Caption = 'Send validation Email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnValidateClick
  end
  object edtValidationCode: TEdit
    Left = 8
    Top = 217
    Width = 220
    Height = 21
    TabOrder = 6
  end
  object edtPassword: TEdit
    Left = 8
    Top = 391
    Width = 220
    Height = 21
    PasswordChar = '*'
    TabOrder = 7
  end
end
