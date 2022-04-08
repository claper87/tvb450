public class MyConcreteClass extends MyVirtualClass{
    
    public override void sayHi(){
        system.debug('hi from MyConcreteClass');
    }
 
    
    public virtual void sayGoodMorningAmerica(){
        system.debug('Good Morning America from MyConcreteClass');
    }

}