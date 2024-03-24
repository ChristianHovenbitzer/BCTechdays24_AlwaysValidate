table 50200 StartEndingDate
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; StartDate; Date)
        {
            trigger OnValidate()
            begin
                ValidateStartEndDate(StartDate, EndDate);
            end;
        }
        field(3; EndDate; Date)
        {
            trigger OnValidate()
            begin
                ValidateStartEndDate(StartDate, EndDate);
            end;
        }
    }

    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

    local procedure ValidateStartEndDate(StartDateToValidate: Date; EndDateToValidate: Date)
    var
        EndDatePriorToStartDateErr: Label 'Start date must be prior to the end date.';
    begin
        if EndDateToValidate = 0D then
            exit;

        if EndDateToValidate < StartDateToValidate then
            Error(EndDatePriorToStartDateErr);
    end;

    procedure SetStartEndDate(StartDateFrom: Date; EndDateFrom: Date)
    begin
        // this procedure is global thus we don't know if the new time frame is set into the future or past
        // and therefore we don't know which value to validate first

        // setting both values and validating afterwards alleviates issues in that regard
        StartDate := StartDateFrom;
        EndDate := EndDateFrom;
        Validate(StartDate);
        Validate(EndDate);
    end;
}

page 50200 StartEndingDate
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = StartEndingDate;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(StartDate; Rec.StartDate)
                {
                    ToolTip = 'Specifies the value of the StartDate field.';
                }
                field(EndDate; Rec.EndDate)
                {
                    ToolTip = 'Specifies the value of the EndDate field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}