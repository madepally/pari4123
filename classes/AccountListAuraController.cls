public class AccountListAuraController {
	@AuraEnabled
	// this is my comment
    public static List<Account> getAccounts(){
      return [SELECT ID, Name, Description FROM Account ORDER By Name];
    }
	
}
