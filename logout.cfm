<cfset pageTitle = "Logout - Exhibitor Forms">
<cfinclude template="header.cfm">

<!-- Clear all session variables -->
<cfset structClear(session)>

<!-- Alternatively, you could invalidate the entire session -->
<!-- <cfset sessionInvalidate()> -->

<div class="login-container">
    <h2>Logged Out Successfully</h2>
    <div class="success-message">
        <p>You have been logged out and your session has been cleared.</p>
    </div>
    <p><a href="login.cfm">Return to Login</a></p>
</div>

<cfinclude template="footer.cfm">
