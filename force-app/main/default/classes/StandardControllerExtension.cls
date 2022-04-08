public class StandardControllerExtension {
 
    private final Account acct;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public StandardControllerExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }
 
    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
    
    public PageReference save(){
        update this.acct;
        return null;
    }
}