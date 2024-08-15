unit Validation_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, math;

type
  DataValidation = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor create;
    function isDigitOnly(sInput: string): boolean;
    function isBlank(sInput: string): boolean;
    function isTenDigits(sInput: string): boolean;
    function isDateBlank(iDay, iMonth, iYear: integer): boolean;
    function isDateValid(sDay, sMonth, sYear: string): boolean;
    function isTimeBlank(iHour, iMinute: integer): boolean;
    function ConfirmPassword(Password1, Password2: string): boolean;
    function isValidPassword(Password: string): boolean;
    procedure redtOrderDetails;
    function isValidEmail(sInput: string): boolean;
    procedure populateRedtViewDeliveries;
    function isValidNumInput(sInput: string): boolean;

    //----------------------------------------------------------
    //my function to generate a number for Unique IDs
    function GenerateNumber : integer;
  end;

var
  Validate: DataValidation;

implementation


{ DataValidation }

// check if both password inputs match
function DataValidation.ConfirmPassword(Password1, Password2: string): boolean;
begin
  result := false;
  if Password1 = Password2 then
  begin
    result := true;
  end;
end;

// check if input is blank
constructor DataValidation.create;
begin

end;

function DataValidation.GenerateNumber: integer;
begin
 result:= randomrange(1,1000);
end;

function DataValidation.isBlank(sInput: string): boolean;
begin
  result := false;
  if sInput = '' then
    result := true;
end;

// check if date input is blank
function DataValidation.isDateBlank(iDay, iMonth, iYear: integer): boolean;
begin
  result := false;
  if (iDay = -1) or (iMonth = -1) or (iYear = -1) then
    result := true;
end;

// check if the date input is valid
function DataValidation.isDateValid(sDay, sMonth, sYear: string): boolean;
begin
  result := true;
  if ((sDay = '30') and (sMonth = '02')) or
    ((sDay = '29') and (sMonth = '02') and (strtoint(sYear) mod 4 <> 0) and
      (strtoint(sYear) mod 100 <> 0) and (strtoint(sYear) mod 400 <> 0)) then
  begin
    result := false;
    Exit;
  end

  else if (sDay = '31') and ((sMonth = '02') or (sMonth = '04') or
      (sMonth = '06') or (sMonth = '09') or (sMonth = '11')) then
  begin
    result := false;
    Exit;
  end;
end;

// check if input is only digits
function DataValidation.isDigitOnly(sInput: string): boolean;
var
  I: integer;
  ch: char;
begin
  result := true;
  for I := 1 to Length(sInput) do
  begin
    ch := sInput[I];
    if not(ch IN ['0' .. '9']) then
    begin
      result := false;
      Exit;
    end;
  end
end;

// check if input is ten digits long
function DataValidation.isTenDigits(sInput: string): boolean;
begin
  result := false;
  if Length(sInput) = 10 then
    result := true;
end;

// check if time input is blank
function DataValidation.isTimeBlank(iHour, iMinute: integer): boolean;
begin
  result := false;
  if (iHour = -1) or (iMinute = -1) then
  begin
    result := true;
  end;
end;

// check if email input is valid
function DataValidation.isValidEmail(sInput: string): boolean;
begin
  result := false;
  if pos('@', sInput) > 0 then
    result := true;
end;

// check if password input is valid
function DataValidation.isValidPassword(Password: string): boolean;
var
  ch: char;
  I, j: integer;
  // flag, flag2: boolean;
begin
  result := false;
  j := 0;
  // check if length of input equal to or greater than 8
  if Length(Password) >= 8 then
  begin
    Inc(j);
    // check for symbol in input
    for I := 1 to Length(Password) do
    begin
      ch := Password[I];
      case ch of
        '!':
          begin
            Inc(j);
            break;
          end;
        '@':
          begin
            Inc(j);
            break;
          end;
        '#':
          begin
            Inc(j);
            break;
          end;
        '$':
          begin
            Inc(j);
            break;
          end;
        '%':
          begin
            Inc(j);
            break;
          end;
        '^':
          begin
            Inc(j);
            break;
          end;
        '&':
          begin
            Inc(j);
            break;
          end;
        '*':
          begin
            Inc(j);
            break;
          end;
        '(':
          begin
            Inc(j);
            break;
          end;
        ')':
          begin
            Inc(j);
            break;
          end;
        '-':
          begin
            Inc(j);
            break;
          end;
        '_':
          begin
            Inc(j);
            break;
          end;
        '=':
          begin
            Inc(j);
            break;
          end;
        '+':
          begin
            Inc(j);
            break;
          end;
        '[':
          begin
            Inc(j);
            break;
          end;
        ']':
          begin
            Inc(j);
            break;
          end;
        '{':
          begin
            Inc(j);
            break;
          end;
        '}':
          begin
            Inc(j);
            break;
          end;
        ';':
          begin
            Inc(j);
            break;
          end;
        ':':
          begin
            Inc(j);
            break;
          end;
        '"':
          begin
            Inc(j);
            break;
          end;
        ',':
          begin
            Inc(j);
            break;
          end;
        '.':
          begin
            Inc(j);
            break;
          end;
        '<':
          begin
            Inc(j);
            break;
          end;
        '>':
          begin
            Inc(j);
            break;
          end;
        '/':
          begin
            Inc(j);
            break;
          end;
        '?':
          begin
            Inc(j);
            break;
          end;
        '\':
          begin
            Inc(j);
            break;
          end;
        '|':
          begin
            Inc(j);
            break;
          end;
        '`':
          begin
            Inc(j);
            break;
          end;
        '~':
          begin
            Inc(j);
            break;
          end;

      end;

    end;
    // check for number in input
    for I := 1 to Length(Password) do
    begin
      ch := Password[I];
      if ch IN ['0' .. '9'] then
      begin
        Inc(j);
        break;
      end;
    end;
    // check for letter in input
    for I := 1 to Length(Password) do
    begin
      ch := Password[I];
      if ch IN ['A' .. 'z'] then
      begin
        Inc(j);
        break;
      end;
    end;

  end;
  if j = 4 then
  begin
    result := true;
  end;
