page 50300 TemporaryDimensionsPage
{
    ApplicationArea = All;
    Caption = 'TemporaryDimensionsPage';
    PageType = Card;
    SourceTable = TemporaryDimensionsTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(GlobalDimension1Code; Rec.GlobalDimension1Code)
                {
                    ToolTip = 'Specifies the value of the GlobalDimension1Code field.';
                }
                field(GlobalDimension2Code; Rec.GlobalDimension2Code)
                {
                    ToolTip = 'Specifies the value of the GlobalDimension2Code field.';
                }
                field(DimensionSetId; Rec.DimensionSetId)
                {
                    ToolTip = 'Specifies the value of the DimensionSetId field.';
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
