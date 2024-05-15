codeunit 50500 ValidateSalesLineQty
{
    Subtype = Test;

    [Test]
    procedure ValidateAmount10000() // 17 milliseconds
    var
        NestedValidate: Record NestedValidate;
        i: Integer;
    begin
        for i := 0 to 10000 do
            NestedValidate.Validate(Amount, 100);
        NestedValidate.Validate(AmountIncludingVat, 100);
        NestedValidate.Validate(DiscountedAmount, 100);
        NestedValidate.Validate(Discount, 0);
    end;

    [Test]
    procedure SetAmount10000() // 7 milliseconds
    var
        NestedValidate: Record NestedValidate;
        i: Integer;
    begin
        for i := 0 to 10000 do begin
            NestedValidate.Amount := 100;
            NestedValidate.AmountIncludingVat := 100;
            NestedValidate.DiscountedAmount := 100;
            NestedValidate.Discount := 0;
        end;
    end;
}