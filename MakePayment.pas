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
    procedure cmbPropertyChange(Sender: TObject);
  private
    { Private declarations }
  var
    payments_made: integer;
    water_max, elec_max, refuse_max: double;
  public
    { Public declarations }
    procedure setOwner(input_OwnerID: string);
    procedure set_spinedit_max;
  end;

var
  frmMakePayment: TfrmMakePayment;
  objOwner: TOwner;

implementation

{$R *.dfm}

// Procedure for handling the cancel button click event
procedure TfrmMakePayment.btnCancelClick(Sender: TObject);
begin
  Hide;  // Hides the form without making any changes or saving data
end;

// Procedure for handling the payment button click event
procedure TfrmMakePayment.btnPayClick(Sender: TObject);
begin
  // Check if a property has been selected
  if cmbProperty.Text = 'Pick a property' then
  begin
    ShowMessage('please pick a property');  // Show a message if no property is selected
    exit;  // Exit the procedure if no property is selected
  end;

  // Check if a type of payment has been selected
  if rgpChoose.ItemIndex = -1 then
  begin
    ShowMessage('please choose a type of payment');  // Show a message if no payment type is selected
    exit;  // Exit the procedure if no payment type is selected
  end;

  // Add a new record to the tblServices table
  with dbmmainDB do
  begin
    tblServices.Append;  // Start appending a new record to the table
    // Set the values for the new record
    tblServices['EntryID'] := objOwner.getOwnerID + FormatDateTime('ddmmyy', Date) + inttostr(payments_made);
    tblServices['OwnerID'] := objOwner.getOwnerID;
    tblServices['PropertyAddress'] := cmbProperty.Text;
    tblServices['Type'] := rgpChoose.Items[rgpChoose.ItemIndex];
    tblServices['PayedDate'] := Date;
    tblServices['AmountPaid'] := sedAmount.value;
    tblServices.Post;  // Save the new record to the table
  end;

  inc(payments_made);  // Increment the number of payments made
  Hide;  // Hide the form after processing the payment
end;

// Procedure for handling changes in the property combo box
procedure TfrmMakePayment.cmbPropertyChange(Sender: TObject);
begin
  // If a payment type has been selected, update the maximum value of the spinedit control
  if rgpChoose.ItemIndex > -1 then
    set_spinedit_max;
end;

// Procedure for handling clicks on the payment type radio group
procedure TfrmMakePayment.rgpChooseClick(Sender: TObject);
begin
  // If a property has been selected, update the maximum value of the spinedit control
  if cmbProperty.ItemIndex > -1 then
    set_spinedit_max;
end;

// Procedure for setting the owner and populating the property combo box
procedure TfrmMakePayment.setOwner(input_OwnerID: string);
var
  i: integer;  // Loop index
  OwnedAddress: TBuildingsArray;  // Array of owned properties
begin
  // Create a new owner object based on the provided OwnerID
  objOwner := TOwner.create(input_OwnerID);

  // Get the list of property addresses owned by the owner
  OwnedAddress := objOwner.getPropertyAddressList;
  cmbProperty.Items.Clear;  // Clear the current items in the property combo box

  // Populate the property combo box with owned property addresses
  for i := 0 to length(OwnedAddress) - 1 do
  begin
    cmbProperty.Items.Add(OwnedAddress[i].Address);
  end;
end;

// Procedure for setting the maximum value of the spinedit control based on the payment type
procedure TfrmMakePayment.set_spinedit_max;
begin
  case rgpChoose.ItemIndex of
    0:  // Water bill
      sedAmount.MaxValue := trunc(objOwner.getPropertyAddressList[cmbProperty.ItemIndex].water_bill);
    1:  // Electricity bill
      sedAmount.MaxValue := trunc(objOwner.getPropertyAddressList[cmbProperty.ItemIndex].electricity_bill);
    2:  // Refuse bill
      sedAmount.MaxValue := trunc(objOwner.getPropertyAddressList[cmbProperty.ItemIndex].refuse_bill);
  end;
  sedAmount.value := sedAmount.MaxValue;  // Set the spinedit value to its maximum value
end;

end.
