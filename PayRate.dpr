program PayRate;

uses
  Forms,
  Login in 'Login.pas' {Form1},
  Signup in 'Signup.pas' {Form2},
  Main_DB in 'Main_DB.pas' {DataModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
