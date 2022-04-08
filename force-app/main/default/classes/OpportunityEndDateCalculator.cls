public class OpportunityEndDateCalculator {
    static Date monday = Date.newInstance(1900, 1, 1);
    @InvocableMethod
    public static void setEndDate(List<Opportunity> opportunities){
        for(Opportunity thisOpportunity : opportunities){
            thisOpportunity.Shoot_Date_2__c = getEndDate(thisOpportunity.Shoot_Date__c,thisOpportunity.Shoot_Days__c);
            thisOpportunity.First_Hold_2__c = getEndDate(thisOpportunity.First_Hold_1__c,thisOpportunity.Shoot_Days__c);
            thisOpportunity.Shoot_Hold_2__c = getEndDate(thisOpportunity.Shoot_Hold_1__c,thisOpportunity.Shoot_Days__c);
        }
        update opportunities;
    }
    
    public static date getEndDate(Date startDate, Decimal offSet){
        if(offset == 0 || offset == 1 || offset == null) return startDate;
        if(startDate == null) return null;
        Integer countOfWeekendDays = 0;
        
        for(integer i=1; i < offset; i++)  
        {  
            Date dt = startDate + i;  
            DateTime currDate = DateTime.newInstance(dt.year(), dt.month(), dt.day());  
            String dayOfWeek = currDate.format('EEEE');  
            if(dayOfWeek == 'Saturday' || dayOfWeek =='Sunday') countOfWeekendDays++;  
		}  
        
        Date ft = offset <= 7 ? startDate.addDays((integer)offset+countOfWeekendDays-1) : startDate.addDays((integer)offset+countOfWeekendDays-1);
        DateTime finalDate = DateTime.newInstance(ft.year(), ft.month(), ft.day());
        if( Math.mod(countOfWeekendDays, 2) > 0 || (finalDate.format('EEEE') == 'Sunday' && (offset == 2 || countOfWeekendDays==1))) finalDate= finalDate.addDays(1);
        else if(finalDate.format('EEEE') == 'Saturday' || finalDate.format('EEEE') == 'Sunday')  {finalDate= finalDate.addDays(2); }

        return Date.newInstance(finalDate.year(), finalDate.month(), finalDate.day());
    }
}