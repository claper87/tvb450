public with sharing  class ContactSearchController {
//
    
    @AuraEnabled(Cacheable=true)
    public static List<Contact> searchContact(String name) {
    	String qryString = 'SELECT Id, FirstName, LastName FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%' + name + '%\')';
        List<Contact> queryResult = Database.query(qryString);
        return queryResult;
	}
    
    @AuraEnabled(Cacheable=true)
    public static List<Contact> searchContactSafe(String name) {
        
    	String qryString = 'SELECT Id, FirstName, LastName FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%' + string.escapeSingleQuotes(name) + '%\')';
        List<Contact> queryResult = Database.query(qryString);
        Security.stripInaccessible(AccessType.READABLE, queryResult);
        return queryResult;
	}

}