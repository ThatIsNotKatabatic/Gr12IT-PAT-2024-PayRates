unit ServiceClass;

interface

type
 TServiceClass = class(TObject)

 private

 public
   payDate: TDate;
   amountPaid: double;
   serviceType: char;
   constructor create;
 end;

implementation

{ TServiceClass }

constructor TServiceClass.create;
begin
  // it creates I guess
end;

end.
