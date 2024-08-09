unit Owner;

interface

uses
  Windows, SysUtils, DateUtils, Dialogs, ServiceClass, mainDB, building;

type
  TBuildingsArray = array of TBuilding;

  TInnerArray = array [0 .. 2] of Double;

  T2DArray = array of TInnerArray;

  TOwner = class(TObject)
  private
    ownerID: string;
    waterBill, electricityBill, refuseBill: Double;
    paymentHistory: array of TServiceClass;

  public
    duePreMonth_PerProperty, DueThisMonth_PerProperty: T2DArray;
    propertiesOwned: TBuildingsArray;
    constructor Create(Owner_ID: string);
    procedure calcOverdue;
    function getWaterBill: Double;
    function getElecBill: Double;
    function getRefuseBill: Double;
    function getOwnerID: string;
    function getPropertyAddressList: TBuildingsArray;
  end;

implementation

{ TOwner }

constructor TOwner.Create(Owner_ID: string);
var
  i: integer;
begin
  inherited Create;
  ownerID := Owner_ID;
  waterBill := 0;
  electricityBill := 0;
  refuseBill := 0;
  SetLength(propertiesOwned, 0);
  with dbmMainDB do
  begin
    tblBuildings.First;
    while not tblBuildings.Eof do
    begin
      if tblBuildings['Owner'] = ownerID then
      begin
        // add to the building array
        SetLength(propertiesOwned, Length(propertiesOwned) + 1);
        propertiesOwned[ High(propertiesOwned)] := TBuilding.Create
          (tblBuildings['Address'],
          tblBuildings['MonthlyWaterBill'],
          tblBuildings['MonthlyElectricityBill'],
          tblBuildings['MonthlyRefuseBill']);

        // add towards the total bill
        waterBill := waterBill + tblBuildings['MonthlyWaterBill'];
        electricityBill := electricityBill + tblBuildings
          ['MonthlyElectricityBill'];
        refuseBill := refuseBill + tblBuildings['MonthlyRefuseBill'];

      end;
      tblBuildings.Next;
    end;
  end;

  calcOverdue;
end;

procedure TOwner.calcOverdue;
begin
    // I'll do this tomorrow
end;

function TOwner.getElecBill: Double;
begin
  Result := electricityBill;
end;

function TOwner.getOwnerID: string;
begin
  Result := ownerID;
end;

function TOwner.getPropertyAddressList: TBuildingsArray;
begin
  Result := propertiesOwned;
end;

function TOwner.getRefuseBill: Double;
begin
  Result := refuseBill;
end;

function TOwner.getWaterBill: Double;
begin
  Result := waterBill;
end;

end.
