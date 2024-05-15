table 50400 ThirdParty
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Amount; Decimal)
        {
            Caption = 'Amount';
            // trigger OnValidate()
            // begin
            //     Validate(AmountIncludingVat, Amount);
            //     Validate(DiscountedAmount, Amount * (1 - Discount / 100));
            // end;
        }
        field(3; AmountIncludingVat; Decimal)
        {
            Caption = 'Amount incl. Vat';
            // trigger OnValidate()
            // begin
            //     Validate(Amount, AmountIncludingVat);
            // end;
        }
        field(4; DiscountedAmount; Decimal)
        {
            Caption = 'Discounted Amount';
        }
        field(5; Discount; Decimal)
        {
            Caption = 'Discount';
            MaxValue = 100;
            MinValue = 0;

            // trigger OnValidate()
            // begin
            //     Validate(DiscountedAmount, Amount * (1 - Discount / 100));
            // end;
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }

    procedure UpdateAmounts(NewAmount: Decimal; NewDiscount: Decimal)
    begin
        // We know what fields should get populated, right? so whats the point in validating?
        Amount := NewAmount;
        AmountIncludingVat := NewAmount;
        DiscountedAmount := NewAmount;
        Discount := NewDiscount;
    end;

    // procedure UpdateAmounts(NewAmount: Decimal; NewDiscount: Decimal)
    // begin
    //     Validate(Amount,NewAmount);
    //     Validate(AmountIncludingVat,NewAmount);
    //     Validate(DiscountedAmount,NewAmount);
    //     Validate(Discount,NewDiscount);
    // end;
}