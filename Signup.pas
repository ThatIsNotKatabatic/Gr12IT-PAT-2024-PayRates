unit Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI, Math, Globals, Main_DB;

type
  TfrmSignUp = class(TForm)
    Label2: TLabel;
    edtEmailAddress: TEdit;
    btnSignUp: TButton;
    pnlHeading: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edtPhoneNumber: TEdit;
    edtFullName: TEdit;
    btnValidate: TButton;
    Label1: TLabel;
    edtValidationCode: TEdit;
    Label5: TLabel;
    edtPassword: TEdit;
    procedure btnValidateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    function searchDatabase(value: string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;
  objGlobals: TGlobals;
  verificationCode: string;

implementation

{$R *.dfm}

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
begin
  // check if verification code is correct
  if edtValidationCode.Text <> verificationCode then
  begin
    ShowMessage('Verification code is incorrect');
    exit();
  end;
  // check Full Name
  if pos(' ', edtFullName.Text) = -1 then
  begin
    ShowMessage('You did not enter a FULL NAME.');
    exit();
  end;
  // check phone number
  if (length(edtPhoneNumber.Text) <> 9) OR (length(edtPhoneNumber.Text) <> 10)
    then
  begin
    ShowMessage('Phone number doesnt have enough numbers.');
    exit();
  end;
  // check password
  if length(edtPassword.Text) < 6 then
  begin
    ShowMessage('Password must be 6 characters or longer');
    exit();
  end;

  // commit to  database
  with dbmMainDB do
  begin
    tblOwners.Append;
    tblOwners['EmailAddress'] := edtEmailAddress.Text;
    tblOwners['PhoneNumber'] := edtPhoneNumber.Text;
    tblOwners['FirstName'] := copy(edtFullName.Text, 1,
      pos(' ', edtFullName.Text) - 1);
    tblOwners['LastName'] := copy(edtFullName.Text,
      pos(' ', edtFullName.Text) + 1);
    tblOwners['Password'] := edtPassword.Text;
    tblOwners['OwnerID'] := copy(tblOwners['FirstName'], 1, 3) + copy
      (tblOwners['FirstName'], 1, 2) + inttostr(RandomRange(100, 999));
    tblOwners.Post;
  end;
  ShowMessage('Sign Up successful. You may now login on the homepage.');

  Hide;

end;

procedure TfrmSignUp.btnValidateClick(Sender: TObject);
begin
  // TODO: do a check to make sure that email isn't already in database
  if searchDatabase(edtEmailAddress.Text) = true then
  begin
    ShowMessage('Email address already exists. Please enter another one');
    exit();
  end;
  verificationCode := inttostr(RandomRange(10000, 99999));
  objGlobals.sendEmail('Validation Code for PayRates App',
    'validation code is: ' + verificationCode, edtEmailAddress.Text);
end;

procedure TfrmSignUp.FormCreate(Sender: TObject);
begin
  objGlobals := TGlobals.create;
end;

function TfrmSignUp.searchDatabase(value: string): boolean;
var
  i: integer;
begin
  // does a search through the database for a specific field and value
  // returns true if a match was found
  with dbmMainDB do
  begin
    tblOwners.First;
    while Not tblOwners.EOF do
    begin
      if tblOwners['EmailAddress'] = value then
      begin
        Result := true;
        exit();
      end;
      tblOwners.Next;
      inc(i);
    end;
  end;
  Result := False;
end;

end.
