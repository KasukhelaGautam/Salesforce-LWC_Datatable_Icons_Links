public with sharing class ContactDetailsController {
    
    /**
     * Name: getContactDetails
     * Description: Fetch the contact and related account details and wrap them in a
     *              wrapper class and return it.
     */
    @AuraEnabled(cacheable = true)
    public static List<ContactDetailsController.ContactDetailsWrapper> getContactDetails(){
        List<Contact> contactDetailsList = new List<Contact>();
        List<ContactDetailsController.ContactDetailsWrapper> contactDetailsWrapperList = new List<ContactDetailsController.ContactDetailsWrapper>();
        contactDetailsList = [SELECT    Id,
                                        Name,
                                        Title,
                                        MobilePhone,
                                        Email,
                                        Account.Name,
                                        Account.AccountNumber,
                                        Account.Rating,
                                        Account.Industry,
                                        Account.Id
                                FROM    Contact 
                                        LIMIT 10];
        for(Contact cObj : contactDetailsList){
            ContactDetailsController.ContactDetailsWrapper cdWrapper = new ContactDetailsController.ContactDetailsWrapper();
            cdWrapper.id = cObj.Id;
            cdWrapper.name = cObj.Name;
            cdWrapper.title = cObj.Title;
            cdWrapper.mobileNumber = cObj.MobilePhone;
            cdWrapper.email = cObj.Email;
            cdWrapper.accountName = cObj.Account.Name;
            cdWrapper.accountNumber = cObj.Account.AccountNumber;
            cdWrapper.accountRating = cObj.Account.Rating;
            cdWrapper.industry = cObj.Account.Industry;
            cdWrapper.accountId = cObj.Account.Id;

            contactDetailsWrapperList.add(cdWrapper);
        }

        return contactDetailsWrapperList;
        
                                            
    }

    public class ContactDetailsWrapper{
        @AuraEnabled public String   id{get;set;}
        @AuraEnabled public String   name{get;set;}
        @AuraEnabled public String   title{get;set;}
        @AuraEnabled public String   mobileNumber{get;set;}
        @AuraEnabled public String   email{get;set;}
        @AuraEnabled public String   accountName{get;set;}
        @AuraEnabled public String   accountNumber{get;set;}
        @AuraEnabled public String   accountRating{get;set;}
        @AuraEnabled public String   industry{get;set;}
        @AuraEnabled public String   accountId{get;set;}
    }
}
