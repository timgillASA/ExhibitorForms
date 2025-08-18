<cfset pageTitle = "Verification Code Sent - Exhibitor Forms">
<cfinclude template="header.cfm">

<cfparam name="form.SponsorID" default="">
<cfquery name="getSponsor" datasource="#application.dbsource#">
  SELECT Email FROM tblSponsors WHERE SponsorID = <cfqueryparam value="#form.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>
<cfset code = NumberFormat(RandRange(100000,999999), "000000")>
<cfset session.AuthCode = code>
<cfset session.AuthCodeTimestamp = now()> <!-- Store when code was generated -->
<cfset session.SponsorID = form.SponsorID>

<!-- Build dynamic email subject using session variables -->
<cfset emailSubject = application.MeetingAcronym & " " & application.SponsorYear & " Login Code">

<cfmail to="#getSponsor.Email#" bcc="amy@amstat.org" from="#application.EmailFrom#" subject="#emailSubject#" type="text/plain">
Your login code is: #code#

This code is for accessing the #application.MeetingAcronym# #application.SponsorYear# Exhibitor Forms.

IMPORTANT: This code will expire in 5 minutes from the time it was sent.
</cfmail>

<div class="row">
  <div class="col-xs-12 col-md-6 col-md-offset-3">
    <div class="login-container">
      <h2>Verification Code Sent</h2>
      
      <div class="success-message">
        <i class="fa fa-check-circle" style="font-size: 1.2em;"></i>
        <cfoutput>Your login code was sent to #getSponsor.Email#</cfoutput>
      </div>
      
      <div style="margin: 15px 0; padding: 10px; background-color: #fff3cd; border: 1px solid #ffeaa7; border-radius: 3px;">
        <strong><i class="fa fa-clock-o"></i> Important:</strong> Your code will expire in 5 minutes.<br>
        <cfoutput>Code expires at: #timeFormat(dateAdd("n", 5, now()), "h:mm tt")#</cfoutput>
      </div>
      
      <cfform action="verifyCode.cfm" method="post">
        <div class="form-field">
          <label for="code">Enter Verification Code:</label>
          <cfinput type="text" name="code" maxlength="6" required="true" placeholder="6-digit code" style="width: 100%; text-align: center; font-size: 1.2em; letter-spacing: 2px;">
        </div>
        <div class="submit-container">
          <input type="submit" value="Verify Code" class="button button-register">
        </div>
      </cfform>
      
      <p style="text-align: center;"><a href="login.cfm">← Back to Login</a></p>
    </div>
  </div>
</div>

<cfinclude template="footer.cfm">