@isTest
private class AccountCount_Test {
    
    @TestSetup
    private static void createData(){
        List<Account> accounts = new List<Account>();
        for(integer i = 0; i<31; i++){
            accounts.add(new account(name='Test Account '+i));
        }
        insert accounts;
    }
    
    @isTest static void countAccounts(){
        Integer accountCount = AccountCount.countAccounts();
        System.assertEquals(31, accountCount);
    }
    
    @isTest static void countAccounts_negative(){
        delete [select id from account];
        Integer accountCount = AccountCount.countAccounts();
        System.assertEquals(0, accountCount);
    }
}