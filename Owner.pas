unit Owner;

interface

uses
  Windows, SysUtils, DateUtils, Dialogs, ServiceClass, mainDB, building;

type
  // Define an array of TBuilding objects
  TBuildingsArray = array of TBuilding;

  // Define the TOwner class
  TOwner = class(TObject)
  private
    ownerID: string;  // Unique identifier for the owner
    waterBill, electricityBill, refuseBill: Double;  // Total bills for water, electricity, and refuse
    waterPaid, electricityPaid, refusePaid: Double;  // Amounts paid towards each bill
    propertiesOwned: TBuildingsArray;  // Array of properties owned by the owner

  public
    // Constructor to initialize the TOwner object with the given Owner_ID
    constructor Create(Owner_ID: string);

    // Functions to get the total bills and owner ID
    function getWaterBill: Double;
    function getElecBill: Double;
    function getRefuseBill: Double;
    function getOwnerID: string;
    function getPropertyAddressList: TBuildingsArray;
  end;

implementation

{ TOwner }

// Constructor to initialize the TOwner instance
constructor TOwner.Create(Owner_ID: string);
var
  i: integer;  // Loop variable
begin
  inherited Create;  // Call the inherited constructor
  ownerID := Owner_ID;  // Set the owner ID
  waterBill := 0;  // Initialize water bill
  electricityBill := 0;  // Initialize electricity bill
  refuseBill := 0;  // Initialize refuse bill
  SetLength(propertiesOwned, 0);  // Initialize the properties array

  // Loop through all records in the tblBuildings table
  with dbmMainDB do
  begin
    tblBuildings.First;  // Start at the first record
    while not tblBuildings.Eof do
    begin
      // Check if the building is owned by the current owner
      if tblBuildings['Owner'] = ownerID then
      begin
        // Add the building to the properties array
        SetLength(propertiesOwned, Length(propertiesOwned) + 1);
        propertiesOwned[High(propertiesOwned)] := TBuilding.Create(
          tblBuildings['Address'],
          tblBuildings['MonthlyWaterBill'],
          tblBuildings['MonthlyElectricityBill'],
          tblBuildings['MonthlyRefuseBill']
        );

        // Add the building's bills to the total bills
        waterBill := waterBill + tblBuildings['MonthlyWaterBill'];
        electricityBill := electricityBill + tblBuildings['MonthlyElectricityBill'];
        refuseBill := refuseBill + tblBuildings['MonthlyRefuseBill'];
      end;
      tblBuildings.Next;  // Move to the next record
    end;
  end;

  // Calculate the total amounts that are still due
  for i := 0 to High(propertiesOwned) do
  begin
    waterPaid := waterPaid + propertiesOwned[i].water_bill - propertiesOwned[i].water_paid;
    electricityPaid := electricityPaid + propertiesOwned[i].electricity_bill - propertiesOwned[i].electricity_paid;
    refusePaid := refusePaid + propertiesOwned[i].refuse_bill - propertiesOwned[i].refuse_paid;
  end;
end;

// Function to get the total electricity bill
function TOwner.getElecBill: Double;
begin
  Result := electricityBill;
end;

// Function to get the owner ID
function TOwner.getOwnerID: string;
begin
  Result := ownerID;
end;

// Function to get the list of properties owned by the owner
function TOwner.getPropertyAddressList: TBuildingsArray;
begin
  Result := propertiesOwned;
end;

// Function to get the total refuse bill
function TOwner.getRefuseBill: Double;
begin
  Result := refuseBill;
end;

// Function to get the total water bill
function TOwner.getWaterBill: Double;
begin
  Result := waterBill;
end;

end.

