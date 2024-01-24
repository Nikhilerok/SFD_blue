import { LightningElement, wire, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation'; // Import NavigationMixin
import getSentEmails from '@salesforce/apex/emails.getSentEmails';

const COLUMNS = [
    { label: 'Subject', fieldName: 'subjectUrl', type: 'url', typeAttributes: { label: { fieldName: 'subject' }, target: '_blank' } },
    { label: 'Created Date', fieldName: 'createdDate', type: 'date' },
    { label: 'Related To', fieldName: 'relatedTo', type: 'text' },
];

export default class DisplayEmails extends NavigationMixin(LightningElement) {
    @api recordId; // Account Id passed from the record page
    emailList = [];
    columns = COLUMNS;

    @wire(getSentEmails, { accountId: '$recordId' })
    wiredEmails({ error, data }) {
        if (data) {
            this.emailList = this.formatEmails(data);
        } else if (error) {
            // Handle error
        }
    }

    formatEmails(emails) {
        const baseUrl = window.location.origin; // Get the base URL

        return emails.map(email => {
            // Construct the URL for the Email Message record
            const emailUrl = `${baseUrl}/lightning/r/EmailMessage/${email.Id}/view`;

            // Create a new object with the subject and subjectUrl properties
            return {
                ...email,
                subjectUrl: emailUrl
            };
        });
    }

    handleSubjectClick(event) {
        const emailId = event.detail.row.Id;

        // Navigate to the Email Message record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: emailId,
                actionName: 'view',
            },
        });
    }
}