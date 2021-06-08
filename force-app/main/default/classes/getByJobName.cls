public class getByJobName {
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [
                    
                    

			SELECT Name__c ,(SELECT id,Email__c , Full_Name__c from Candidates__r)
       		 from Job__c where id ='a065g000009HE38'

                    ]
                ));
            }
            return setCon;
        }
        set;
    }
    // Initialize setCon and return a list of records
    public List<Job__c> getOpportunities() {
        return (List<Job__c>) setCon.getRecords();
    }

    
    
    
    
    
    
   /*
    public List<Job__c> jobobj{get;set;}	
    
    
	
    public List<String> fields{get;set;}
    
    public getByJobName()
    {
        String jobName = 'JOB-006';
        records = [SELECT Name__c ,(SELECT Age__c , Full_Name__c from Candidates__r)
        from Job__c where Name__c =:jobName];
        
         fields = new List<String>{'Age__c','Full_Name__c'};
    }
  
    public static List<Job__c> searchByJObName()
    {
        String jobName = 'JOB-005';

		List<Job__c>  jobobj = [SELECT Name__c ,(SELECT Age__c , Full_Name__c from Candidates__r)
        from Job__c where Name__c =:jobName];
        
        return jobobj;
    }

*/

}