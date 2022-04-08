@isTest
public class Async_QueuableTest {
    
    @isTest
    private static void Test_future(){
        test.startTest();
        	System.enqueueJob(new Async_Queueable());
        test.stopTest();
    }

}