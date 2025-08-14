<cfif form.action EQ "Delete">
  <cfquery datasource="#session.dbsource#">
    DELETE FROM tblSponsorReps WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      AND Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
      AND SponsorYear = <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
  </cfquery>
<cfelseif form.action EQ "Update">
  <cfquery datasource="#session.dbsource#">
    UPDATE tblSponsorReps SET
      FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar">,
      LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar">
    WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      AND Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
      AND SponsorYear = <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
  </cfquery>
<cfelseif structKeyExists(form, "New")>
  <cfquery datasource="#session.dbsource#">
    INSERT INTO tblSponsorReps (SponsorID, FirstName, LastName, Email, SponsorYear)
    VALUES (
      <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">,
      <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
    )
  </cfquery>
</cfif>
<cflocation url="dashboard.cfm">