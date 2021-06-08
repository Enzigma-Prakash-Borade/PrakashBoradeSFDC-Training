public class CandidateCustromClass {
    public APEX_Candidate__c candidateObject {get;set;}
    
    public CandidateCustromClass()
    {
        candidateObject = new  APEX_Candidate__c();
    }
    
    public void save()
    {
        insert candidateObject ;
        candidateObject= new APEX_Candidate__c();
        
    }
}