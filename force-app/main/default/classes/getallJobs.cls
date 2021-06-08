public class getallJobs {
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [
                     SELECT Name__c, Salary_Offered__c,Active__c,Expires_On__c,
                     Number_of_Positions__c,Total_Applicants__c,
                     Job_Types__c,Manager__c FROM Job__c where id='a065g000009HE38'
                     
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

}