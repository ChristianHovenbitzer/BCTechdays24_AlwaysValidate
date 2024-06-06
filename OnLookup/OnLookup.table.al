table 50600 OnLookup
{
    LookupPageId = OnLookup;

    fields
    {
        field(1; PK; Integer) { }
        field(2; TextField; Text[50])
        {
            trigger OnValidate()
            begin
                Message('Table OnValidate Message with value "%1"', TextField);
            end;

            trigger OnLookup()
            begin
            end;
        }
    }
}