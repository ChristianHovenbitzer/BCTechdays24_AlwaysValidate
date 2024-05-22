table 50400 ThirdParty
{
    fields
    {
        field(1; PK; Integer) { }
        field(2; Amount; Decimal) { }
        field(3; AmountIncludingVat; Decimal) { }
        field(4; DiscountedAmount; Decimal) { }
        field(5; Discount; Decimal) { }
    }

    procedure UpdateAmounts(NewAmount: Decimal; NewDiscount: Decimal)
    begin
        // We know what fields should get populated, right? so whats the point in validating?
        PK := 1;
        Amount := NewAmount;
        AmountIncludingVat := NewAmount;
        DiscountedAmount := NewAmount;
        Discount := NewDiscount;
    end;
}