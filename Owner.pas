unit Owner;

interface

uses Windows, SysUtils, Dialogs, ServiceClass, mainDB;

type
  TStringArray = array of string;
  TOwner = class(TObject)


  private
  var
  ownerID : string;
  waterBill, electricityBill, refuseBill : double;
  paymentHistory : array of TServiceClass;
  propertiesOwned : TStringArray;


  public
    constructor create(Owner_ID: string);
    procedure calcOverdue;
    function getWaterBill: double;
    function getElecBill: double;
    function getRefuseBill: double;
    function getOwnerID : string;
    function getPropertyAddressList : TStringArray;
  end;

implementation

{ TOwner }

procedure TOwner.calcOverdue;
begin
 // this will be a chucky function :)
end;

constructor TOwner.create(Owner_ID: string);
var
  i: integer;
begin
  with dbmMainDB do
  begin

    OwnerID := Owner_ID;
    waterBill := 0;
    electricityBill := 0;
    refuseBill := 0;

    i := 0;
    SetLength(propertiesOwned, 0);

    tblBuildings.First;
    while not tblBuildings.Eof do
    begin
      if tblBuildings['Owner'] = ownerID then
        begin
          waterBill := waterBill + tblBuildings['MonthlyWaterBill'];
          electricityBill := electricityBill + tblBuildings['MonthlyElectricityBill'];
          refuseBill := refuseBill + tblBuildings['MonthlyRefuseBill'];

          SetLength(propertiesOwned, Length(propertiesOwned) + 1);
          propertiesOwned[i] := tblBuildings['Address'];
          inc(i);
        end;
      tblBuildings.Next;
    end;


  // get payment history

  end;
end;

function TOwner.getElecBill: double;
begin
  Result := electricityBill;
end;

function TOwner.getOwnerID: string;
begin
 Result := ownerID;
end;

function TOwner.getPropertyAddressList: TStringArray;
var i : integer;
begin
  Result := propertiesOwned;
end;

function TOwner.getRefuseBill: double;
begin
  Result := refuseBill;
end;

function TOwner.getWaterBill: double;
begin
  Result := waterBill;
end;

end.
