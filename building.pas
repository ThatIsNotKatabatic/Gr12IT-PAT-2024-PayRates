unit building;

interface

uses
  SysUtils, DateUtils, Dialogs, mainDB;

type

  TBuilding = class(tObject)
  private
    procedure calculate_paid;
  public
    constructor Create(buildingAddress: string; water, elec, refuse: double);
    procedure debug_print;

  var
    water_bill, electricity_bill, refuse_bill: double;
    water_paid, electricity_paid, refuse_paid: double;
    Address: string;
  end;

implementation

{ TBuilding }

constructor TBuilding.Create(buildingAddress: string;
  water, elec, refuse: double);
begin
  // creates
  Address := buildingAddress;
  electricity_bill := elec;
  water_bill := water;
  refuse_bill := refuse;

  calculate_paid;
  //debug_print;
end;

procedure TBuilding.debug_print;
begin
  ShowMessage('Water Paid: ' + floattostr(water_paid)
      + #10#13 + 'Electricity Paid: ' + floattostr(electricity_paid)
      + #10#13 + 'Refuse Paid: ' + floattostr(refuse_paid));
end;

procedure TBuilding.calculate_paid;
begin
  // this totals all the payments made this month for this building
  with dbmMainDB do
  begin
    tblServices.First;
    while not tblServices.Eof do
    begin
      if (tblServices['PropertyAddress'] = Address) and
        (MonthOf(tblServices['PayedDate']) = MonthOf(Now)) then
      begin
        if tblServices['Type'] = 'Water' then
          water_paid := water_paid + tblServices['AmountPaid']
        else if tblServices['Type'] = 'Electricity' then
          electricity_paid := electricity_paid + tblServices['AmountPaid']
        else if tblServices['Type'] = 'Refuse' then
          refuse_paid := refuse_paid + tblServices['AmountPaid'];
      end;
      tblServices.Next;
    end;
  end;
end;

end.
