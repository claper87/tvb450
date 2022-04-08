public class DemoClass {
    
    public string accountName = 'Alpha Dynamics'; 

    public static void myQuery(){
		String thequery = 'Select Id, Name, Website FROM Account';
        Database.query(thequery);
    }
    
    public void myQuery2(){
		String thequery = 'Select Id, Name, Website FROM Account Where name = :accountName';
        Database.query(thequery);
    }
    
}