public class oppfinder {

    public string searchText {get; set;}
    public List<Opportunity> opportunities { get; set; }
    {
      opportunities = new list<Opportunity>();
    }
    public PageReference search() {
        if(searchText != null){
            String safeSearch = '%'+searchText+'%';
            Opportunities = [Select Name FROM Opportunity WHERE Name LIKE :safeSearch];
        }else{
            opportunities = [select name from opportunity];
        }
        return null;
    }

}