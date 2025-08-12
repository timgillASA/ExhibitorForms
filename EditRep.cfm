<cfif form.action EQ "Delete">
  <cfquery datasource="your_dsn">
    DELETE FROM tblSponsorReps WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      AND Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
      AND MeetingYear = <cfqueryparam value="#Application.MeetingYear#" cfsqltype="cf_sql_integer">
  </cfquery>
<cfelseif form.action EQ "Update">
  <cfquery datasource="your_dsn">
    UPDATE tblSponsorReps SET
      FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar">,
      LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar">
    WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      AND Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
      AND MeetingYear = <cfqueryparam value="#Application.MeetingYear#" cfsqltype="cf_sql_integer">
  </cfquery>
<cfelseif structKeyExists(form, "New")>
  <cfquery datasource="your_dsn">
    INSERT INTO tblSponsorReps (SponsorID, FirstName, LastName, Email, MeetingYear)
    VALUES (
      <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">,
      <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#Application.MeetingYear#" cfsqltype="cf_sql_integer">
    )
  </cfquery>
</cfif>
<cflocation url="dashboard.cfm">