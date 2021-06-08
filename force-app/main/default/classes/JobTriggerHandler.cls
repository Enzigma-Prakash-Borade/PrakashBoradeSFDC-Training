public class JobTriggerHandler {
    public static void sendMail(List<Job__c> Job_lst) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        for(Job__c job_obj:Job_lst) {
            if(job_obj.Number_of_Positions__c==job_obj.Hired_Applicants__c) {
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

}