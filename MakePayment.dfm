object frmMakePayment: TfrmMakePayment
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Make a Payment'
  ClientHeight = 338
  ClientWidth = 197
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
    Top = 252
    Width = 150
    Height = 42
    Caption = 'Choose Amount'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = []
    GlowSize = 10
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 130
    Height = 42
    Caption = 'Choose type'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = []
    GlowSize = 10
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 196
    Width = 170
    Height = 42
    Caption = 'Select Property'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = []
    GlowSize = 10
    ParentFont = False
  end
  object sedAmount: TSpinEdit
    Left = 8
    Top = 279
    Width = 181
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object btnCancel: TButton
    Left = 8
    Top = 307
    Width = 65
    Height = 25
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnPay: TButton
    Left = 79
    Top = 307
    Width = 110
    Height = 25
    Caption = 'Pay'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnPayClick
  end
  object rgpChoose: TRadioGroup
    Left = 4
    Top = 85
    Width = 185
    Height = 105
    Items.Strings = (
      'Water'
      'Electricity'
      'Refuse')
    TabOrder = 3
    OnClick = rgpChooseClick
  end
  object pnlHeading: TPanel
    Left = -8
    Top = -8
    Width = 213
    Height = 62
    Caption = 'Pay'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Consolas'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object cmbProperty: TComboBox
    Left = 8
    Top = 225
    Width = 181
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'Pick a property'
  end
end
