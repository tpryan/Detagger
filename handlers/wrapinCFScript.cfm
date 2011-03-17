<cfsetting showdebugoutput="false" />

<cfscript>
	if (not structKeyExists(form, "ideeventInfo")){
		form.ideeventInfo = fileRead(ExpandPath('./sample.xml'));
	}	
	ls = createObject("java", "java.lang.System").getProperty("line.separator");
	XMLDoc = XMLParse(ideeventInfo);
	text = XMLDoc.event.ide.editor.selection.text.XMLtext;
	
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
							#chr(60)#cfscript#chr(62)##ls#
							#text##ls#
							#chr(60)#/cfscript#chr(62)#
						</cfoutput>
						]]>
					</param>
				</params>
				
			</command>
			
		</commands>
	</ide>
</response>	
