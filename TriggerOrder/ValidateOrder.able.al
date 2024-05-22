table 50100 ValidateOrderTable
{
    fields
    {
        field(1; PK; Integer)
        {
            trigger OnValidate()
            var
                EventSubs: Codeunit EventSubs;
            begin
                EventSubs.GetList().Add('ValidateOrderTable - OnValidate');
            end;
        }
    }

    trigger OnModify()
    var
        EventSubs: Codeunit EventSubs;
    begin
        EventSubs.GetList().Add('ValidateOrderTable - OnModify');
    end;
}

tableextension 50100 ValidateOrderTableExt extends ValidateOrderTable
{
    fields
    {
        modify(PK)
        {
            trigger OnBeforeValidate()
            begin
                EventSubs.GetList().Add('ValidateOrderTableExt - OnBeforeValidate');
            end;

            trigger OnAfterValidate()
            begin
                EventSubs.GetList().Add('ValidateOrderTableExt - OnAfterValidate');
            end;
        }
    }
    var
        EventSubs: Codeunit EventSubs;
}
