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
    procedure ValidateQty1000000()
    var
        SalesLine: Record "Sales Line";
        i: Integer;
    begin
        SalesLine."Document No." := 'ValidateSalesLineQty';
        SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
        for i := 0 to 1000000 do
            SalesLine.Validate(Quantity, 100);
    end;

}