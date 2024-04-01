unit EmployeeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmEmployeeView = class(TForm)
    edtSearchBar: TEdit;
    btnSearch: TButton;
    redOut: TRichEdit;
    pnlHeading: TPanel;
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
