object frmPaymentHistory: TfrmPaymentHistory
  Left = 0
  Top = 0
  Caption = 'Payment History'
  ClientHeight = 480
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 8
    Top = 122
    Width = 838
    Height = 296
    DataSource = dbmMainDB.EmployeeSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlHeading: TPanel
    Left = -5
    Top = -9
    Width = 862
    Height = 66
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
    TabOrder = 1
  end
  object btnExit: TButton
    Left = 8
    Top = 424
    Width = 105
    Height = 50
    Caption = 'Exit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnExitClick
  end
end