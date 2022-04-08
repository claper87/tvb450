public without sharing class SharingDemo {
    
    @AuraEnabled
    public static List<SharingDemo__c> getRecords(){
        List<SharingDemo__c> resultList = [Select Name, Restricted_Field__c 
                                            FROM SharingDemo__c];
        SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, resultList);
        return securityDecision.getRecords();
    }
    
    
}

 /*List<SharingDemo__c> resultList = [Select Name, Restricted_Field__c 
                                            FROM SharingDemo__c];
        SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, resultList);
        return securityDecision.getRecords();*/



//WITH SECURITY_ENFORCED
 /**/