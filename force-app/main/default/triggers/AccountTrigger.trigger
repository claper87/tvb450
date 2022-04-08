trigger AccountTrigger on Account (after insert, after update ) {
    
    
    if(Trigger.isInsert){
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Account thisAccount : trigger.new){
            opportunities.add( new Opportunity(Name='Default Opportunity',Amount=1000,CloseDate=System.Today(),StageName='Prospecting',AccountID=thisAccount.Id))   ;
        }
        RecursionControl.stopRecursion = true;
        insert opportunities;
    }else if(Trigger.isUpdate && RecursionControl.stopRecursion == false){
        system.debug('In the after Update Context');
    }

}