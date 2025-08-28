<cfset pageTitle = "Verify Code - Exhibitor Forms">
<cfinclude template="header.cfm">

<!-- Parameter validation -->
<cfparam name="form.code" default="">
<cfparam name="session.AuthCode" default="">
<cfparam name="session.AuthCodeTimestamp" default="">

<!-- Check if the code has expired (5 minutes = 300 seconds) -->
<cfset codeExpired = false>
<cfif isDefined("session.AuthCodeTimestamp") AND isDate(session.AuthCodeTimestamp)>
  <cfset minutesElapsed = dateDiff("n", session.AuthCodeTimestamp, now())>
  <cfif minutesElapsed GT 5>
    <cfset codeExpired = true>
  </cfif>
</cfif>

<cfif codeExpired>
  <div class="row">
    <div class="col-xs-12 col-md-6 col-md-offset-3">
      <div class="login-container">
        <h2>Code Expired</h2>
        <div class="error-message">
          <i class="fa fa-exclamation-triangle"></i>
          Your verification code has expired. Codes are valid for 5 minutes only.
        </div>
        <div class="submit-container">
          <a href="login.cfm" class="button button-register">Request a New Code</a>
        </div>
      </div>
    </div>
  </div>
<cfelseif form.code eq session.AuthCode OR form.code eq application.MasterCode>
  <cfset session.loggedIn = true>
  <!-- Clear the auth code after successful login -->
  <cfset session.AuthCode = "">
  <cfset session.AuthCodeTimestamp = "">
  <cflocation url="index.cfm" addtoken="false">
<cfelse>
  <div class="row">
    <div class="col-xs-12 col-md-6 col-md-offset-3">
      <div class="login-container">
        <h2>Invalid Code</h2>
        <div class="error-message">
          <i class="fa fa-times-circle"></i>
          Invalid code. Please try again.
        </div>
        <div class="submit-container">
          <a href="login.cfm" class="button button-register">Back to Login</a>
        </div>
      </div>
    </div>
  </div>
</cfif>

<cfinclude template="footer.cfm">