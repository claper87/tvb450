trigger jobapplication on Job_Application__c (before delete) {
    
    for(Job_Application__c ja : trigger.new){
        ja.addError('cannot delete this');
    }

}