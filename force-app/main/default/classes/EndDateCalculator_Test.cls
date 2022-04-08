@isTest
private class EndDateCalculator_Test {
    
    @testSetup
    private static void createData(){
        insert new Account(name='Test Account',BillingCity='Wilmington');
    }
    
    private static Account getTestAccount(){
        return [Select ID, Start_Date__c, End_Date__c, Of_Days__c 
                FROM Account
                WHERE Name = 'Test Account'
                Limit 1];
    }
    
    @isTest
    private static void setStartDate(){
        Account testAccount = getTestAccount();
        Test.startTest();
        	testAccount.Start_Date__c = System.today();
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(testAccount.Start_Date__c,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDate_ofDays1(){
        Account testAccount = getTestAccount();
        Test.startTest();
        	testAccount.Start_Date__c = System.today();
        	testAccount.of_Days__c = 1;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(updatedAccount.Start_Date__c,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDate_ofDays0(){
        Account testAccount = getTestAccount();
        Test.startTest();
        	testAccount.Start_Date__c = System.today();
        	testAccount.of_Days__c = 0;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(updatedAccount.Start_Date__c,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDate_ofDaysNull(){
        Account testAccount = getTestAccount();
        Test.startTest();
        	testAccount.Start_Date__c = System.today();
        	testAccount.of_Days__c = null;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(updatedAccount.Start_Date__c,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void StartDateNull(){
        Account testAccount = getTestAccount();
        Test.startTest();
        	testAccount.Start_Date__c = null;
        	testAccount.of_Days__c = 1;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(null,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateWed_ofDays3(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 03, 04);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 03, 02);
        	testAccount.of_Days__c = 3;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateWed_ofDays4(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 03, 07);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 03, 02);
        	testAccount.of_Days__c = 4;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateWed_ofDays10(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 03, 15);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 03, 02);
        	testAccount.of_Days__c = 10;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateTue_ofDays10(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 03, 14);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 03, 01);
        	testAccount.of_Days__c = 10;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays11(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 17);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 03);
        	testAccount.of_Days__c = 11;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays10(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 16);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 03);
        	testAccount.of_Days__c = 10;
        	EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays8(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 14);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 03);
        	testAccount.of_Days__c = 8;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays9(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 15);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 03);
        	testAccount.of_Days__c = 9;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays7(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 11);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 03);
        	testAccount.of_Days__c = 7;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateThurs_ofDays6(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 10);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 03);
        	testAccount.of_Days__c = 6;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays1(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 04);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 04);
        	testAccount.of_Days__c = 1;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays2(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 07);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 04);
        	testAccount.of_Days__c = 2;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays6(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 11);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 04);
        	testAccount.of_Days__c = 6;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays7(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 14);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 04);
        	testAccount.of_Days__c = 7;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }
    
    @isTest
    private static void setStartDateFri_ofDays8(){
        Account testAccount = getTestAccount();
        Date ExpectedDate = Date.newInstance(2022, 02, 15);
        Test.startTest();
        	testAccount.Start_Date__c = Date.newInstance(2022, 02, 04);
        	testAccount.of_Days__c = 8;
            EndDateCalculator.setEndDate(new List<Account>{testAccount});
        Test.stopTest();
        Account updatedAccount = getTestAccount();
        System.assertEquals(ExpectedDate,updatedAccount.End_Date__c);
    }

}