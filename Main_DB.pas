unit Main_DB;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule3 = class(TDataModule)
    login_tbl: TADOTable;
    login_datasource: TDataSource;
    main_db_connection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{$R *.dfm}

end.
