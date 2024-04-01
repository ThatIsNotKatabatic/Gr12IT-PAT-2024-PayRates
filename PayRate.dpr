program PayRate;

uses
  Forms,
  Login in 'Login.pas' {frmLogin},
  Signup in 'Signup.pas' {frmSignUp},
  Main_DB in 'Main_DB.pas' {mainDB: TDataModule},
  EmployeeView in 'EmployeeView.pas' {frmEmployeeView},
  Globals in 'Globals.pas',
  OwnerView in 'OwnerView.pas' {frmOwnerView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  //Application.CreateForm(TmainDB, main_DB);
  Application.CreateForm(TfrmEmployeeView, frmEmployeeView);
  Application.CreateForm(TfrmOwnerView, frmOwnerView);
  Application.Run;
end.
