<cfif form.code eq session.AuthCode>
  <cfset session.loggedIn = true>
  <cflocation url="dashboard.cfm" addtoken="false">
<cfelse>
  <cfoutput>Invalid code. <a href="login.cfm">Try again</a></cfoutput>
</cfif>