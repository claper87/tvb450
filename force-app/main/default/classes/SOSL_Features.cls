public class SOSL_Features {

    /*
     *  ALL FIELDS
        NAME FIELDS
        EMAIL FIELDS
        PHONE FIELDS
        SIDEBAR FIELDS
     * 
     * */
   
    
    public static List<List<SObject>> findWithSOSL(){
		List<List<SObject>> result = new List<List<SObject>>();
        string var = 'SFDC';
        result.addAll( [FIND 'SFDC' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName)]);
        return result;
    }
    
}