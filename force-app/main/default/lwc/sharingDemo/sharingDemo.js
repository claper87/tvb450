import { LightningElement } from 'lwc';
import getRecords from '@salesforce/apex/SharingDemo.getRecords';

const columns = [{ label: 'Name', fieldName: 'Name' },
                 { label: 'Restricted Field', fieldName: 'Restricted_Field__c' }
                ];


export default class SharingDemo extends LightningElement {
    records;
    error;
    columns = columns;
    connectedCallback(){
        this.loadRecords();
    }
    loadRecords(){
        getRecords()
            .then(result => {this.records = result;})
            .catch(error => {this.error = error;
                 console.log('An error occurred ');
                 console.log(error);
                })
    }

}