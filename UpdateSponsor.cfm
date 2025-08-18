<cfset pageTitle = "Update Sponsor - Exhibitor Forms">
<cfinclude template="header.cfm">

<!-- Server-side field length validation -->
<cfparam name="form.FirstName" default="">
<cfparam name="form.LastName" default="">
<cfparam name="form.Email" default="">

<!-- Trim and enforce maximum lengths -->
<cfset form.FirstName = left(trim(form.FirstName), 50)>
<cfset form.LastName = left(trim(form.LastName), 50)>
<cfset form.Email = left(trim(form.Email), 100)>

<cfquery name="updateSponsor" datasource="#application.dbsource#">
  UPDATE tblSponsors SET
    FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" maxlength="50">,
    LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" maxlength="50">,
    Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">
  WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif structKeyExists(form, "Logo") AND len(form.Logo)>
  <cfset filename = ListFirst(form.Logo, "/\")>
  <cfset ext = ListLast(filename, ".")>
  <cfif ext EQ "jpg" OR ext EQ "png">
    <cfset newName = ListFirst(filename, ".") & "_" & Application.SponsorYear & "." & ext>
    <!-- Ensure logo filename doesn't exceed database limit (50 chars) -->
    <cfset newName = left(newName, 50)>
    <cffile action="upload" fileField="Logo" destination="#Application.UploadDirectory#" nameconflict="overwrite" result="upload">
    <cffile action="rename" source="#Application.UploadDirectory#/#upload.ServerFile#" destination="#Application.UploadDirectory#/#newName#">
    <cfquery datasource="#application.dbsource#">
      UPDATE tblSponsors SET LogoFilename = <cfqueryparam value="#newName#" cfsqltype="cf_sql_varchar" maxlength="50">
      WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
    </cfquery>
  </cfif>
</cfif>

<div class="success-message">
  <p>Sponsor information updated successfully!</p>
</div>
<p><a href="index.cfm">Return to Dashboard</a></p>

<cfinclude template="footer.cfm">