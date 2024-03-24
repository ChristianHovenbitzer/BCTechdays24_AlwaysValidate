
page 50100 ValidateOrderPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ValidateOrderTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(MyField; Rec.MyField)
                {
                    ToolTip = 'Specifies the value of the MyField field.';

                    trigger OnValidate()
                    begin
                        EventSubs.GetList().Add('ValidateOrderPage - OnValidate');
                    end;
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
                var
                    Text: Text;
                    TxtBuilder: TextBuilder;
                begin
                    foreach Text in EventSubs.GetList() do
                        TxtBuilder.AppendLine(Text);
                    Message(TxtBuilder.ToText());
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get() then Rec.Insert();
    end;

    var
        EventSubs: Codeunit EventSubs;
}


pageextension 50100 ValidateOrderPageExt extends ValidateOrderPage
{
    layout
    {
        modify(MyField)
        {
            trigger OnBeforeValidate()
            begin
                EventSubs.GetList().Add('ValidateOrderPageExt - OnBeforeValidate');
            end;

            trigger OnAfterValidate()
            begin
                EventSubs.GetList().Add('ValidateOrderPageExt - OnAfterValidate');
            end;
        }
    }
    var
        EventSubs: Codeunit EventSubs;
}

