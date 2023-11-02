public with sharing class DisplayClassController {
    @AuraEnabled(cacheable=true)
    public static List<TEALS_Class__c> getClasses(String recordId) {
        return [
            SELECT name, course__c, Curriculum__c, Support_Level__C, Remote__C, High_School__C 
            FROM TEALS_Class__c 
            WHERE High_School__C =: recordId
            WITH SECURITY_ENFORCED
        ];
    }
    @AuraEnabled(cacheable=true)
    public static High_School__c getSchoolname(String recordId) {
        return [
            SELECT name
            FROM High_School__c 
            WHERE Id =: recordId
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }
}