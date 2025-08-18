<cfset pageTitle = "Login - Exhibitor Forms">
<cfinclude template="header.cfm">

<div class="row">
  <div class="col-xs-12 col-md-6 col-md-offset-3">
    <div class="login-container">
      <h2>Exhibitor / Sponsor Login</h2>
      <p>Select your organization to receive a verification code via email.</p>
      
      <cfquery name="getSponsors" datasource="#application.dbsource#">
        SELECT SponsorID, Organization, Email
        FROM tblSponsors
        ORDER BY Organization
      </cfquery>

      <cfform action="sendCode.cfm" method="post">
        <div class="form-field">
          <label for="SponsorID">Select Your Organization:</label>
          <select name="SponsorID" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 3px;">
            <option value="">Choose your organization...</option>
            <cfoutput query="getSponsors">
              <option value="#SponsorID#">#Organization# (#email#)</option>
            </cfoutput>
          </select>
        </div>
        <div class="submit-container">
          <input type="submit" value="Send Verification Code" class="button button-register">
        </div>
      </cfform>
    </div>
  </div>
</div>

<cfinclude template="footer.cfm">