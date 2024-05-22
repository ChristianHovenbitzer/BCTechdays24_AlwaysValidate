codeunit 50500 ValidateSalesLineQty
{
    Subtype = Test;

    [Test]
    procedure ValidateAmount10000() // 17 milliseconds
    var
        NestedValidate: Record NestedValidate;
        i: Integer;
    begin
        for i := 0 to 10000 do begin
            NestedValidate.Validate(UnitPrice, 100);
            NestedValidate.Validate(UnitPriceIncludingVat, 100);
            NestedValidate.Validate(LineAmount, 100);
            NestedValidate.Validate(Discount, 0);
        end;
    end;

    [Test]
    procedure SetAmount10000() // 7 milliseconds
    var
        NestedValidate: Record NestedValidate;
        i: Integer;
    begin
        for i := 0 to 10000 do begin
            NestedValidate.UnitPrice := 100;
            NestedValidate.UnitPriceIncludingVat := 100;
            NestedValidate.LineAmount := 100;
            NestedValidate.Discount := 0;
        end;
    end;
}