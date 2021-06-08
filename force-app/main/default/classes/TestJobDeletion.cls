@isTest
private class TestJobDeletion {
        
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        
        Contact contact = new Contact(LastName ='Sharma');
       	insert contact;
        
       
		Job__c newJob = new Job__c(Job_Types__c='Manager',Active__c=true,Number_of_Positions__c =10,Manager__c = contact.Id);        
        insert newJob;
        
        
        
        APEX_Candidate__c newCandi = new APEX_Candidate__c(First_Name__c='radhe',Last_Name__c='bhaiya',Expected_Salary__c=1000,Email__c= 'Radhe@gmail.com',Status__c='Reject',Jobs__c=newJob.id);
        
        insert newCandi;
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(newJob, false);
        
        System.debug('This Result'+ result);
        Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete Job with related Candidate.',
                             result.getErrors()[0].getMessage());
    }
    
}