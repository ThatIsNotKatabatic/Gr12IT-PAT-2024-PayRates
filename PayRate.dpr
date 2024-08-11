program PayRate;

uses
  Forms,
  Login in 'Login.pas' {frmLogin},
  Signup in 'Signup.pas' {frmSignUp},
  EmployeeView in 'EmployeeView.pas' {frmEmployeeView},
  Globals in 'Globals.pas',
  OwnerView in 'OwnerView.pas' {frmOwnerView},
  MakePayment in 'MakePayment.pas' {frmMakePayment},
  mainDB in 'mainDB.pas' {dbmMainDB: TDataModule},
  Owner in 'Owner.pas',
  building in 'building.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmOwnerView, frmOwnerView);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmMakePayment, frmMakePayment);
  Application.CreateForm(TdbmMainDB, dbmMainDB);
  //Application.CreateForm(TmainDB, main_DB);
  Application.CreateForm(TfrmEmployeeView, frmEmployeeView);
  Application.CreateForm(TfrmOwnerView, frmOwnerView);
  Application.Run;
end.
