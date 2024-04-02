object dbmMainDB: TdbmMainDB
  OldCreateOrder = False
  Height = 282
  Width = 446
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\Delphi\IT PAT Gr' +
      ' 12 PayRates\PayRates.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 112
  end
  object tblEmployee: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Employees'
    Left = 136
    Top = 48
  end
  object tblOwners: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Owner'
    Left = 136
    Top = 112
  end
end
