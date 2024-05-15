codeunit 50400 ThirdPartyEventSub
{
    [EventSubscriber(ObjectType::Table, Database::ThirdParty, OnAfterValidateEvent, Discount, false, false)]
    local procedure SendNotification(var Rec: Record ThirdParty)
    var
        Notify: Notification;
    begin
        // Even the same app could have event subscribers on fields you might miss
        Notify.Message('The discount exceeds 50%, are you sure?');
        if Rec.Discount > 50 then
            Notify.Send();
    end;
}