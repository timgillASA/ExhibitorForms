<cfif NOT session.loggedIn>
  <cflocation url="login.cfm">
</cfif>

<cfquery name="sponsor" datasource="your_dsn">
  SELECT * FROM tblSponsors WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfquery name="reps" datasource="your_dsn">
  SELECT * FROM tblSponsorReps
  WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
    AND MeetingYear = <cfqueryparam value="#Application.MeetingYear#" cfsqltype="cf_sql_integer">
</cfquery>

<!-- Prefilled sponsor form -->
<cfform action="updateSponsor.cfm" method="post" enctype="multipart/form-data">
  <cfoutput>
    First Name: <cfinput name="FirstName" value="#sponsor.FirstName#"><br>
    Last Name: <cfinput name="LastName" value="#sponsor.LastName#"><br>
    Email: <cfinput name="Email" value="#sponsor.Email#"><br>
    Logo: <cfinput type="file" name="Logo"><br>
    <input type="submit" value="Update Sponsor">
  </cfoutput>
</cfform>

<!-- Reps listing and add form -->
<cfoutput>
  <table border="1">
    <tr><th>First</th><th>Last</th><th>Email</th><th>Actions</th></tr>
    <cfloop query="reps">
      <tr>
        <form action="editRep.cfm" method="post">
          <input type="hidden" name="RepID" value="#CurrentRow#">
          <td><input name="FirstName" value="#FirstName#"></td>
          <td><input name="LastName" value="#LastName#"></td>
          <td><input name="Email" value="#Email#"></td>
          <td>
            <input type="submit" name="action" value="Update">
            <input type="submit" name="action" value="Delete">
          </td>
        </form>
      </tr>
    </cfloop>
  </table>

  <!-- Add new rep -->
  <form action="editRep.cfm" method="post">
    <input type="hidden" name="New" value="true">
    <input name="FirstName" placeholder="First Name">
    <input name="LastName" placeholder="Last Name">
    <input name="Email" placeholder="Email">
    <input type="submit" name="action" value="Add">
  </form>
</cfoutput>