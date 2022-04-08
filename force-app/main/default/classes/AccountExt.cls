public class AccountExt {
    public Account acct {get; set;}
    
    public AccountExt(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }
    
    public PageReference save(){
        update acct;
        return new PageReference('/apex/DemoPage');
    }
 

}