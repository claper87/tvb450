trigger OpportunityTrigger on Opportunity (before insert, before update) {
    
    if(OpportunityTriggerHandler.OppTriggerRun == false){
        OpportunityTriggerHandler.AugmentOpportunityName(Trigger.New, ' - Aug. Before Trigger');
    }
}