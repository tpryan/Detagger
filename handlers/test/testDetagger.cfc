component extends="mxunit.framework.TestCase"{

	public void function testCFsetWithNoSlash(){    
 		var detagger = new cfscripter.handlers.cfc.detagger();
 		var content = '<cfset test = "value">';   	    
    	var expected ='test = "value";';
    	var result = detagger.detag(content);
    	
    	
    	AssertEquals(expected,result);
    	    
    }
    
    public void function testCFsetWithSlash(){    
 		var detagger = new cfscripter.handlers.cfc.detagger();
 		var content = '<cfset test = "value" />';   	    
    	var expected ='test = "value";';
    	var result = detagger.detag(content);
    	
    	AssertEquals(expected,result);
    	    
    }
    
    public void function testCFsetmultiples(){    
 		var detagger = new cfscripter.handlers.cfc.detagger();
 		var content = '';
    	var expected ='';
    	
    	savecontent variable = "content"{
    		writeoutput('<cfset test = "value">');
    		writeoutput('<cfset test2 = "value2" />');
    		writeoutput('<cfset test3 = value3 >');
    		writeoutput('<cfset test4 = value4 />');
    		writeoutput('<cfset test5 = value5/>');
    		writeoutput('<cfset test6 = "value">');
    	
    	}
    	
    	savecontent variable = "expected"{
    		writeoutput('test = "value";');
    		writeoutput('test2 = "value2";');
    		writeoutput('test3 = value3;');
    		writeoutput('test4 = value4;');
    		writeoutput('test5 = value5;');
    		writeoutput('test6 = "value";');
    	
    	}
    	
    	var result = detagger.detag(content);
    	
    	AssertEquals(expected,result);
    	    
    }
	


}