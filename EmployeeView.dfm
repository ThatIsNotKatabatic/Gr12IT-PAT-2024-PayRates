object frmEmployeeView: TfrmEmployeeView
  Left = 0
  Top = 0
  Caption = 'PayRates Employee Signed In'
  ClientHeight = 367
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtSearchBar: TEdit
    Left = 8
    Top = 80
    Width = 370
    Height = 21
    TabOrder = 0
  end
  object btnSearch: TButton
    Left = 384
    Top = 78
    Width = 88
    Height = 25
    Caption = 'Search'
    TabOrder = 1
  end
  object pnlHeading: TPanel
    Left = -2
    Top = -1
    Width = 488
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
    TabOrder = 2
  end
  object dbgOut: TDBGrid
    Left = 8
    Top = 107
    Width = 464
    Height = 252
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
