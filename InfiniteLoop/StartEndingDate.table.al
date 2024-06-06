table 50200 StartEndingDate
{
    fields
    {
        field(1; PK; Integer) { }
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

    local procedure ValidateStartEndDate(StartDateToValidate: Date; EndDateToValidate: Date)
    begin
        if EndDateToValidate < StartDateToValidate then
            Error('Start date must be prior to the end date.');
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