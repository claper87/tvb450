public class CustomControllerExtension {
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public CustomControllerExtension(FLS_customController cstController) {
        
    }
 
    public String getGreeting() {
        return 'Hello, I salut you my friend';
    }
    
    public PageReference save(){
        //update accountInContext;
        return new PageReference('/apex/HelloWorld');
    }
    

}