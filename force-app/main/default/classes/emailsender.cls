public with sharing class emailsender {
    // Method to send an email using a template to a Contact
    @AuraEnabled
    public static void sendEmailToContact(Id contactId, Id templateId, Id caseId) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setTargetObjectId(contactId); // Set the target Contact
        email.setTemplateId(templateId); // Set the email template Id
        email.setSaveAsActivity(false); // Set to true if you want to save the email as an activity

        if (caseId != null) {
            email.setWhatId(caseId); // Associate with Case if caseId is provided
        }

        // Debug log
        System.debug('Sending email to contact with ID: ' + contactId + ', Template ID: ' + templateId);

        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
    }

    // Method to send an email using a template to a Case
    @AuraEnabled
    public static void sendEmailToCase(Id caseId, Id templateId, Id contactId) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setTargetObjectId(caseId); // Set the target Case
        email.setTemplateId(templateId); // Set the email template Id
        email.setSaveAsActivity(false); // Set to true if you want to save the email as an activity

        if (contactId != null) {
            email.setWhatId(contactId); // Associate with Contact if contactId is provided
        }

        // Debug log
        System.debug('Sending email to case with ID: ' + caseId + ', Template ID: ' + templateId);

        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
    }
}