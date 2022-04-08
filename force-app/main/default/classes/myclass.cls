public class myclass{
    public static void mymethod(list<opportunity> opps){
        map<id,account> newAccountMap = new map<id,account>();
        for(opportunity thisOpp : opps){
            newAccountMap.put(thisOpp.AccountId,thisOpp.Account);
        }
        system.debug('the map '+newAccountMap);
    }
}