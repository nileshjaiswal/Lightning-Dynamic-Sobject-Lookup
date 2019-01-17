/**
* \arg ClassName        : sObjectLookupCtrl
* \arg User Story       : 
* \arg CreatedOn        : 16/Dec/2018
* \arg LastModifiedOn   : 03/Jan/2019
* \arg CreatededBy      : Nilesh 
* \arg ModifiedBy       : Nilesh
* \arg Description      : Apex class for dynamic lookup used in lightning component
*/
public with sharing class sObjectLookupCtrl {
    /**
    @MethodName     : lookup
    @Param          : search string, object api name and where clause
    @Description    : This method search the records
    **/
    @AuraEnabled
    public static Result[] lookup(String searchString, String sObjectAPIName, String whereClause) {
        String objSearchString = String.isNotBlank(searchString) ? String.escapeSingleQuotes(searchString): '';
        String objSObjectAPIName = String.escapeSingleQuotes(sObjectAPIName);
        List<Result> results = new List<Result>();
        String strOrderBy = ' ORDER BY Name ';

        if(String.isNotBlank(objSearchString) && objSearchString.length() > 1) {
            String searchQuery = 'FIND \'' + objSearchString + '*\' IN Name FIELDS RETURNING ' + objSObjectAPIName +   
                				 '(Id, Name ' + whereClause + strOrderBy + ') Limit 50'; 
			system.debug('====searchQuery===='+searchQuery);
            List<List<SObject>> searchList = search.query(searchQuery);
            for (SObject so : searchList[0]) {
                results.add(new Result((String)so.get('Name'), so.Id));
            }
        }
        else {
            String strQuery = 'SELECT Id, Name FROM ' + sObjectAPIName + ' ' + whereClause + strOrderBy + ' LIMIT 10';
            system.debug('====strQuery===='+strQuery);
            for (SObject so : Database.query(strQuery)) {
                results.add(new Result((String)so.get('Name'), so.Id));
            }
        }
        return results;
    }
    /* End */
    
    /* Start - ResultWrapper class */ 
    public class Result {
        @AuraEnabled public String SObjectLabel;
        @AuraEnabled public Id SObjectId;
        
        public Result(String sObjectLabel, Id sObjectId) 
        {
            this.SObjectLabel = sObjectLabel;
            this.SObjectId = sObjectId;
        }
    }
    /* End - ResultWrapper class */
}