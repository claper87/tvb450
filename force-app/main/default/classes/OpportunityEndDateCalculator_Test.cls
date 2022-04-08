@isTest
private class OpportunityEndDateCalculator_Test {
    
    @testSetup
    private static void createData(){
        Account testAccount= new Account(name='Test Account',BillingCity='Wilmington');
		insert testAccount;
        Opportunity testOpp = new Opportunity(name='Test Opportunity', 
                                              AccountId=testAccount.Id,
                                              StageName='Prospecting',
                                              closeDate=System.today());
        insert testOpp;
    }
    
    private static Opportunity getTestOpportunity(){
        return [Select ID, Shoot_Date_2__c, First_Hold_2__c, 
                Shoot_Hold_2__c, Shoot_Date__c, First_Hold_1__c, 
                Shoot_Hold_1__c, Shoot_Days__c 
                FROM Opportunity
                WHERE StageName='Prospecting' and closeDate=:System.today()
                Limit 1];
    }
    
    @isTest
    private static void setStartDate(){
        Opportunity testOpportunity= getTestOpportunity();
        Test.startTest();
        	testOpportunity.Shoot_Date__c = System.today();
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(testOpportunity.Shoot_Date__c,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDate_ofDays1(){
        Opportunity testOpportunity= getTestOpportunity();
        Test.startTest();
        	testOpportunity.Shoot_Date__c = System.today();
        	testOpportunity.Shoot_Days__c = 1;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(updatedOpportunity.Shoot_Date__c,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDate_ofDays0(){
        Opportunity testOpportunity= getTestOpportunity();
        Test.startTest();
        	testOpportunity.Shoot_Date__c = System.today();
        	testOpportunity.Shoot_Days__c = 0;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(updatedOpportunity.Shoot_Date__c,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDate_ofDaysNull(){
        Opportunity testOpportunity= getTestOpportunity();
        Test.startTest();
        	testOpportunity.Shoot_Date__c = System.today();
        	testOpportunity.Shoot_Days__c = null;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(updatedOpportunity.Shoot_Date__c,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void StartDateNull(){
        Opportunity testOpportunity= getTestOpportunity();
        Test.startTest();
        	testOpportunity.Shoot_Date__c = null;
        	testOpportunity.Shoot_Days__c = 1;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(null,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateWed_ofDays3(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 03, 04);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 03, 02);
        	testOpportunity.Shoot_Days__c = 3;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateWed_ofDays4(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 03, 07);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 03, 02);
        	testOpportunity.Shoot_Days__c = 4;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateWed_ofDays10(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 03, 15);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 03, 02);
        	testOpportunity.Shoot_Days__c = 10;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateTue_ofDays10(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 03, 14);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 03, 01);
        	testOpportunity.Shoot_Days__c = 10;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays11(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 17);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 03);
        	testOpportunity.Shoot_Days__c = 11;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays10(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 16);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 03);
        	testOpportunity.Shoot_Days__c = 10;
        	OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays8(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 14);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 03);
        	testOpportunity.Shoot_Days__c = 8;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays9(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 15);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 03);
        	testOpportunity.Shoot_Days__c = 9;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays7(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 11);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 03);
        	testOpportunity.Shoot_Days__c = 7;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays6(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 10);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 03);
        	testOpportunity.Shoot_Days__c = 6;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays1(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 04);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 04);
        	testOpportunity.Shoot_Days__c = 1;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays2(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 07);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 04);
        	testOpportunity.Shoot_Days__c = 2;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays6(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 11);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 04);
        	testOpportunity.Shoot_Days__c = 6;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays7(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 14);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 04);
        	testOpportunity.Shoot_Days__c = 7;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays8(){
        Opportunity testOpportunity= getTestOpportunity();
        Date ExpectedDate = Date.newInstance(2022, 02, 15);
        Test.startTest();
        	testOpportunity.Shoot_Date__c = Date.newInstance(2022, 02, 04);
        	testOpportunity.Shoot_Days__c = 8;
            OpportunityEndDateCalculator.setEndDate(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        Opportunity updatedOpportunity = getTestOpportunity();
        System.assertEquals(ExpectedDate,updatedOpportunity.Shoot_Date_2__c);
    }

}