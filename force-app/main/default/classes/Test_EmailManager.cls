@isTest
private class Test_EmailManager {
    
	
    @isTest private static void Test_sendMail(){
    	Test.startTest();
        	EmailManager.sendMail('ckent@leagueOfJustice.com','Hi Clark','Welcome to the League of Justice');
    		Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        
        system.assertEquals(1, invocations, 'An email should be sent');
    }
    
    @isTest private static void Test_sayHi(){
        insert new Contact(Lastname='Perez');
        Test.startTest();
        	EmailManager classInstance = new EmailManager();
        	classInstance.sayHello();
        Test.stopTest();
        
        system.assertEquals(1,[Select count() FROM COntact WHERE FirstName = 'Hello']);
    }
    
}