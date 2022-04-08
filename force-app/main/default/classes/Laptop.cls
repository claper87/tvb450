public virtual class Laptop {
    
    public Decimal price = 3000;
    public Integer quantity = 1;
    
    public Laptop(){}
    
    public Laptop(Integer quantity){
        this.quantity = quantity;
    }
    
    public virtual string productLine() {
        return 'This is the Base Product';
    }
    
    public Decimal getTotal(){
        return price * quantity;
    }
    


}