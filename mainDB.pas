unit mainDB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdbmMainDB = class(TDataModule)
    ADOConnection1: TADOConnection;
    tblEmployee: TADOTable;
    tblOwners: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dbmMainDB: TdbmMainDB;

implementation

{$R *.dfm}

end.
