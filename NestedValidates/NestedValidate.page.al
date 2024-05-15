page 50500 NestedValidate
{
    ApplicationArea = All;
    Caption = 'NestedValidate';
    PageType = Card;
    SourceTable = NestedValidate;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(AmountIncludingVat; Rec.AmountIncludingVat)
                {
                    ToolTip = 'Specifies the value of the Amount incl. Vat field.';
                }
                field(DiscountedAmount; Rec.DiscountedAmount)
                {
                    ToolTip = 'Specifies the value of the Discounted Amount field.';
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}
