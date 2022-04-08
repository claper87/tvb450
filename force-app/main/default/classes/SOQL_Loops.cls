public class SOQL_Loops {
    
    public static void createTestData(){
        List<Case> testCases = new List<Case>();
        for(Integer i = 0; i < 500; i++){
        	testCases.add(new Case(Subject='Test Case '+i));  
            
        }
        database.insert( testCases,false);
        
    }
    
    public static void cleanTestData(){
        List<Case> testCases = [Select Id FROM Case WHERE Subject Like 'Test Case%'];
        delete testCases;
    }
    
    public static void doSimpleSOQL_loop(){
        Integer counter = 0;
        for(Case thisCase : [Select Id, Subject FROM Case Where Subject Like 'Test Case%' Limit 500]){
            counter++;
        }  
        System.debug('The Count is '+counter);
    }
    
    //It's very eficient for iterating through large amount of data
    //Retrieves lists of records in batches of 200
    public static void doListSOQL_loop(){
        Integer outerCounter = 0;
        Integer innerCounter = 0;
        for(List<Case> ListOfCases : [Select Id, Subject 
                                      FROM Case 
                                      Where Subject Like 'Test Case%' Limit 450]){
            outerCounter++;
            for(Case thisCase : ListOfCases){
                thisCase.subject += ' my test';
                innerCounter++;
            }
            update ListOfCases;
        }  
        System.debug('The Outer Count is '+outerCounter);
        System.debug('The Inner Count is '+innerCounter);
    }
    

}