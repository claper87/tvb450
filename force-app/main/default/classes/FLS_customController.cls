public class FLS_customController {

    public Account accountInContext {get; set;}
    
    public FLS_customController(){
        accountInContext = [Select Id, Industry, Name, Is_Top_Contributor__c, Case_Sensitive__c from Account where Name = 'Burlington Textiles Corp of America' limit 1]; 
    }
    public FLS_customController(string accountName){
        accountInContext = [Select Id, Industry, Name, Is_Top_Contributor__c, Case_Sensitive__c from Account where Name = :accountName limit 1]; 
    }
    
    public PageReference save(){
        update accountInContext;
        return null;
    }
}