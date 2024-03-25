unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    lblLogin: TLabel;
    lblEnterLoginName: TLabel;
    lblEnterLoginPassword: TLabel;
    edtLoginName: TEdit;
    edtLoginPassword: TEdit;
    btnLogin: TButton;
    pnlHeading: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
