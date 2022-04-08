@IsTest
public class DemoTestClass {
    
    @isTest
    static void myTestMethod(){
        insert new Contact(firstname='Mohit', lastname='Gupta');
        system.debug('DML consumed '+Limits.getDmlStatements());
        
        Test.startTest();
        	system.debug('DML consumed '+Limits.getDmlStatements());
        Test.stopTest();
        
        system.debug('DML consumed After '+Limits.getDmlStatements());
    }
}