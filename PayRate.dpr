program PayRate;

uses
  Forms,
  Login in 'Login.pas' {frmLogin},
  Signup in 'Signup.pas' {frmSignUp},
  Main_DB in 'Main_DB.pas' {DataModule3: TDataModule},
  EmployeeView in 'EmployeeView.pas' {frmEmployeeView},
  Globals in 'Globals.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TfrmEmployeeView, frmEmployeeView);
  Application.Run;
end.
