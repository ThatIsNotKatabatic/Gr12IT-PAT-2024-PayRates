unit Owner;

interface

type
  TOwner = class(TObject)

  private
  var
  indexInDatabase: integer;

  public
    constructor create(index: integer);

  end;

implementation

uses Windows, SysUtils;

{ TOwner }

constructor TOwner.create(index: integer);
begin
  indexInDatabase := index;
end;

end.
