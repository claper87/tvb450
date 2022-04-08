public class Async_aFuture {
    
    @Future
    public static void sayHello(){
        system.debug('Hello from the future');
    }
    
    @Future 
    public static void greetMeInTheFuture(){
        sayHello();
    }

   @Future 
    public static void greetMeInThePresent(){
        sayHello();
    }
   
}