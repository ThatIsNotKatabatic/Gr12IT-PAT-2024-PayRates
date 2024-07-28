unit Owner;

interface

uses
  Windows, SysUtils, DateUtils, Dialogs, ServiceClass, mainDB;

type
  TStringArray = array of string;
  TInnerArray = array[0 .. 2] of Double;
  T2DArray = array of TInnerArray;

  TOwner = class(TObject)
  private
    ownerID: string;
    waterBill, electricityBill, refuseBill: Double;
    paymentHistory: array of TServiceClass;
    propertiesOwned: TStringArray;
  public
    duePreMonth_PerProperty, DueThisMonth_PerProperty: T2DArray;
    constructor Create(Owner_ID: string);
    procedure calcOverdue;
    procedure calc_property_list;
    function getWaterBill: Double;
    function getElecBill: Double;
    function getRefuseBill: Double;
    function getOwnerID: string;
    function getPropertyAddressList: TStringArray;
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
        waterBill := waterBill + tblBuildings['MonthlyWaterBill'];
        electricityBill := electricityBill + tblBuildings['MonthlyElectricityBill'];
        refuseBill := refuseBill + tblBuildings['MonthlyRefuseBill'];

        SetLength(propertiesOwned, Length(propertiesOwned) + 1);
        propertiesOwned[High(propertiesOwned)] := tblBuildings['Address'];
      end;
      tblBuildings.Next;
    end;
  end;

  calcOverdue;
end;

procedure TOwner.calcOverdue;
var
  pre_month, i, j, r: integer;
begin
  pre_month := MonthOf(Now) - 1;
  SetLength(paymentHistory, 0);

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
          paymentHistory[High(paymentHistory)] := TServiceClass.Create;
          paymentHistory[High(paymentHistory)].payDate := tblServices['PayedDate'];
          paymentHistory[High(paymentHistory)].amountPaid := tblServices['AmountPaid'];
          paymentHistory[High(paymentHistory)].serviceType := tblServices['Type'];
          paymentHistory[High(paymentHistory)].address := tblServices['PropertyAddress'];
        end;
      end;
      tblServices.Next;
    end;
  end;

  calc_property_list;

  SetLength(duePreMonth_PerProperty, Length(propertiesOwned));
  SetLength(dueThisMonth_PerProperty, Length(propertiesOwned));

  for i := 0 to High(duePreMonth_PerProperty) do
  begin
    for j := 0 to 2 do
    begin
      duePreMonth_PerProperty[i][j] := 0;
      dueThisMonth_PerProperty[i][j] := 0;
    end;

    for j := 0 to High(paymentHistory) do
    begin
      if (paymentHistory[j].address = propertiesOwned[i]) then
      begin
        if (MonthOf(paymentHistory[j].payDate) = pre_month) then
        begin
          if paymentHistory[j].serviceType = 'Water' then
            duePreMonth_PerProperty[i][0] := duePreMonth_PerProperty[i][0] + paymentHistory[j].amountPaid;
          if paymentHistory[j].serviceType = 'Electricity' then
            duePreMonth_PerProperty[i][1] := duePreMonth_PerProperty[i][1] + paymentHistory[j].amountPaid;
          if paymentHistory[j].serviceType = 'Refuse' then
            duePreMonth_PerProperty[i][2] := duePreMonth_PerProperty[i][2] + paymentHistory[j].amountPaid;
        end;

        if (MonthOf(paymentHistory[j].payDate) = MonthOf(Now)) then
        begin
          if paymentHistory[j].serviceType = 'Water' then
            dueThisMonth_PerProperty[i][0] := dueThisMonth_PerProperty[i][0] + paymentHistory[j].amountPaid;
          if paymentHistory[j].serviceType = 'Electricity' then
            dueThisMonth_PerProperty[i][1] := dueThisMonth_PerProperty[i][1] + paymentHistory[j].amountPaid;
          if paymentHistory[j].serviceType = 'Refuse' then
            dueThisMonth_PerProperty[i][2] := dueThisMonth_PerProperty[i][2] + paymentHistory[j].amountPaid;
        end;
      end;
    end;
  end;
end;

procedure TOwner.calc_property_list;
var
  i: integer;
begin
  SetLength(propertiesOwned, 0);

  with dbmMainDB do
  begin
    tblBuildings.First;
    while not tblBuildings.Eof do
    begin
      if tblBuildings['OwnerID'] = ownerID then
      begin
        SetLength(propertiesOwned, Length(propertiesOwned) + 1);
        propertiesOwned[High(propertiesOwned)] := tblBuildings['Address'];
      end;
      tblBuildings.Next;
    end;
  end;
end;

function TOwner.getElecBill: Double;
begin
  Result := electricityBill;
end;

function TOwner.getOwnerID: string;
begin
  Result := ownerID;
end;

function TOwner.getPropertyAddressList: TStringArray;
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

