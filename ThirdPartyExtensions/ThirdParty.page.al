page 50400 TemporaryDimensionsPage
{
    ApplicationArea = All;
    Caption = 'TemporaryDimensionsPage';
    PageType = Card;
    SourceTable = ThirdParty;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}
