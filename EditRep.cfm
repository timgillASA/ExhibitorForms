<cfset pageTitle = "Edit Representative - Exhibitor Forms">
<cfinclude template="header.cfm">

<!-- Security check -->
<cfparam name="session.loggedIn" default="false">
<cfparam name="session.SponsorID" default="">
<cfif NOT session.loggedIn OR NOT len(session.SponsorID)>
  <cflocation url="login.cfm" addtoken="false">
</cfif>

<!-- Server-side field length validation for reps -->
<cfparam name="form.FirstName" default="">
<cfparam name="form.LastName" default="">
<cfparam name="form.Email" default="">
<cfparam name="form.action" default="">

<!-- Trim and enforce maximum lengths -->
<cfset form.FirstName = left(trim(form.FirstName), 50)>
<cfset form.LastName = left(trim(form.LastName), 50)>
<cfset form.Email = left(trim(form.Email), 100)>

<cfif form.action EQ "Delete">
  <cfquery datasource="#application.dbsource#">
    DELETE FROM tblSponsorReps WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      AND Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">
      AND SponsorYear = <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
  </cfquery>
<cfelseif form.action EQ "Update">
  <cfquery datasource="#application.dbsource#">
    UPDATE tblSponsorReps SET
      FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" maxlength="50">,
      LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" maxlength="50">
    WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      AND Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">
      AND SponsorYear = <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
  </cfquery>
<cfelseif structKeyExists(form, "New")>
  <cfquery datasource="#application.dbsource#">
    INSERT INTO tblSponsorReps (SponsorID, FirstName, LastName, Email, SponsorYear)
    VALUES (
      <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">,
      <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" maxlength="50">,
      <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" maxlength="50">,
      <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">,
      <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
    )
  </cfquery>
</cfif>

<div class="success-message">
  <p>Representative information updated successfully!</p>
</div>
<p><a href="index.cfm">Return to Dashboard</a></p>

<cfinclude template="footer.cfm">