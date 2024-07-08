unit MakePayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Owner, mainDB, Math;

type
  TfrmMakePayment = class(TForm)
    sedAmount: TSpinEdit;
    btnCancel: TButton;
    btnPay: TButton;
    lblLogin: TLabel;
    rgpChoose: TRadioGroup;
    Label1: TLabel;
    pnlHeading: TPanel;
    Label2: TLabel;
    cmbProperty: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure rgpChooseClick(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
  private
    { Private declarations }
  var
    payments_made: integer;
  public
    { Public declarations }
    procedure setOwner(input_OwnerID: string);
  end;

var
  frmMakePayment: TfrmMakePayment;
  objOwner: TOwner;

implementation

{$R *.dfm}

procedure TfrmMakePayment.btnCancelClick(Sender: TObject);
begin
  Hide;
end;

procedure TfrmMakePayment.btnPayClick(Sender: TObject);
begin

  if cmbProperty.Text = 'Pick a property' then
  begin
    ShowMessage('please pick a property');
    exit;
  end;
  if rgpChoose.ItemIndex = -1 then
    begin
      ShowMessage('please choose a type of payment');
      exit;
    end;



  with dbmmainDB do
  begin
    tblServices.Append;
    tblServices['EntryID'] := objOwner.getOwnerID + FormatDateTime('ddmmyy', Date) + inttostr(payments_made);
    tblServices['PropertyAddress'] := cmbProperty.Text;
    tblServices['Type'] := rgpChoose.Items[rgpChoose.ItemIndex];
    tblServices['PayedDate'] := Date;
    tblServices['AmountPaid'] := sedAmount.value;
    tblServices.Post;
  end;

  inc(payments_made);
end;

procedure TfrmMakePayment.rgpChooseClick(Sender: TObject);
begin
  case rgpChoose.ItemIndex of
    0:
      sedAmount.MaxValue := trunc(objOwner.getWaterBill);
    1:
      sedAmount.MaxValue := trunc(objOwner.getElecBill);
    2:
      sedAmount.MaxValue := trunc(objOwner.getRefuseBill);
  end;
  sedAmount.value := sedAmount.MaxValue;

end;

procedure TfrmMakePayment.setOwner(input_OwnerID: string);
var
  i: Integer;
  OwnedAddress : TStringArray;
begin
  objOwner := TOwner.create(input_OwnerID);
  payments_made := 0;

  OwnedAddress := objOwner.getPropertyAddressList;
  for i := 0 to length(OwnedAddress) - 1 do
  begin
    cmbProperty.Items.Add(OwnedAddress[i]);
  end;

end;

end.
