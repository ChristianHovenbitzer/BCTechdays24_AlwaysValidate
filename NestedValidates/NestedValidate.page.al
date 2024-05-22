page 50500 NestedValidate
{
    PageType = Card;
    SourceTable = NestedValidate;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Amount; Rec.UnitPrice) { }
                field(AmountIncludingVat; Rec.UnitPriceIncludingVat) { }
                field(DiscountedAmount; Rec.LineAmount) { }
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
