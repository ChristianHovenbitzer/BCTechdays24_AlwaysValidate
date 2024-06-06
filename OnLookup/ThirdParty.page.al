page 50600 OnLookup
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = OnLookup;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(TextField; Rec.TextField)
                {
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Text += ' - Page - OnLookup';
                    end;
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
