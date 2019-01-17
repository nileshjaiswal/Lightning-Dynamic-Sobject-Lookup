/**
* \arg ClassName        : Test_sObjectLookupCtrl
* \arg User Story       : 
* \arg CreatedOn        : 
* \arg LastModifiedOn   : 
* \arg CreatededBy      : Nilesh 
* \arg ModifiedBy       : Nilesh
* \arg Description      : Test class for sObjectLookupCtrl class
*/
@isTest
public class Test_sObjectLookupCtrl {
    static List<Account> lstAccount;
    
    static void createData() {
		lstAccount = new List<Account> {
			new Account(Name = 'Test Account-1'),
			new Account(Name = 'Test Account-2')
		};
		insert lstAccount;
    }
    
    private static testMethod void test_sObjectLookup() {
        createData();
        test.startTest();
        Id [] fixedSearchResults = new Id[]{lstAccount[0].Id}; 
        Test.setFixedSearchResults(fixedSearchResults);
        sObjectLookupCtrl.lookup('', 'Account', '');
        sObjectLookupCtrl.lookup('Account', 'Account', '');
        test.stopTest();
    }
}
/* End */