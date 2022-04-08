public class Human {
    
    public String Name;
    public Integer Age;
    
    public Human(String myName, Integer myAge){
        system.debug('executing the constructor');
        this.Name = myName;
        this.Age = myAGe;
    }
    
    public Human(String lastname){
        system.debug('executing the constructor');
        this.Name = lastname;
    }
    
    public Integer whatsTheAge(){
        return this.Age;
    }
    
    public String whatsTheName(){
        return null;
    }
    
    public void printTheName(){
        system.debug(this.Name);
    }

}