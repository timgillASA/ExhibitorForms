<cfset pageTitle = "Dashboard - Exhibitor Forms">
<cfinclude template="header.cfm">

<cfparam name="session.loggedIn" default="false">
<cfparam name="session.SponsorID" default="">
<cfif NOT session.loggedIn OR NOT len(session.SponsorID)>
  <cflocation url="login.cfm" addtoken="false">
</cfif>

<cfquery name="sponsor" datasource="#application.dbsource#">
  SELECT * FROM tblSponsors WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfquery name="reps" datasource="#application.dbsource#">
  SELECT * FROM tblSponsorReps
  WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
    AND SponsorYear = <cfqueryparam value="#Application.SponsorYear#" cfsqltype="cf_sql_integer">
</cfquery>

<!-- Main Content Section -->
<div class="row">
  <div class="col-xs-12 col-md-8">
    <h2>Exhibitor / Sponsor Information</h2>
    
    <!-- Prefilled sponsor form -->
    <div class="sponsor-form-container">
      <cfoutput>
      <form action="updateSponsor.cfm" method="post" enctype="multipart/form-data">
        <h3>Main Contact Information</h3>
        <div class="form-field">
          <label for="FirstName">First Name:</label>
          <input name="FirstName" value="#sponsor.FirstName#" maxlength="50" required>
        </div>
        <div class="form-field">
          <label for="LastName">Last Name:</label>
          <input name="LastName" value="#sponsor.LastName#" maxlength="50" required>
        </div>
        <div class="form-field">
          <label for="Email">Email Address:</label>
          <input name="Email" value="#sponsor.Email#" maxlength="100" required type="email">
        </div>
        <div class="form-field">
          <label for="Logo">Upload New Logo:</label>
          <input type="file" name="Logo" accept=".jpg,.png">
        </div>
        <!-- Logo Preview -->
        <cfif len(trim(sponsor.LogoFilename))>
          <div class="logo-preview-container">
            <strong>Current Logo:</strong> #sponsor.LogoFilename#<br>
            <img src="/images/CompanyLogos/#sponsor.LogoFilename#" 
                 alt="Company Logo" 
                 style="max-width: 200px; max-height: 150px; border: 1px solid ##ccc; margin-top: 5px;"
                 onerror="this.style.display='none'; document.getElementById('logoError').style.display='block';">
            <div id="logoError" style="display: none; color: red; font-size: 12px; margin-top: 5px;">
              Logo file not found: #sponsor.LogoFilename#
            </div>
          </div>
        </cfif>
        <div class="submit-container">
          <input type="submit" value="Update Contact Information">
        </div>
      </form>
      </cfoutput>
    </div>

<!-- Representatives Section -->
<div class="sponsor-form-container">
    <div class="reps-container">
      <h3>Representatives</h3>
    
    <!-- Column Headers -->
    <div class="reps-header">
      <div>First Name</div>
      <div>Last Name</div>
      <div>Email</div>
      <div>Actions</div>
    </div>
    
    <!-- Existing Reps -->
    <cfloop query="reps">
      <cfoutput>
      <form action="editRep.cfm" method="post">
        <input type="hidden" name="RepID" value="#CurrentRow#">
        <div class="rep-row">
          <div><input name="FirstName" value="#FirstName#" maxlength="50" type="text"></div>
          <div><input name="LastName" value="#LastName#" maxlength="50" type="text"></div>
          <div><input name="Email" value="#Email#" maxlength="100" type="email"></div>
          <div>
            <input type="submit" name="action" value="Update">
            <input type="submit" name="action" value="Delete">
          </div>
        </div>
      </form>
      </cfoutput>
    </cfloop>
    
    <!-- Add New Rep Form -->
    <form action="editRep.cfm" method="post">
      <input type="hidden" name="New" value="true">
      <div class="add-rep-form">
        <div><input name="FirstName" placeholder="First Name" maxlength="50" type="text" required></div>
        <div><input name="LastName" placeholder="Last Name" maxlength="50" type="text" required></div>
        <div><input name="Email" placeholder="Email" maxlength="100" type="email" required></div>
        <div><input type="submit" name="action" value="Add New Rep"></div>
      </div>
    </form>
  </div>
</div> <!-- End Representatives Section Container -->

  </div> <!-- End main content column -->
  
  <!-- Sidebar -->
  <div class="col-xs-12 col-md-4">
    <div class="sidebar-container" style="background-color: #f8f9fa; padding: 20px; border-radius: 5px;">
      <h4>Help & Information</h4>
      <p><strong>Contact Support:</strong><br>
      <a href="mailto:amy@amstat.org">amy@amstat.org</a><br>
      (703) 684-1221</p>
      
      <cfif isDefined("session.loggedIn") AND session.loggedIn>
        <p><strong>Session:</strong><br>
        <a href="logout.cfm" style="color: #dc3545;"><i class="fa fa-sign-out"></i> Logout</a></p>
      </cfif>
      
      <h4>Instructions</h4>
      <ul style="margin-left: 15px;">
        <li>Update your main contact information in the form</li>
        <li>Upload a new logo if needed (JPG or PNG format)</li>
        <li>Add or edit your representatives</li>
        <li>All changes are saved automatically</li>
      </ul>
      
      <cfif isDefined("url.ShowErrors") AND url.ShowErrors EQ "true">
        <div style="margin-top: 20px; padding: 10px; background-color: #fff3cd; border: 1px solid #ffeaa7; border-radius: 3px;">
          <strong>Debug Mode:</strong><br>
          <small>Application debugging is enabled</small>
        </div>
      </cfif>
    </div>
  </div>
</div> <!-- End row -->

<cfinclude template="footer.cfm">