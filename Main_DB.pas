unit main_DB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TmainDB = class(TDataModule)
    employeeDatasource: TDataSource;
    mainDBConnection: TADOConnection;
    tblEmployee: TADOTable;
    tblOwners: TADOTable;
    tblBuilding: TADOTable;
    tblServices: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dbmMainDB: TmainDB;

implementation

{$R *.dfm}

end.
