/**
 * Created by rr245546 on 6/8/2017.
 */

/**
 * must be global class
 * anything that needs to be returned must be in webservice - otherwise it wont show up in WSDL.
 *
 * we can have different method - those would be different operations.
 * User Enterprise WSDL to for getting session token
 *
 * Setup -> API -> Enterprise WSDL
 * Setup -> Apex -> MySOAPService -> WSDL
 */

global without sharing class MySOAPService {

    global class MyAccount {
        webservice String accountName;
        webservice String accountId;
    }

    webService static List<MyAccount> getMyAccounts(String input) {
        System.debug(' getMyAccounts input ' + input );
        List<Account> accounts = [select id, name from account limit 5];
        List<MyAccount> myAccounts = new List<MyAccount>();
        for(Account a: accounts) {
            MyAccount myAccount = new MyAccount();
            myAccount.accountId = a.id;
            myAccount.accountName = a.name;
            myAccounts.add( myAccount );
        }
        return myAccounts;
    }

}