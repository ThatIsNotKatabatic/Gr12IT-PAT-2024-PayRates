object DataModule3: TDataModule3
  OldCreateOrder = False
  Height = 401
  Width = 739
  object login_tbl: TADOTable
    Connection = main_db_connection
    CursorType = ctStatic
    TableName = 'login_details'
    Left = 64
    Top = 72
  end
  object login_datasource: TDataSource
    DataSet = login_tbl
    Left = 144
    Top = 72
  end
  object main_db_connection: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 192
  end
end
