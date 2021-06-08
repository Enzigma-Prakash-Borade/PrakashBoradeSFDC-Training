@isTest
public class TestMethod1Candidate {
    
    static testMethod void expextedSalaryTest()
    {
        APEX_Candidate__c candidateObj=new APEX_Candidate__c();
        candidateObj.First_Name__c= 'savita';
		candidateObj.Last_Name__c= 'Borse';
		candidateObj.Email__c= 'janvi@gmail.com';
		candidateObj.Status__c= 'Applied';
        candidateObj.Expected_Salary__c=199;
       
        insert candidateObj;
        
        Test.startTest();
        candidateObj.Expected_Salary__c=66;
       
        update candidateObj;
        Test.stopTest();
        
       List <Job__c> jobList = [select Id, Name__c from Job__c where Id =:candidateObj.id];
      // List< Candidate_Shweta_c> canList = [SELECT Id, APEX_ExpectedSalaryc FROM Candidate_Shwetac WHERE APEX_FirstName_c  = :candidateObj.id];
       //List<Candidate_Shweta_c> candidateList = [SELECT Id, Candidate_Shwetac FROM Candidate_Shwetac WHERE  Candidate_Shweta_c= :candidateObj.id];
        system.assertEquals(1, jobList.size());
        
     }

}