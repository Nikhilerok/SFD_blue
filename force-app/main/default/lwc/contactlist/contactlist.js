// contactstask.js
import { LightningElement, wire, track } from 'lwc';
import getContactss from '@salesforce/apex/ContactController.getContactss';

const columns = [
    { label: 'Name', fieldName: 'Name', sortable: true  },
    { label: 'Email', fieldName: 'Email', sortable: true },
    { label: 'Phone', fieldName: 'Phone', sortable: true}
];

export default class Contactstask extends LightningElement {
    @track pageNumber = 1;
    @track pageSize = 10;
    @track contacts = [];
    @track searchTerm = '';
    @track sortBy = 'Name'; // Default sorting by Name
    columns = columns;
    sortDirection = 'asc';
    sortedBy = 'Name';

    @wire(getContactss, { pageNumber: '$pageNumber', pageSize: '$pageSize', searchTerm: '$searchTerm', sortBy: '$sortBy', sortDirection: '$sortDirection' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data.map((contact) => ({
                Id: contact.Id,
                Name: contact.Name,
                Email: contact.Email,
                Phone: contact.Phone
            }));
        } else if (error) { 
            // Handle error gracefully  
            console.error('Error fetching contacts:', error);
        }
    }
    
 
    onHandleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.data];
 
        cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.data = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
    }
    handleNext() {
        this.pageNumber++;
    }

    handlePrevious() {
        if (this.pageNumber > 1) {
            this.pageNumber--;
        }
    }

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleSearch() {
        // Trigger a new wire call with the updated searchTerm
        this.pageNumber = 1; // Reset pagination to the first page
    }

    clearSearch() {
        this.searchTerm = '';
        this.pageNumber = 1; // Reset pagination to the first page
    }
}