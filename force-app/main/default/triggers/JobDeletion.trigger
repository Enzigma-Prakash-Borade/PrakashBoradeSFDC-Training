trigger JobDeletion on Job__c (before delete) {
   
    // Prevent the deletion of accounts if they have related opportunities.
    for (Job__c a : [SELECT Id FROM Job__c
                     WHERE Id IN (SELECT Jobs__c FROM APEX_Candidate__c) AND
                     Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete Job with related Candidate.');
    }
    
}