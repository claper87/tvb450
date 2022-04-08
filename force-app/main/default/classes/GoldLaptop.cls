public class GoldLaptop extends Laptop {
    
    public GoldLaptop(Integer quantity){
        price = 4250.00;
        this.quantity = quantity;
    }
    
    public override string productLine() {
        return 'This is the GOLD Product';
    }
}