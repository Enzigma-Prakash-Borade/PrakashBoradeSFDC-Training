trigger TaskT4_5_6 on Job__c (before insert,before delete , before update) {
    
    
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert))

    {
        JobTriggerHandlerClass.deactivateJob(Trigger.new);
        JobTriggerHandlerClass.updateActiveField(Trigger.new);
    }
    
     //  Task 5 ends here
            if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
                JobTriggerHandlerClass.sendMail(Trigger.new);
            }
            //Task 5 ends here

}