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
    grpDue: TGroupBox;
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
begin
  objOwner := TOwner.create(OwnerID);
  pnlWater.Caption := floattostr(objOwner.getWaterBill);
  pnlRefuse.Caption := floattostr(objOwner.getRefuseBill);
  pnlElectricity.Caption := floattostr(objOwner.getElecBill);

  objGlobals.setSQL('SELECT PropertyAddress, Type, PayedDate, AmountPaid FROM Services WHERE OwnerID = "' + objOwner.getOwnerID + '"');
end;

procedure TfrmOwnerView.FormCreate(Sender: TObject);
begin
  objGlobals := TGlobals.create;


end;


end.
