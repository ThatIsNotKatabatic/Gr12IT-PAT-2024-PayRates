unit OwnerView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, pngimage, Owner;

type
  TfrmOwnerView = class(TForm)
    redHistory: TRichEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure createOwner(index : integer);
  end;

var
  frmOwnerView: TfrmOwnerView;
  objOwner : TOwner;

implementation

{$R *.dfm}

{ TfrmOwnerView }

procedure TfrmOwnerView.createOwner(index: integer);
begin
  objOwner := TOwner.create(index);
end;

end.
