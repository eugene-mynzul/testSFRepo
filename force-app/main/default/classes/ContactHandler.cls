public with sharing class ContactHandler {
    
    public void insertNewContact(String firstName, String lastName){
        
        Contact c = new Contact();
        c.FirstName = firstName;
        c.LastName = lastName;
        
        insert c;
        
        //Logging level and custom message
        System.debug(LoggingLevel.INFO, 'Custom message');
        //Custom message only
        System.debug('Custom message');
        System.debug('Custom message ' + 'extra text');
        System.debug('Custom message ' + c.FirstName);
        System.debug('Custom message ' + c.FirstName + ' extra text');
        System.debug(c.FirstName);

        //FirstName and LastName - required fields
        List<Contact> newContacts = new List<Contact>{
            new Contact(FirstName = 'Arnold', LastName = 'Shortman'),
            new Contact(FirstName = 'Gerald', LastName = 'Johanssen'),
            new Contact(FirstName = 'Helga', LastName = 'Pataki'),
            new Contact()
        };

        Database.insert(newContacts, false);

        List<Contact> allContacts = [SELECT Id, Name FROM Contact LIMIT 10000];

        for(Contact theContact : [SELECT Id, FirstName FROM Contact LIMIT 10000]){
            theContact.FirstName = 'New Name';
        }

        // Contact theContact = [SELECT Id, Name FROM Contact WHERE Name = 'Peter Quill' LIMIT 1];

        //Never do it
        // List<String> names = new List<String> {'Andy', 'Tom', 'Mary'};
        // for(Contact theContact : names){
        //     Contact theContact = [SELECT Id, FirstName FROM Contact WHERE Name =: name LIMIT 1];
        //     theContact.FirstName = 'FirstName';
        // }

        List<List<sObject>> records = [FIND 'Andy' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName, LastName)];

    }
}