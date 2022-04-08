public class AccountHandler2 {
    public static Account insertNewAccount(String companyName){
        Account acct = new Account();
        try {
            insert acct;
            System.debug('Account created');
            return acct;
        }
        catch (Exception e) {
            System.debug('Account not created');
            return null;
        }
    }
}