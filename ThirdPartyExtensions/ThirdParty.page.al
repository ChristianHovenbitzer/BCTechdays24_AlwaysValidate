page 50400 ThirdParty
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = ThirdParty;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Amount; Rec.Amount) { }
                field(AmountIncludingVat; Rec.AmountIncludingVat) { }
                field(DiscountedAmount; Rec.DiscountedAmount) { }
                field(Discount; Rec.Discount) { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}
