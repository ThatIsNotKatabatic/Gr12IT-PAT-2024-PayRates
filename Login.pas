unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI, Globals;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  objGlobals : TGlobals;

implementation

{$R *.dfm}



procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  objGlobals := TGlobals.create
end;

end.
