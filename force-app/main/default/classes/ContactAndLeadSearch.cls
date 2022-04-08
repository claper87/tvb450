public without sharing class ContactAndLeadSearch {
    
    protected String name; 
    private string lasname;
    
    public ContactAndLeadSearch(){
     	system.debug('Hello Class');   
    }
    
    public ContactAndLeadSearch(String dayOfWeek){
     	system.debug('Hello Class, today is '+dayOfWeek);   
    }
    
    
    public static list<sObject> searchContactsAndLeads(string Bob){
        list<list<sObject>> contactlist = [FIND :Bob IN NAME FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
        Contact[] searchContacts = (Contact[])contactlist[0];
        Lead[] searchLeads = (Lead[])contactlist[1];
        
        System.debug('Found the following Contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.FirstName + ' ' + c.LastName);
        }
        System.debug('Found the following Leads.');
        for (Lead l : searchLeads) {
            System.debug(l.LastName + ', ' + l.FirstName);
        } 
        return null;
    }
}