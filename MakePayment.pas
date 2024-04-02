unit MakePayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TfrmMakePayment = class(TForm)
    sedAmount: TSpinEdit;
    btnCancel: TButton;
    btnPay: TButton;
    lblLogin: TLabel;
    rgpChoose: TRadioGroup;
    Label1: TLabel;
    pnlHeading: TPanel;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMakePayment: TfrmMakePayment;

implementation

{$R *.dfm}

procedure TfrmMakePayment.btnCancelClick(Sender: TObject);
begin
  Hide;
end;

end.
