public class StringArrayTest {

    public static List<String> generateStringArray(Integer quantity){
        List<String> theResultingList = new List<String>();
        for(Integer i = 0; i < quantity; i++){
            theResultingList.add('Test '+i);
        }
        return theResultingList;
        
    }
}