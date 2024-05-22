codeunit 50200 InfiniteLoopTests
{
    Subtype = Test;

    [Test]
    procedure TestStartDateAfterEndDate()
    var
        Table: Record StartEndingDate;
    begin
        //[GIVEN]
        SetDefaultDates(Table);

        //[WHEN]
        asserterror Table.Validate(StartDate, 20240202D); // 2024/02/02

        //[THEN]     
        if GetLastErrorText() <> 'Start date must be prior to the end date.' then
            Error('Wrong error');
    end;

    [Test]
    procedure TestValidateStartDateThenEndDate()
    var
        Table: Record StartEndingDate;
    begin
        //[GIVEN]
        SetDefaultDates(Table);

        //[WHEN]
        // The order of validation is important in this case
        // the default end date is the 2024/02/01. Moving the start date behind the end date results in an error
        Table.Validate(EndDate, FirstMarch); // 2024/03/01
        Table.Validate(StartDate, SecondFebuary); // 2024/02/02

        //[THEN] then     
        if GetLastErrorText() <> 'Start date must be prior to the end date.' then
            Error('Wrong error');
    end;

    [Test]
    procedure TestValidateStartDateThenEndDate2()
    var
        Table: Record StartEndingDate;
    begin
        //[GIVEN]
        SetDefaultDates(Table);

        //[WHEN]
        Table.SetStartEndDate(SecondFebuary, FirstMarch);

        //[THEN] then no error thrown  
    end;

    var
        FirstJanuary, FirstFebruary, SecondFebuary, FirstMarch : Date;
    local procedure SetDefaultDates(var Table: Record StartEndingDate)
    begin
        FirstJanuary := 20240101D;
        FirstFebruary := 20240201D;
        SecondFebuary := 20240202D;
        FirstMarch := 20240301D;

        Table.StartDate := FirstJanuary;
        Table.EndDate := FirstFebruary;
    end;
}