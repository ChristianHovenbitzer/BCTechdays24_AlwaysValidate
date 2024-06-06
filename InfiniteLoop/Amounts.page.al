
page 50201 Amounts
{
    PageType = Card;
    SourceTable = Amounts;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Amount; Rec.Amount) { }
                field(AmountInclVat; Rec.AmountInclVat) { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}