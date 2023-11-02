public with sharing class DisplayVolunteerController {

    @AuraEnabled(cacheable=true)
    public static List<volunteer_class_assignment__c> getVolunteers(String recordId) {
        return [
            SELECT name, Volunteer__r.name, Volunteer__r.EMail__c, Volunteer__r.Phone__c 
            FROM volunteer_class_assignment__c 
            WHERE TEALS_Class__c =: recordId
            WITH SECURITY_ENFORCED
        ];
    }
}