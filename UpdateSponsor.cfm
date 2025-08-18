<cfquery name="updateSponsor" datasource="#session.dbsource#">
  UPDATE tblSponsors SET
    FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar">,
    LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar">,
    Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
  WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif structKeyExists(form, "Logo") AND len(form.Logo)>
  <cfset filename = ListFirst(form.Logo, "/\")>
  <cfset ext = ListLast(filename, ".")>
  <cfif ext EQ "jpg" OR ext EQ "png">
    <cfset newName = ListFirst(filename, ".") & "_" & Application.SponsorYear & "." & ext>
    <cffile action="upload" fileField="Logo" destination="#Application.UploadDirectory#" nameconflict="overwrite" result="upload">
    <cffile action="rename" source="#Application.UploadDirectory#/#upload.ServerFile#" destination="#Application.UploadDirectory#/#newName#">
    <cfquery datasource="#session.dbsource#">
      UPDATE tblSponsors SET LogoFilename = <cfqueryparam value="#newName#" cfsqltype="cf_sql_varchar">
      WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
    </cfquery>
  </cfif>
</cfif>
<cflocation url="dashboard.cfm" addtoken="false">