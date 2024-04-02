program PayRate;

uses
  Forms,
  Login in 'Login.pas' {frmLogin},
  Signup in 'Signup.pas' {frmSignUp},
  Main_DB in 'Main_DB.pas' {mainDB: TDataModule},
  EmployeeView in 'EmployeeView.pas' {frmEmployeeView},
  Globals in 'Globals.pas',
  OwnerView in 'OwnerView.pas' {frmOwnerView},
  MakePayment in 'MakePayment.pas' {frmMakePayment};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmOwnerView, frmOwnerView);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmMakePayment, frmMakePayment);
  //Application.CreateForm(TmainDB, main_DB);
  Application.CreateForm(TfrmEmployeeView, frmEmployeeView);
  Application.CreateForm(TfrmOwnerView, frmOwnerView);
  Application.Run;
end.
