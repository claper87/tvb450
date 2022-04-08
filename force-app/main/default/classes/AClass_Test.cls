@isTest
private class AClass_Test {

    @isTest private static void myClassTestUser() {

        Account anAccount = new Account (name = 'Salesforce', case_Sensitive__c = 'Demo1');
        insert anAccount;

        System.debug('ouside the startTest() '+Limits.getDMLStatements());

        Test.startTest(); // Starts a brand new set of limits
        	System.debug('inside the startTest() 1 '+Limits.getDMLStatements());
        	insert new contact(lastname='mycontact2');
        	insert new contact(lastname='mycontact3');
        	System.debug('inside the startTest() 2 '+Limits.getDMLStatements());
        Test.stopTest();  // Ends the set of limits started on line 7
        insert new contact(lastname='mycontact5');
        insert new contact(lastname='mycontact6');

        System.debug('ouside the stopTest() '+Limits.getDMLStatements());

    }

}