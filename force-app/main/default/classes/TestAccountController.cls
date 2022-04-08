@isTest
private class TestAccountController {
    
    /*@TestSetup
    public static void createAccounts() {
        List<Account> accounts = new List<Account>();

        for (Integer i = 1; i <= 10; i++) {
            accounts.add(new Account(Name = 'Name ' + i, Case_Sensitive__c = 'TestDemo'+i, BillingCity='Santiago'));
        }

        insert accounts;
    }*/

    @isTest
    static void getAccountList() {

        Test.startTest();
        List<Account> accts = AccountController.getAccountList();
        Test.stopTest();
        System.assertEquals(accts.size(), 10);
    }

    @isTest
    static void getSingleAccount() {

        Test.startTest();
        Account acc = AccountController.getSingleAccount();
        Test.stopTest();

        System.assertEquals(acc.Name, 'Name 1');
    }
}