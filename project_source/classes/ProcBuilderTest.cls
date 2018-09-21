@isTest
private class ProcBuilderTest {

    static testMethod void doTest() {
        Account acc = new Account();
        acc.Name = 'MyTestAcc';
        insert acc;
        // You could add checks for any side effects here if you wanted, but this will test that it doesn't hit an Flow unhandled exception, or other issues, while running.
    }      
}