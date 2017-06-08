/**
 * Created by rr245546 on 6/8/2017.
 */


/**
 * has to be global
 * accessible at : /services/apexrest/MyRestService
 *
 *
 * each annotation binds to method and that method would be called based on which rest call is made by client.
 */

@RestResource(urlMapping='/MyRestService/*')
global with sharing class MyRestService {

    global class MyAccount {
        webService String id;
        webservice String name;
        webservice String type;
    }

    /**
     * /services/apexrest/MyRestService/id
     *
     * here id needs to be extracted from URL
     */
    @HttpGet
    global static List<MyAccount> getMyAccounts() {
        String inputId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.debug(' Rest getMyAccounts inputId ' + inputId );
        List<Account> accounts = [select id, name, type from account limit 5];
        List<MyAccount> myAccounts = new List<MyAccount>();
        for(Account a: accounts) {
            MyAccount myAccount = new MyAccount();
            myAccount.accountId = a.id;
            myAccount.accountName = a.name;
            myAccount.type = a.type;
            myAccounts.add( myAccount );
        }
        return myAccounts;
    }

    /**
     * URL : /services/apexrest/MyRestService
     *
     * POST BODY:
     {
        "name" : "Chintan",
        "status": "Active"
     }
     */

    @HttpPost
    global static MyAccount createMyAccount(String name, String status) {
        MyAccount myAccount = new MyAccount();
        myAccount.accountId = a.id;
        myAccount.accountName = a.name;
        myAccount.type = a.type;

    }
}