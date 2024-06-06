table 50201 Amounts
{
    fields
    {

        field(1; PK; Integer) { }
        field(2; Amount; Decimal)
        {
            trigger OnValidate()
            begin
                if AmountInclVat <> (Amount * 1.07) then
                    Validate(AmountInclVat, Amount * 1.07);
            end;
        }
        field(3; AmountInclVat; Decimal)
        {
            trigger OnValidate()
            begin
                if Amount <> (AmountInclVat / 1.07) then
                    Validate(Amount, AmountInclVat / 1.07);
            end;
        }

    }
}