unit Signup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI, Math, Globals;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;
  objGlobals : TGlobals;

implementation

{$R *.dfm}

procedure TfrmSignUp.btnValidateClick(Sender: TObject);
var code : string;
begin
code := inttostr(RandomRange(10000, 99999));
  objGlobals.sendEmail('Validation Code for PayRates App',
    'validation code is: ' + code , edtEmailAddress.Text);
end;


procedure TfrmSignUp.FormCreate(Sender: TObject);
begin
  objGlobals := TGlobals.create;
end;

end.
