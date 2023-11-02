import { LightningElement, api, wire } from 'lwc';
import getClasses from '@salesforce/apex/DisplayClassController.getClasses';
import getSchoolname from '@salesforce/apex/DisplayClassController.getSchoolname';

export default class DisplayClasses extends LightningElement {
    @api recordId;
    classList = []; 
    titleString;
    @wire(getClasses, {recordId: '$recordId'}) classAssignments(result){
        const{data,error} = result;
        if (data){
            console.log(data);
            this.classList = data;
        }else if(error){
            console.log(error,error.message);
        }
    }
    
    @wire(getSchoolname, {recordId: '$recordId'}) school(result){
        const{data,error} = result;
        if (data){
            console.log(data);
            if(data.Name == "" || data.Name == null){
            this.titleString = "No Classes Created";
            }else{
                this.schoolName = data.Name;
                this.titleString = `Classes for ${this.schoolName}`;
            }
            console.log(this.schoolName);
        }else if(error){
            console.log(error,error.message);
        }
        
    }
    connectedCallback(){

    }

}

