public without sharing class GetAllAccounts {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [Select Id , Name , Rating ,Type , Description ,AnnualRevenue ,NumberofEmployees from Account];
    }
    
}