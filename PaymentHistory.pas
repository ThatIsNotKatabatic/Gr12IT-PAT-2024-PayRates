unit PaymentHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls;

type
  TfrmPaymentHistory = class(TForm)
    dbgrd1: TDBGrid;
    pnlHeading: TPanel;
    btnExit: TButton;
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaymentHistory: TfrmPaymentHistory;

implementation

{$R *.dfm}

procedure TfrmPaymentHistory.btnExitClick(Sender: TObject);
begin
  Hide;
end;

end.
