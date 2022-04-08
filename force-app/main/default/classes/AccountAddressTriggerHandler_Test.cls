@isTest
private class AccountAddressTriggerHandler_Test {

    
    @isTest
    private static void addressChanger_onInsert_Test(){
    	Account testAccount = new Account(Name='Test Insert Account',Case_Sensitive__c='CP5432',NumberOfEmployees =25,Match_Billing_Address__c=true,BillingPostalCode='13391');
        insert testAccount;
    }
    
    @isTest
    private static void addressChanger_onUpdate_Test(){
    	Account testAccount = new Account(Name='Test Update Account',Case_Sensitive__c='CP5432',NumberOfEmployees =25,Match_Billing_Address__c=false,BillingPostalCode='13391');
        insert testAccount;
        
        testAccount.Match_Billing_Address__c = true;
		update testAccount;
    }
    
}