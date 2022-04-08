public class AccountAddressTriggerHandler {
    
    public static void addressChanger(List<Account> newVersionOfAccounts, Map<Id,Account> oldVersionOfAccountsMap ){
        for(Account thisAccount : newVersionOfAccounts){
            if(oldVersionOfAccountsMap != null){
                Account oldAccountVersion = oldVersionOfAccountsMap.get(thisAccount.Id);
                if(oldAccountVersion.Match_Billing_Address__c != thisAccount.Match_Billing_Address__c && thisAccount.Match_Billing_Address__c == true){
                    system.debug('the account id is '+thisAccount.Id);
                    thisAccount.ShippingPostalCode = thisAccount.BillingPostalCode;
                }
            }else{
             	if(thisAccount.Match_Billing_Address__c == true){
                    system.debug('the account id is '+thisAccount.Id);
                    thisAccount.ShippingPostalCode = thisAccount.BillingPostalCode;
                }   
            }
        }
    }
    
}