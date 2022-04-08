public class Calculator {
    
    private Integer firstDigit = 2;
    public Integer secondDigit = 6;
    final decimal valueOfPI;
    
    public calculator(){
         valueOfPI = 3.14;
         system.debug('this is first thing that gets executed');
    }
    
    public calculator(integer digit){
        this.firstdigit = digit;
        system.debug('you called the constructor with a parameter');
    }
    
    public integer Add(){      
        return firstDigit+secondDigit;
    }
    
    public static Integer addExpress(Integer firstDigit, Integer secondDigit){
        return firstDigit+secondDigit;
    }

}