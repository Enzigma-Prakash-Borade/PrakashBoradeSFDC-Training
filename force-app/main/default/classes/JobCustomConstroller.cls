public class JobCustomConstroller {

    public Job__c jobobj {get;set;}
    
    public JobCustomConstroller()
    {
        jobobj = new  Job__c();
    }
    
    public void save()
    {
        insert jobobj ;
        jobobj= new Job__c();
        
    }
    
    

}