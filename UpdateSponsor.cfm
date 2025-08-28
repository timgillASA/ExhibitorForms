<cfset pageTitle = "Update Sponsor - Exhibitor Forms">
<cfinclude template="header.cfm">

<!-- Security check -->
<cfparam name="session.loggedIn" default="false">
<cfparam name="session.SponsorID" default="">
<cfif NOT session.loggedIn OR NOT len(session.SponsorID)>
  <cflocation url="login.cfm" addtoken="false">
</cfif>

<!-- Server-side field length validation -->
<cfparam name="form.FirstName" default="">
<cfparam name="form.LastName" default="">
<cfparam name="form.Email" default="">

<!-- Trim and enforce maximum lengths -->
<cfset form.FirstName = left(trim(form.FirstName), 50)>
<cfset form.LastName = left(trim(form.LastName), 50)>
<cfset form.Email = left(trim(form.Email), 100)>

<cfquery name="updateSponsor" datasource="#application.dbsource#">
  UPDATE tblSponsors SET
    FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" maxlength="50">,
    LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" maxlength="50">,
    Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">
  WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
</cfquery>

<!-- Handle logo upload only if a file was selected -->
<cfif structKeyExists(form, "Logo") AND len(trim(form.Logo))>
  
  <!-- Check if UploadDirectory exists, if not set it manually -->
  <cfif NOT structKeyExists(application, "UploadDirectory")>
    <cfset application.UploadDirectory = "e:\inetpub\wwwroot\images\CompanyLogos">
  </cfif>
  
  <cftry>
    <cffile action="upload" fileField="Logo" destination="#application.UploadDirectory#" nameconflict="makeunique" result="uploadResult">
    
    <cfset filename = uploadResult.clientFile>
    <cfset ext = lcase(ListLast(filename, "."))>
    <cfif ext EQ "jpg" OR ext EQ "jpeg" OR ext EQ "png">
      <cfset baseFilename = ListFirst(filename, ".")>
      <!-- Remove spaces from filename -->
      <cfset baseFilename = replace(baseFilename, " ", "", "ALL")>
      <cfset currentDate = dateFormat(now(), "mmddyyyy")>
      
      <!-- Check if original file exists without date -->
      <cfset originalName = baseFilename & "." & ext>
      <cfset originalPath = application.UploadDirectory & "\" & originalName>
      
      <cfif fileExists(originalPath)>
        <!-- File exists, create versioned name with date -->
        <cfset newName = baseFilename & "_" & currentDate & "." & ext>
        <cfset newPath = application.UploadDirectory & "\" & newName>
        
        <!-- Check if file with date already exists -->
        <cfset version = 1>
        <cfloop condition="fileExists(newPath)">
          <cfset newName = baseFilename & "_" & currentDate & "_V" & version & "." & ext>
          <cfset newPath = application.UploadDirectory & "\" & newName>
          <cfset version = version + 1>
        </cfloop>
      <cfelse>
        <!-- No existing file, use original naming convention -->
        <cfset newName = originalName>
        <cfset newPath = originalPath>
      </cfif>
      
      <!-- Ensure logo filename doesn't exceed database limit (50 chars) -->
      <cfif len(newName) GT 50>
        <cfset newName = left(newName, 50)>
        <cfset newPath = application.UploadDirectory & "\" & newName>
      </cfif>
      
      <!-- Rename the uploaded file to final name -->
      <cffile action="rename" source="#uploadResult.serverDirectory#/#uploadResult.serverFile#" destination="#newPath#">
      
      <!-- Update database with new filename -->
      <cfquery datasource="#application.dbsource#">
        UPDATE tblSponsors SET LogoFilename = <cfqueryparam value="#newName#" cfsqltype="cf_sql_varchar" maxlength="50">
        WHERE SponsorID = <cfqueryparam value="#session.SponsorID#" cfsqltype="cf_sql_integer">
      </cfquery>
    </cfif>
    
    <cfcatch type="any">
      <!-- File upload failed - continue silently or log error -->
    </cfcatch>
  </cftry>
</cfif>

<div class="success-message">
  <p>Sponsor information updated successfully!</p>
</div>
<p><a href="index.cfm">Return to Dashboard</a></p>

<cfinclude template="footer.cfm">