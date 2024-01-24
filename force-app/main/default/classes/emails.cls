public with sharing class emails {
    @AuraEnabled(cacheable=true)
    public static List<EmailWrapper> getSentEmails(Id accountId) {
        // Query EmailMessages related to Cases associated with the Account
        List<EmailMessage> emailMessages = [SELECT Id, Subject, TextBody, CreatedDate, RelatedToId, Parent.CaseNumber
                                            FROM EmailMessage
                                            WHERE RelatedToId IN (
                                                SELECT Id
                                                FROM Case
                                                WHERE AccountId = :accountId
                                            )
                                            ORDER BY CreatedDate DESC LIMIT 10];

        List<EmailWrapper> emailList = new List<EmailWrapper>();

        // Add emails related to Cases
        for (EmailMessage message : emailMessages) {
            emailList.add(new EmailWrapper(message));
        }

        return emailList;
    }

    public class EmailWrapper {
        @AuraEnabled
        public String subject { get; set; }
        @AuraEnabled
        public String textBody { get; set; }
        @AuraEnabled
        public DateTime createdDate { get; set; }
        @AuraEnabled
        public String relatedTo { get; set; }
        @AuraEnabled
        public Id Id { get; set; } // Include the Email Message record Id

        public EmailWrapper(EmailMessage message) {
            this.subject = message.Subject;
            this.textBody = message.TextBody;
            this.createdDate = message.CreatedDate;
            this.Id = message.Id; // Set the Email Message record Id

            if (message.Parent != null && message.Parent.CaseNumber != null) {
                this.relatedTo = message.Parent.CaseNumber;
            } else {
                this.relatedTo = 'Contact';
            }
        }
    }
}