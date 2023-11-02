import { LightningElement, api, wire } from 'lwc';
import getVolunteers from '@salesforce/apex/DisplayVolunteerController.getVolunteers';

export default class DisplayVolunteers extends LightningElement {
    @api recordId;
    volunteerList = []; 
    @wire(getVolunteers, {recordId: '$recordId'}) classAssignments(result){
        const{data,error} = result;
        if (data){
            console.log(data);
            this.volunteerList = data;
        }else if(error){
            console.log(error,error.message);
        }
        
    }

}