codeunit 50300 ValidateSalesLineQty
{
    Subtype = Test;

    [Test]
    procedure ValidateQty1()
    var
        SalesLine: Record "Sales Line";
        i: Integer;
    begin
        SalesLine."Document No." := 'ValidateSalesLineQty';
        SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
        for i := 0 to 1 do
            SalesLine.Validate(Quantity, 100);
    end;

    [Test]
    procedure ValidateQty1000()
    var
        SalesLine: Record "Sales Line";
        i: Integer;
    begin
        SalesLine."Document No." := 'ValidateSalesLineQty';
        SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
        for i := 0 to 1000 do
            SalesLine.Validate(Quantity, 100);
    end;

    [Test]
    procedure ValidateQty100000()
    var
        SalesLine: Record "Sales Line";
        i: Integer;
    begin
        SalesLine."Document No." := 'ValidateSalesLineQty';
        SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
        for i := 0 to 100000 do
            SalesLine.Validate(Quantity, 100);
    end;

    [Test]
    procedure EmptyValidateQty1()
    var
        EmptyTable: Record EmptyTable;
        i: Integer;
    begin
        for i := 0 to 1 do
            EmptyTable.Validate(PK, 100);
    end;

    [Test]
    procedure EmptyValidateQty1000()
    var
        EmptyTable: Record EmptyTable;
        i: Integer;
    begin
        for i := 0 to 1000 do
            EmptyTable.Validate(PK, 100);
    end;

    [Test]
    procedure EmptyValidateQty100000()
    var
        EmptyTable: Record EmptyTable;
        i: Integer;
    begin
        for i := 0 to 100000 do
            EmptyTable.Validate(PK, 100);
    end;

}