end;

// check for valid number input for comma or full stop(point)
function DataValidation.isValidNumInput(sInput: string): boolean;
var
  sNum: string;
begin
  if pos('.', sInput) <> 0 then
  begin
    sNum := copy(sInput, 0, pos('.', sInput) - 1) + copy(sInput,
      pos('.', sInput) + 1);
  end
  else if pos(',', sInput) <> 0 then
  begin
    sNum := copy(sInput, 0, pos(',', sInput) - 1) + copy(sInput,
      pos(',', sInput) + 1);
  end
  else
  begin
    sNum := sInput;
  end;
  if isDigitOnly(sNum) then
  begin
    result := true;
  end
  else
  begin
    result := false;
  end;
end;

// input text into redtViewDeliveries
procedure DataValidation.populateRedtViewDeliveries;
var
  sInsurance: string;
  flag: boolean;
begin
{  flag := false;
  with Adminform do
  begin
    with DataModule1 do
    begin
      if tblDelivery['insurance'] then
      begin
        sInsurance := 'Yes';
      end
      else
      begin
        sInsurance := 'No';
      end;
      tblUsers.First;
      if tblDelivery['Recipient'] <> tblUsers['UserID'] then
      begin
        while not tblUsers.Eof and (not flag) do
        begin
          if tblDelivery['Recipient'] = tblUsers['UserID'] then
          begin
            flag := true;
          end;
          tblUsers.Next;
        end;
      end;
      redtViewDeliveries.Lines.Add
        (tblDelivery['Waybill'] + #9 + tblUsers['Username']
          + #9 + FormatDateTime('dd/mm/yyyy', tblDelivery['OrderDate'])
          + #9 + tblDelivery['State'] + #9 + tblDelivery['Priority']
          + #9 + sInsurance + #9 + tblDelivery['Transport'] + #9 + floattostr
          (tblDelivery['Distance']) + ' km' + #9 + formatfloat('R0.00',
          tblDelivery['DeliveryCost']) + #9 + formatfloat('R0.00',
          tblDelivery['ItemCost']) + #9 + formatfloat('R0.00',
          tblDelivery['TotalCost']));
    end;
  end;
end;

// set tab width for redtOrder
procedure DataValidation.redtOrderSort;
begin
  with HomeForm do
  begin
    redtOrder.Paragraph.TabCount := 5;
    redtOrder.Paragraph.Tab[0] := 0;
    redtOrder.Paragraph.Tab[1] := 35;
    redtOrder.Paragraph.Tab[2] := 60;
    redtOrder.Paragraph.Tab[3] := 210;
    // redtOrder.Paragraph.Tab[4] := 215;
    redtOrder.Lines.Clear;
  end;
end;

// set tab width for redtViewDeliveries
procedure DataValidation.redtViewDeliveries;
begin
  with Adminform do
  begin
    redtViewDeliveries.Paragraph.TabCount := 11;
    redtViewDeliveries.Paragraph.Tab[0] := 0;
    redtViewDeliveries.Paragraph.Tab[1] := 75;
    redtViewDeliveries.Paragraph.Tab[2] := 175;
    redtViewDeliveries.Paragraph.Tab[3] := 275;
    redtViewDeliveries.Paragraph.Tab[4] := 375;
    redtViewDeliveries.Paragraph.Tab[5] := 450;
    redtViewDeliveries.Paragraph.Tab[6] := 525;
    redtViewDeliveries.Paragraph.Tab[7] := 600;
    redtViewDeliveries.Paragraph.Tab[8] := 675;
    redtViewDeliveries.Paragraph.Tab[9] := 785;
    redtViewDeliveries.Paragraph.Tab[10] := 900;
    redtViewDeliveries.Lines.Clear;
  end; }
end;

// set tab width for redtOrderDetails
procedure DataValidation.redtOrderDetails;
begin
{  with HomeForm do
  begin
    redOrderDetails.Paragraph.TabCount := 9;
    redOrderDetails.Paragraph.Tab[0] := 0;
    redOrderDetails.Paragraph.Tab[1] := 100;
    redOrderDetails.Paragraph.Tab[2] := 200;
    redOrderDetails.Paragraph.Tab[3] := 300;
    redOrderDetails.Paragraph.Tab[4] := 375;
    redOrderDetails.Paragraph.Tab[5] := 450;
    redOrderDetails.Paragraph.Tab[6] := 525;
    redOrderDetails.Paragraph.Tab[7] := 625;
    redOrderDetails.Paragraph.Tab[8] := 725;
    redOrderDetails.Lines.Clear;
  end; }
end;

end.
