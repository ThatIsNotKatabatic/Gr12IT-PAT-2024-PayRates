object mainDB: TmainDB
  OldCreateOrder = False
  Height = 401
  Width = 739
  object employeeDatasource: TDataSource
    DataSet = tblEmployee
    Left = 240
    Top = 112
  end
  object mainDBConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\Delphi\IT PAT Gr' +
      ' 12 PayRates\PayRates.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 192
  end
  object tblEmployee: TADOTable
    Active = True
    Connection = mainDBConnection
    CursorType = ctStatic
    TableName = 'Employees'
    Left = 136
    Top = 88
  end
  object tblOwners: TADOTable
    Active = True
    Connection = mainDBConnection
    CursorType = ctStatic
    TableName = 'Owner'
    Left = 136
    Top = 152
  end
  object tblBuilding: TADOTable
    Active = True
    Connection = mainDBConnection
    CursorType = ctStatic
    TableName = 'Building'
    Left = 136
    Top = 208
  end
  object tblServices: TADOTable
    Active = True
    Connection = mainDBConnection
    CursorType = ctStatic
    TableName = 'Services'
    Left = 136
    Top = 272
  end
end
