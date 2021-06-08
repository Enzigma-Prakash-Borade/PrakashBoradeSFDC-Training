public class getAllCandidates {
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [
                     SELECT First_Name__c, Last_Name__c,Age__c,Email__c,
                     Date_of_Birth__c,Jobs__c,
                     APEX_Country__c FROM APEX_Candidate__c
                     
                    ]
                ));
            }
            return setCon;
        }
        set;
    }
    // Initialize setCon and return a list of records
    public List<APEX_Candidate__c> getOpportunities() {
        return (List<APEX_Candidate__c>) setCon.getRecords();
    }


}