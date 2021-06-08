trigger TaskT3 on Job__c (before delete,before update , before insert) {
    
    //Task 3 Start here
   ByPassTrigger__c bypassTrigger = ByPassTrigger__c.getInstance( UserInfo.getUserID() );
    boolean flag = bypassTrigger.CheckActivated__c;
    
    System.debug('This is flag value ' +flag );
    // if()
    if(flag)
    {
        if(Trigger.isDelete)
        {
            if(Trigger.isBefore)
            {
                for(Job__c obj : Trigger.Old)
                {
                    if(obj.Active__c==true)
                    {
                        obj.addError('This Job is active and can not be deleted');
                    }
                }
            }
            //Task 3 Start here
 
        }
    }
     
}