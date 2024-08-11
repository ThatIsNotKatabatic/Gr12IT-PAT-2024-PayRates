object frmEmployeeView: TfrmEmployeeView
  Left = 0
  Top = 0
  Caption = 'PayRates Employee Signed In'
  ClientHeight = 367
  ClientWidth = 567
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
  object edtSearchBar: TEdit
    Left = 8
    Top = 80
    Width = 249
    Height = 21
    TabOrder = 0
    OnChange = edtSearchBarChange
  end
  object btnSearch: TButton
    Left = 471
    Top = 78
    Width = 88
    Height = 25
    Caption = 'Search'
    TabOrder = 1
    OnClick = btnSearchClick
  end
  object pnlHeading: TPanel
    Left = -2
    Top = -1
    Width = 571
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
    Width = 551
    Height = 252
    DataSource = dbmMainDB.EmployeeSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cmbSearchType: TComboBox
    Left = 365
    Top = 80
    Width = 100
    Height = 21
    TabOrder = 4
    Text = 'Select Type'
    Items.Strings = (
      'OwnerID'
      'Address'
      'FirstName')
  end
  object cmbTableSelect: TComboBox
    Left = 263
    Top = 80
    Width = 96
    Height = 21
    TabOrder = 5
    Text = 'Select Table'
    OnChange = cmbTableSelectChange
    Items.Strings = (
      'Building'
      'Employees'
      'Owner'
      'Services')
  end
end
