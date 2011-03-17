component{


	public string function detag(required string content){
		var result = arguments.content;
		
		result = removeCFSets(result);
		
		return result;
	}

	//TODO: replace with regular expression that is more efficient.
	public string function removeCFSets(required string content){
		var result = arguments.content;
		
		result = ReplaceNoCase(result,"<cfset ", "", "ALL");
		result = Replace(result, " />", ";", "ALL");
		result = Replace(result, "/>", ";", "ALL");
		result = Replace(result, " >", ";", "ALL");
		result = Replace(result, ">", ";", "ALL" );
		
		return result;
	}

}