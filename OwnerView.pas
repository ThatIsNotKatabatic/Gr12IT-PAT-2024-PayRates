unit OwnerView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, pngimage, Owner, ServiceClass, Grids,
  DBGrids, mainDB, MakePayment, Globals;

type
  TfrmOwnerView = class(TForm)
    pnlHeading: TPanel;
    btnMakePay: TButton;
    grpMonthlyDue: TGroupBox;
    lblLogin: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnlWater: TPanel;
    pnlElectricity: TPanel;
    pnlRefuse: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    DBGrid1: TDBGrid;
    redDue: TRichEdit;
    procedure btnMakePayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure createOwner(OwnerID: string);
  end;

var
  frmOwnerView: TfrmOwnerView;
  objOwner: TOwner;
  objGlobals: TGlobals;

implementation

{$R *.dfm}
{ TfrmOwnerView }

procedure TfrmOwnerView.btnMakePayClick(Sender: TObject);
begin
  // make a payment here
  frmMakePayment.show;
  frmMakePayment.setOwner(objOwner.getOwnerID);
end;

procedure TfrmOwnerView.createOwner(OwnerID: string);
var
  i: Integer;
begin
  objOwner := TOwner.create(OwnerID);
  pnlWater.Caption := floattostr(objOwner.getWaterBill);
  pnlRefuse.Caption := floattostr(objOwner.getRefuseBill);
  pnlElectricity.Caption := floattostr(objOwner.getElecBill);

  objGlobals.setSQL('SELECT PropertyAddress, Type, PayedDate, AmountPaid FROM Services WHERE OwnerID = "' + objOwner.getOwnerID + '"');


  redDue.Clear;
  for i := 0 to High(objOwner.getPropertyAddressList) do
  begin
    redDue.Lines.Add('Address: ' + objOwner.getPropertyAddressList[i].Address);
    redDue.Lines.Add('Water Due: ' + FloatToStr(objOwner.getPropertyAddressList[i].water_bill - objOwner.getPropertyAddressList[i].water_paid));
    redDue.Lines.Add('Electricity Due: ' + FloatToStr(objOwner.getPropertyAddressList[i].electricity_bill - objOwner.getPropertyAddressList[i].electricity_paid));
    redDue.Lines.Add('Refuse Due: ' + FloatToStr(objOwner.getPropertyAddressList[i].refuse_bill - objOwner.getPropertyAddressList[i].refuse_paid));
    redDue.Lines.Add('');
  end;

end;

procedure TfrmOwnerView.FormCreate(Sender: TObject);
begin
  objGlobals := TGlobals.create;

end;


end.
