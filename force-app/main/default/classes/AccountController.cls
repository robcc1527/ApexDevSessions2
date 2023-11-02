public class AccountController {

    public static void updateAvgCaseResoltionDays(List<ID> accountIDs){
    Map<Id, Integer> accountTotalCaseMap = new Map<Id, Integer>();
    Map<Id, Integer> accountTotalCaseDaysMap = new Map<Id, Integer>();

    for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate, AccountId 
                        FROM Case
                        WHERE IsClosed = true
                            AND AccountID IN :accountIDs]){

        if(!accountTotalCaseMap.containsKey(caseObj.AccountId)){
            accountTotalCaseMap.put(caseObj.AccountId, 0);
            accountTotalCaseDaysMap.put(caseObj.AccountId, 0);
        }
        Integer totalCases = accountTotalCaseMap.get(caseObj.AccountId);                        
        totalCases++;
        accountTotalCaseMap.put(caseObj.AccountId, totalCases);

        Integer totalDays = accountTotalCaseDaysMap.get(caseObj.AccountId);
        totalDays += caseObj.CreatedDate.Date().daysBetween(caseObj.ClosedDate.date());
        accountTotalCaseDaysMap.put(caseObj.AccountId, totalDays);
    }

    List<Account> accountToUpdate = new List<Account>();
    for(ID AccountID: accountTotalCaseDaysMap.keySet()){
        Decimal resolutionDays = accountTotalCaseDaysMap.get(accountId)/accountTotalCaseMap.get(accoundId);
        accountToUpdate.add(new Account(Id=accountId, Avg_Case_Resolution_Days__c = resolutionDays));
    
        }   
    update accountToUpdate;
    }
}