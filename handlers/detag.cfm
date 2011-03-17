<cfsetting showdebugoutput="false" />

<cfscript>
	if (not structKeyExists(form, "ideeventInfo")){
		form.ideeventInfo = fileRead(ExpandPath('./sample.xml'));
	}	
	
	
	XMLDoc = XMLParse(ideeventInfo);
	text = XMLDoc.event.ide.editor.selection.text.XMLtext;
	
	detagger = new cfc.detagger();
	result = detagger.detag(text);

	
	
</cfscript>

<cfheader name="Content-Type" value="text/xml">
<response showresponse="yes">
	<ide >			
		<commands>			
			<command type="inserttext">
				<params>
					<param key="text">
						<![CDATA[
						<cfoutput>
							#result#
						</cfoutput>
						]]>
					</param>
				</params>
				
			</command>
			
		</commands>
	</ide>
</response>	
