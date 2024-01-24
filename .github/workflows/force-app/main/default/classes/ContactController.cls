public with sharing class ContactController {
 


   /*

   
@AuraEnabled(cacheable=true)
public static List<Contact> getContactss(Integer pageNumber, Integer pageSize) {
    Integer offset = (pageNumber - 1) * pageSize;
    return [SELECT Id, Name, Email, Phone FROM Contact ORDER BY Name ASC LIMIT :pageSize OFFSET :offset];
}


}

// ContactController.cls
@AuraEnabled(cacheable=true)
public static List<Contact> getContactss(Integer pageNumber, Integer pageSize, String searchTerm, String sortBy, String sortDirection) {
    Integer offset = (pageNumber - 1) * pageSize;
    String searchQuery = '%' + searchTerm + '%'; // Add wildcards for partial search

    // Build the query dynamically based on sorting direction and field
    String query = 'SELECT Id, Name, Email, Phone FROM Contact ' +
                   'WHERE (FirstName LIKE :searchQuery OR LastName LIKE :searchQuery) ';
    
    if (sortDirection == 'asc') {
        query += 'ORDER BY ' + sortBy + ' ASC ';
    } else {
        query += 'ORDER BY ' + sortBy + ' DESC ';
    }

    query += 'LIMIT :pageSize OFFSET :offset';

    return Database.query(query);
}





*/


}