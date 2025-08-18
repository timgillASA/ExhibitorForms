<cfparam name="form.SponsorID" default="">
<cfquery name="getSponsor" datasource="#session.dbsource#">
  SELECT Email2 as Email FROM tblSponsors WHERE SponsorID = <cfqueryparam value="#form.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>
<cfset code = NumberFormat(RandRange(100000,999999), "000000")>
<cfset session.AuthCode = code>
<cfset session.SponsorID = form.SponsorID>

<cfmail to="#getSponsor.Email#" from="noreply@yourdomain.com" subject="Your Login Code" type="text/plain">
Your login code is: #code#
</cfmail>

<cfoutput>Your login code was sent to #getSponsor.Email#</cfoutput>
<cfform action="verifyCode.cfm" method="post">
  Enter Code: <cfinput type="text" name="code">
  <input type="submit" value="Login">
</cfform>