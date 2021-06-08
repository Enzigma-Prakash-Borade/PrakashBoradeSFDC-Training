@isTest
private class CandidateTriggerTestClass {
    
    @testSetup
    public static void createRecord()
    {
        Contact contact = new Contact(LastName ='Sharma');
       	insert contact;
        
        List<Job__c> jobList = new List<Job__c>();
        jobList.add(new Job__c(Job_Types__c='Manager',Active__c=false,Number_of_Positions__c =10,Manager__c = contact.id));
        jobList.add(new Job__c(Job_Types__c='Manager',Active__c=false,Number_of_Positions__c =10,Manager__c = contact.id));
        
        Database.insert(jobList);
        
        List<APEX_Candidate__c> candidateList = new List<APEX_Candidate__c>();
        candidateList.add(new APEX_Candidate__c(Application_Date__c=Date.today().addDays(8),First_Name__c='radhe',Last_Name__c='bhaiya',Expected_Salary__c=1000,Email__c= 'Radhe@gmail.com',Status__c='Reject',Jobs__c=jobList[0].id));
                                                              
    }
    
   
    
   @isTest
    public static void dateCheck()
    {
        List<APEX_Candidate__c> lstCandidate =[SELECT Application_Date__c FROM APEX_Candidate__c];
            for(APEX_Candidate__c objCandidate : lstCandidate)
        	{
            	System.assertEquals(Date.today(), objCandidate.Application_Date__c);
               
                
			}
        
    } 
    
     @isTest
    public static void checkStatus()
    {
         List<Job__c> listOfJob =[SELECT Active__c,Id FROM Job__c];
        
        for(Job__c jobList: listOfJob)
        {
           
            Database.deleteResult result = Database.delete(jobList.Id);
            System.assertEquals(false,!result.isSuccess());
        }
    }
    
    @isTest 
    public static void salaryValidation() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        List<Job__c> jobList = [SELECT Id from  Job__c];
        
         List<APEX_Candidate__c> candidateList = new List<APEX_Candidate__c>();
        
		 candidateList.add(new APEX_Candidate__c(First_Name__c='radhe',Last_Name__c='bhaiya',Expected_Salary__c=1000,Email__c= 'Radhe@gmail.com',Status__c='Reject',Jobs__c=jobList[0].Id));  
        candidateList.add(new APEX_Candidate__c(First_Name__c='radhe',Last_Name__c='bhaiya',Expected_Salary__c=null,Email__c= 'Radhe@gmail.com',Status__c='Reject',Jobs__c=jobList[0].Id));  
      
      	 Database.SaveResult[] result = Database.insert(candidateList,false);
        System.assertEquals(false,result[1].isSuccess());
        
      
    }
    /*
      
       @isTest
    public static void checkStatus()
    {
         List<Job__c> listOfJob =[SELECT Active__c FROM Job__c];
        
        for(Job__c jobList: listOfJob)
        {
           
            System.assertEquals(false,jobList.Active__c);
        }
    }
      
      
     @isTest 
    public static void deleteJobCheck() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        List<Job__c> jobList = [SELECT Id from  Job__c];
        
         List<APEX_Candidate__c> candidateList = new List<APEX_Candidate__c>();
        
		 candidateList.add(new APEX_Candidate__c(First_Name__c='radhe',Last_Name__c='bhaiya',Expected_Salary__c=1000,Email__c= 'Radhe@gmail.com',Status__c='Reject',Jobs__c=jobList[0].Id));  
         candidateList.add(new APEX_Candidate__c(First_Name__c='radhe',Last_Name__c='bhaiya',Expected_Salary__c=100,Email__c= 'Radhe@gmail.com',Status__c='Reject',Jobs__c=jobList[0].Id));  
      
      	 Database.DeleteResult[] result = Database.delete(jobList,true);
         System.assertEquals(false,!result[0].isSuccess());
        
        
      
    }
*/
    
}