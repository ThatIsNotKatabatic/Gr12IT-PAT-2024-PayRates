unit EmployeeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, mainDB;

type
  TfrmEmployeeView = class(TForm)
    edtSearchBar: TEdit;
    btnSearch: TButton;
    pnlHeading: TPanel;
    dbgOut: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmployeeView: TfrmEmployeeView;

implementation

{$R *.dfm}

end.
