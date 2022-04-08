public class CustomListCntrl {
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, CloseDate, Account.Industry FROM Opportunity Where Account.Industry LIKE 'E%']));
            }
            return setCon;
        }
        set;
    }
    
    public string greeting {get; set;}
 
    // Initialize setCon and return a list of records
    public List<Opportunity> getOpportunities() {
        greeting = 'Hello world';
        return (List<Opportunity>) setCon.getRecords();
    }

}