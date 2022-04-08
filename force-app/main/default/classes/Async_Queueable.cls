public class Async_Queueable implements Queueable {
    
    public void execute(QueueableContext qc){
        List<contact> contacts = new List<contact>();
        contacts.add(new contact(lastname='ftf01'));
        contacts.add(new contact(lastname='ftf02'));
        insert contacts;
    }

}