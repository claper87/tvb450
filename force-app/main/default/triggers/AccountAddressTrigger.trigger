trigger AccountAddressTrigger on Account (before insert, before update) {
    
    AccountAddressTriggerHandler.addressChanger(Trigger.New, Trigger.oldMap);

}