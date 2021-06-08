trigger TaskT1_2 on APEX_Candidate__c (before insert,before update,after insert,after update ) {
    
    
    
    // task 1 A  start here
    if(Trigger.isBefore || Trigger.isUpdate || Trigger.isInsert)
    {
        for(APEX_Candidate__c obj : Trigger.new)
        {
            if(obj.Expected_Salary__c==null)
            {
                obj.addError('Expected Salary field is missing”');
            }
        }
    }
    // task 1 A  ends  here
     
    //  task 1 B  start here
    if(Trigger.isBefore || Trigger.isInsert || Trigger.isUpdate)
    {
        CandidateTriggerHandlerClass.checkJobStatus(Trigger.new);
        //CandidateTriggerHandlerClass.addDate(Trigger.new);
    }
    //  task 1 B  ends  here
      
    //   task  2  start here
    
    if(Trigger.isInsert&&  Trigger.isAfter )
    {
        
        CandidateTriggerHandlerClass.addDate(Trigger.new);
    }
    

}