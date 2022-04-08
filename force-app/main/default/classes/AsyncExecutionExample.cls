public class AsyncExecutionExample implements Queueable {
    public static boolean myCheck = false;
    public void execute(QueueableContext context) {
        system.debug('max number of SOQL in an Asynchrnous context '+Limits.getLimitQueries());
        system.debug('the value of myCheck is '+myCheck);
    }
}