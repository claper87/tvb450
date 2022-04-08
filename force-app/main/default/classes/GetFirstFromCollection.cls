public with sharing class GetFirstFromCollection {
    @InvocableMethod
    public static List <Results> execute (List<Requests> requestList) {
        List<SObject> inputCollection = requestList[0].inputCollection;
        SObject outputMember = inputCollection[0];
        
        //Create a Results object to hold the return values
        Results response = new Results();
        
        //Add the return values to the Results object
        response.outputMember = outputMember;
        
        //Wrap the Results object in a List container 
        //(an extra step added to allow this interface to also support bulkification)
        List<Results> responseWrapper= new List<Results>();
        responseWrapper.add(response);
        return responseWrapper;    
    }
    
    
    public class Requests {
      @InvocableVariable(label='Records for Input' description='yourDescription' required=true)
      public List<SObject> inputCollection;
      }
    
    public class Results {
      @InvocableVariable(label='Records for Output' description='yourDescription' required=true)
      public SObject outputMember;
      }
}