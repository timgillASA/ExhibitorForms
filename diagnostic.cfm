<cfquery name="getTableInfo" datasource="#session.dbsource#">
  SELECT COLUMN_NAME, DATA_TYPE 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'tblSponsors'
  ORDER BY ORDINAL_POSITION
</cfquery>

<h3>Columns in tblSponsors table:</h3>
<cfoutput query="getTableInfo">
  #COLUMN_NAME# (#DATA_TYPE#)<br>
</cfoutput>

<hr>

<h3>Sample data from tblSponsors (first record):</h3>
<cftry>
  <cfquery name="sampleData" datasource="#session.dbsource#" maxrows="1">
    SELECT TOP 1 * FROM tblSponsors
  </cfquery>
  
  <cfloop list="#sampleData.columnList#" index="col">
    <cfoutput>#col#: #evaluate("sampleData." & col)#<br></cfoutput>
  </cfloop>
  
  <cfcatch type="any">
    <cfoutput>Error getting sample data: #cfcatch.message#</cfoutput>
  </cfcatch>
</cftry>
