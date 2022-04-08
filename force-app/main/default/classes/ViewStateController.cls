public with sharing class ViewStateController {

    public transient List<case> cases;
    
    public list<opportunity> getOpportunities(){
        cases = [ select id from case];
        return [select id, name from opportunity];
    }
}