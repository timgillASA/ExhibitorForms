<cfquery name="getSponsors" datasource="#session.dbsource#">
  SELECT SponsorID, Organization, Email
  FROM tblSponsors
  ORDER BY Organization
</cfquery>

<cfform action="sendCode.cfm" method="post">
  <select name="SponsorID">
    <cfoutput query="getSponsors">
      <option value="#SponsorID#">#Organization#</option>
    </cfoutput>
  </select>
  <input type="submit" value="Send Code">
</cfform>