
page 50200 StartEndingDate
{
    PageType = Card;
    SourceTable = StartEndingDate;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(StartDate; Rec.StartDate) { }
                field(EndDate; Rec.EndDate) { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}