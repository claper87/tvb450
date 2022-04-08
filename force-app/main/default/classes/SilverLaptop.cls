public class SilverLaptop extends Laptop {
    
    public SilverLaptop(Integer quantity){
        price = 3250.00;
        this.quantity = quantity;
    }
    
    public override string productLine() {
        return 'This is the Silver Product';
    }
}