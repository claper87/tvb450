@isTest
private class TestClass_Limits {
    
    @isTest
    private static void Test_Limits(){
        Account firstAccount = new Account(Name = 'Name ' + 11, Case_Sensitive__c = 'TestDemo'+11, BillingCity='Santiago');
        insert firstAccount;
        
        system.debug('consumed dml before startTest '+Limits.getDmlStatements());
        
        Test.startTest();
        Account secondAccount = new Account(Name = 'Name ' + 12, Case_Sensitive__c = 'TestDemo'+12, BillingCity='Santiago');
        insert secondAccount;
        system.debug('consumed dml inside startTest '+Limits.getDmlStatements());
        Test.stopTest();
        
        Account thirdAccount = new Account(Name = 'Name ' + 13, Case_Sensitive__c = 'TestDemo'+13, BillingCity='Santiago');
        insert thirdAccount;
        system.debug('consumed dml after startTest '+Limits.getDmlStatements());
    }

}