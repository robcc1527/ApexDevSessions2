public class Profile{
    public static void updateProfile(List<ID> oppIDs){
        for(ID oppID : oppIDs){
            Opportunity opp = [SELECT ID, amount FROM Opportunity WHERE ID =: oppID];
            if(opp.Amount < 10000){
                opp.Profile__c = 'low';
            }else if (opp.Amount > 50000){
                opp.Profile__c = 'High';
            }else{
                opp.Profile__c = 'Medium';
            }
            update opp;
        }
    }
}