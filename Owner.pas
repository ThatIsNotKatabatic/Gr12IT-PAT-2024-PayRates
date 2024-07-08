unit Owner;

interface

uses Windows, SysUtils, DateUtils, Dialogs, ServiceClass, mainDB, ServiceClass;

type
  TStringArray = array of string;

  TOwner = class(TObject)

  private
  var
    ownerID: string;
    waterBill, electricityBill, refuseBill: double;
    paymentHistory: array of TServiceClass;
    propertiesOwned: TStringArray;
    duePreMonth, DueThisMonth: array [1 .. 3] of double

      public constructor create(Owner_ID: string);
    procedure calcOverdue;
    function getWaterBill: double;
    function getElecBill: double;
    function getRefuseBill: double;
    function getOwnerID: string;
    function getPropertyAddressList: TStringArray;
  end;

implementation

{ TOwner }

procedure TOwner.calcOverdue;
var
  pre_month, i: integer;
begin
  pre_month = MonthOf(Now) - 1;

  i := 0;
  SetLength(paymentHistory, 0);

  // this first part is for getting useful info 
  with dbmMainDB do
  begin
    tblServices.First;
    while not tblServices.Eof do
    begin
      if tblServices['OwnerID'] = ownerID then
      begin
        if (MonthOf(tblServices['PayedDate']) = pre_month) or
          (MonthOf(tblServices['PayedDate']) = MonthOf(Now)) then
        begin
          SetLength(paymentHistory, Length(paymentHistory) + 1);
          paymentHistory[i] := TServiceClass.create;
          paymentHistory[i].payDate := tblServices['PayedDate'];
          paymentHistory[i].amountPaid := tblServices['AmountPaid'];
          paymentHistory[i].serviceType := tblServices['Type'];
        end;
        Inc(i);
      end;
      tblServices.Next;
    end;
  end;

  // calculate how much was due last month 
  for i := 1 to Length(paymentHistory) do
  begin

  end;

end;

constructor TOwner.create(Owner_ID: string);
var
  i: integer;
begin
  with dbmMainDB do
  begin

    ownerID := Owner_ID;
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
        electricityBill := electricityBill + tblBuildings
          ['MonthlyElectricityBill'];
        refuseBill := refuseBill + tblBuildings['MonthlyRefuseBill'];

        SetLength(propertiesOwned, Length(propertiesOwned) + 1);
        propertiesOwned[i] := tblBuildings['Address'];
        Inc(i);
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
var
  i: integer;
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
