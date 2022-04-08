trigger EventRCE on EventRelationChangeEvent (after insert) {
    
    for(EventRelationChangeEvent rce : trigger.new){
        system.debug('trigger size '+trigger.new.size());
        
    }

}