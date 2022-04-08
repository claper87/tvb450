public class AccountCount {
    
    public static Integer countAccounts(){
        try{
        	return [Select count() FROM Account];
        }catch(exception e){
            system.debug('system error');
            integer one = 1;
        }
        return null;
    }

}