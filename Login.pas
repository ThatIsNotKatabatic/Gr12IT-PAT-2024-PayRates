unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI, Globals, Signup, Main_DB,
  EmployeeView, OwnerView;

type
  TfrmLogin = class(TForm)
    lblLogin: TLabel;
    lblEnterLoginName: TLabel;
    lblEnterLoginPassword: TLabel;
    edtLoginEmail: TEdit;
    edtLoginPassword: TEdit;
    btnLogin: TButton;
    pnlHeading: TPanel;
    btnSignUp: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Login;
    function checkPassword(table: string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  objGlobals: TGlobals;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  // check login
  Login;
end;

procedure TfrmLogin.Login;
begin
  with dbmMainDB do
  begin
    tblEmployee.First;
    while Not tblEmployee.EOF do
    begin
      if tblEmployee['EmailAddress'] = edtLoginEmail.Text then
      begin
        if checkPassword('Employee') = true then
        begin
          // login was successful
          frmEmployeeView.Show;
          Hide;
        end
        else
        begin
          ShowMessage('Password wrong');
          exit();
        end;
      end;
      tblEmployee.Next;
    end;
    // search throught the employee table complete, now moving on to owner table
    tblOwners.First;
    while Not tblOwners.EOF do
    begin
      if tblOwners['EmailAddress'] = edtLoginEmail.Text then
      begin
        if checkPassword('Owner') = true then
        begin
          // login was successful
          frmOwnerView.Show;
          Hide;
        end
        else
        begin
          ShowMessage('Password wrong');
          exit();
        end;
      end;
      tblOwners.Next;
    end;
    ShowMessage('Email address not found');
  end;
end;

function TfrmLogin.checkPassword(table: string): boolean;
begin
  if table = 'Employee' then
  begin
    if dbmMainDB.tblEmployee['Password'] = edtLoginPassword.Text then
    begin
      Result := true;
      exit();
    end
    else
    begin
      Result := false;
      exit();
    end;
  end;
  if dbmMainDB.tblOwners['Password'] = edtLoginPassword.Text then
  begin
    Result := true;
    exit();
  end
  else
  begin
    Result := false;
    exit();
  end;

end;

procedure TfrmLogin.btnSignUpClick(Sender: TObject);
begin
  // takes you to the sign up page
  frmSignup.Show;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  objGlobals := TGlobals.create
end;

end.
