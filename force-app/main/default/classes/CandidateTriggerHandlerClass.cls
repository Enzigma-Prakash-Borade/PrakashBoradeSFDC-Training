public class CandidateTriggerHandlerClass {
    //
    //   Task 1 B Start Here
    //
    //
    public static void checkJobStatus(List<APEX_Candidate__c> listCandidate)
    {
        Set<Id> jobId = new Set<Id>();
        
        for(APEX_Candidate__c objcandidate : listCandidate)
        {
            if(objcandidate.Jobs__c!=null)
            {
                jobId.add(objcandidate.Jobs__c);
            }
        }
        Map<Id,Job__c>  deactivateJob = new Map<Id,Job__c>([SELECT Id,Active__c from Job__c where Id In:
                                                           jobid AND Active__c=false]);
        
        for(APEX_Candidate__c objCandidate:listCandidate)
        {
            if(deactivateJob.get(objCandidate.Jobs__c)!=null){
                objCandidate.addError('This job is not active. You can not apply for this job');
            }   
        }
    }
    
    //   Task 1 B Ends Here
    
    
    
    //  task 2  start here
    public static void addDate(List<APEX_Candidate__c> newCandidate)
    {
        List<APEX_Candidate__c> listOfCandidate = new List<APEX_Candidate__c>();
        
        
        for(APEX_Candidate__c obj : newCandidate)
        {
            APEX_Candidate__c newObj = new APEX_Candidate__c();
            
            
            newObj.Id =  obj.Id;
            newObj.Application_Date__c=  obj.CreatedDate.date();
            listOfCandidate.add(newObj);
            
            
            
        }
        Update listOfCandidate;
        //System.debug('List of Candidate after update ' +listOfCandidate );
        //System.debug('New object ' +newObj );
            //System.debug('New object after add ' +newObj );
           //System.debug('List of Candidate ' +listOfCandidate );
            //System.debug('Get hello from get date function' + obj.CreatedDate.date());
        
        
        
    }
    //  task 2 ends here

}