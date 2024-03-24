table 50100 ValidateOrderTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                EventSubs: Codeunit EventSubs;
            begin
                EventSubs.GetList().Add('ValidateOrderTable - OnValidate');
            end;
        }
        field(2; MyField2; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; MyField2)
        {
            Clustered = true;
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
        modify(MyField)
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
