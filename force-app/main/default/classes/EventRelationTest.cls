@isTest
public class EventRelationTest {
    
    
    @isTest static void EventRelationChangeTest(){
        
        account acct = new account(name='test account');
        insert acct;
        contact c1 =  new contact(lastname='test lastname',accountid=acct.id);
        insert c1;
        contact c2 =  new contact(lastname='test lastname',accountid=acct.id);
        insert c2;
        Event newEvent =  new Event(subject='Test Client Meeting',ActivityDate=system.today(), DurationInMinutes =60,ActivityDateTime=system.now());
        insert newEvent;
        
        EventRelation eventRel = new EventRelation(
            RelationId = c1.Id,
            EventId = newEvent.Id,
            IsParent = true,
            isInvitee = true
        );
        
        insert eventRel;
        Test.startTest();
        eventRel.status ='Accepted';
        update eventREl;
         Test.getEventBus().deliver();      
        
        
       // Database.SaveResult sr = EventBus.publish(newERC);
        
        Test.stopTest();
        
       // System.assertEquals(true, sr.isSuccess());
    }
    
}