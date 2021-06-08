public class JobTriggerHandlerClass {
    // Task 4 start here
    public static void deactivateJob(List<Job__c> listJob)
    {
        for(Job__c objjob:listJob)
        {
            if(objjob.Number_of_Positions__c==objjob.Hired_Applicants__c)
            {
                objjob.Active__c=false;
            }
        }
    }
    // Task 4 ends here
    
    
    // Task 6 start here
    public static void updateActiveField(List<Job__c> listJob)
    {
        for(Job__c obj:listJob)
        {
            if(obj.Active__c==false && obj.Number_of_Positions__c >obj.Hired_Applicants__c )
            {
                obj.Active__c=true;
            }
        }
    }
    // Task 6 ends here
    
    
    // Task 5 start here
    
        public static void sendMail(List<Job__c> Job_lst) 
        {
        //List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        List<Messaging.Email> mails = new List<Messaging.Email>();
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        for(Job__c job_obj:Job_lst) {
            if(job_obj.Number_of_Positions__c==job_obj.Hired_Applicants__c)
            {
                sendTo.add(job_obj.Manager__c);
                mail.setToAddresses(sendTo);
                mail.setSubject('Vacancy full');
                String body = 'All required candidate has been hired for this job on' +job_obj.LastModifiedDate ;
                mail.setHtmlBody(body);
                mails.add(mail);
            }
           
        }
        Messaging.sendEmail(mails);
    
    }
    //send email ends here
    

}