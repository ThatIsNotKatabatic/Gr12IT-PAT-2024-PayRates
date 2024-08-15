unit EmployeeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, mainDB, Globals;

type
  TfrmEmployeeView = class(TForm)
    edtSearchBar: TEdit;
    btnSearch: TButton;
    pnlHeading: TPanel;
    dbgOut: TDBGrid;
    cmbSearchType: TComboBox;
    cmbTableSelect: TComboBox;
    procedure btnSearchClick(Sender: TObject);
    procedure cmbTableSelectChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSearchBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmployeeView: TfrmEmployeeView;
  arrTypeOptions: array [0 .. 3, 0 .. 6] of string;

implementation

{$R *.dfm}

procedure TfrmEmployeeView.btnSearchClick(Sender: TObject);
var
  search_type, table: string;
  objGlobals: TGlobals;
begin
  if cmbSearchType.ItemIndex = -1 then
  begin
    ShowMessage('please select a search type');
    Exit;
  end;
  if cmbTableSelect.ItemIndex = -1 then
  begin
    ShowMessage('please select a table to search through');
    Exit;
  end;

  search_type := cmbSearchType.Text;
  table := cmbTableSelect.Text;
  objGlobals := TGlobals.create;

  objGlobals.setSQL('SELECT * from ' + table + ' WHERE ' + search_type +
      ' LIKE "%' + edtSearchBar.Text + '%"');

end;

procedure TfrmEmployeeView.cmbTableSelectChange(Sender: TObject);
var
  i: Integer;
begin
cmbSearchType.Items.Clear;
  for i := 0 to 4 do
  begin
  cmbSearchType.Items.Add(arrTypeOptions[cmbTableSelect.ItemIndex, i])
  end;
end;

procedure TfrmEmployeeView.edtSearchBarChange(Sender: TObject);
begin
if cmbSearchType.ItemIndex = -1 then
    Exit;
if cmbTableSelect.ItemIndex = -1 then
    Exit;

  btnSearchClick(Self);
end;

procedure TfrmEmployeeView.FormCreate(Sender: TObject);
begin
  arrTypeOptions[0, 0] := 'Address';
  arrTypeOptions[0, 1] := 'Owner';

  arrTypeOptions[1, 0] := 'EmployeeID';
  arrTypeOptions[1, 1] := 'EmailAddress';
  arrTypeOptions[1, 2] := 'FirstName';
  arrTypeOptions[1, 3] := 'LastName';

  arrTypeOptions[2, 0] := 'OwnerID';
  arrTypeOptions[2, 1] := 'EmailAddress';
  arrTypeOptions[2, 2] := 'FirstName';
  arrTypeOptions[2, 3] := 'LastName';
  arrTypeOptions[2, 4] := 'PhoneNumber';

  arrTypeOptions[3,0] := 'EntryID';
    arrTypeOptions[3,1] := 'OwnerID';
      arrTypeOptions[3,2] := 'PropertyAddress';
  arrTypeOptions[3,3] := 'Type';
end;

end.
