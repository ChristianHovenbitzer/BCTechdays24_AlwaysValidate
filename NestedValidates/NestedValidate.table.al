table 50500 NestedValidate
{
    fields
    {
        field(1; PK; Integer) { }
        field(2; UnitPrice; Decimal)
        {
            trigger OnValidate()
            begin
                Validate(UnitPriceIncludingVat, UnitPrice);
                Validate(LineAmount, UnitPrice * (1 - Discount / 100));
            end;
        }
        field(3; UnitPriceIncludingVat; Decimal) { }
        field(4; LineAmount; Decimal) { }
        field(5; Discount; Decimal)
        {
            trigger OnValidate()
            begin
                Validate(LineAmount, UnitPrice * (1 - Discount / 100));
            end;
        }
    }

    /// <summary>
    /// Validates all amount related fields in the correct order.
    /// </summary>
    procedure UpdateAmounts(NewAmount: Decimal; NewDiscount: Decimal)
    begin
        Validate(UnitPrice, NewAmount);
        Validate(UnitPriceIncludingVat, NewAmount);
        Validate(LineAmount, NewAmount);
        Validate(Discount, NewDiscount);
    end;
}