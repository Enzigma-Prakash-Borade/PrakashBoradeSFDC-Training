public class AccountVFController {
    
    public List<sObject> records {get;set;}
    public List<String> fields {get;set;}
    public AccountVFController()
    {
        records = [select Active__c from  Job__c WHERE Name__c='J-0003' ];
        fields= new List<String> {'Active__c'} ;
    }
    

}