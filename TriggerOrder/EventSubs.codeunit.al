codeunit 50100 EventSubs
{
    var
        TriggerOrderList: List of [Text];

    procedure GetList(): List of [Text]
    begin
        exit(TriggerOrderList);
    end;

    procedure ResetList()
    begin
        Clear(TriggerOrderList);
    end;

    [EventSubscriber(ObjectType::Table, Database::ValidateOrderTable, OnBeforeValidateEvent, 'PK', false, false)]
    local procedure OnBeforeValidateEvent(var Rec: Record ValidateOrderTable)
    begin
        TriggerOrderList.Add('ValidateOrderTable Subs - OnBeforeValidateEvent');
    end;

    [EventSubscriber(ObjectType::Table, Database::ValidateOrderTable, OnAfterValidateEvent, 'PK', false, false)]
    local procedure OnAfterValidate(var Rec: Record ValidateOrderTable)
    begin
        TriggerOrderList.Add('ValidateOrderTable Subs - OnAfterValidate');
    end;


    [EventSubscriber(ObjectType::Page, Page::ValidateOrderPage, OnBeforeValidateEvent, 'PK', false, false)]
    local procedure OnBeforeValidateEventNamePage(var Rec: Record ValidateOrderTable)
    begin
        TriggerOrderList.Add('ValidateOrderPage Subs - OnBeforeValidateEventName');
    end;

    [EventSubscriber(ObjectType::Page, Page::ValidateOrderPage, OnAfterValidateEvent, 'PK', false, false)]
    local procedure OnAfterValidateNamePage(var Rec: Record ValidateOrderTable)
    begin
        TriggerOrderList.Add('ValidateOrderPage Subs - OnAfterValidateName');
    end;
}