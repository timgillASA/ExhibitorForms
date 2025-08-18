<cfset pageTitle = "Update Meeting CSS">
<cfinclude template="header.cfm">

<cfif isDefined("form.updateCSS")>
    
    <cftry>
        <!-- Read the CSS file content -->
        <cffile action="read" file="#expandPath('./styles.css')#" variable="cssContent">
        
        <!-- Update the database -->
        <cfquery datasource="#application.dbsource#">
            UPDATE tblMeetings 
            SET MeetingCSS = <cfqueryparam value="#cssContent#" cfsqltype="cf_sql_longvarchar">
            WHERE MeetingAcronym = <cfqueryparam value="#application.MeetingAcronym#" cfsqltype="cf_sql_varchar">
            AND MeetingYear = <cfqueryparam value="#application.SponsorYear#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <div class="row">
            <div class="col-xs-12">
                <div class="success-message">
                    <i class="fa fa-check-circle"></i>
                    CSS content has been successfully saved to the database for <cfoutput>#application.MeetingAcronym# #application.SponsorYear#</cfoutput>!
                </div>
                <p>File size: <cfoutput>#len(cssContent)#</cfoutput> characters</p>
                <p><a href="index.cfm">← Back to Dashboard</a></p>
            </div>
        </div>
        
        <cfcatch type="any">
            <div class="row">
                <div class="col-xs-12">
                    <div class="error-message">
                        <i class="fa fa-exclamation-triangle"></i>
                        Error: <cfoutput>#cfcatch.message#</cfoutput><br>
                        Detail: <cfoutput>#cfcatch.detail#</cfoutput>
                    </div>
                    <p><a href="index.cfm">← Back to Dashboard</a></p>
                </div>
            </div>
        </cfcatch>
    </cftry>

<cfelse>
    <div class="row">
        <div class="col-xs-12">
            <h2>Move CSS to Database</h2>
            <p>This will move the contents of styles.css into the MeetingCSS field of the tblMeetings table for <cfoutput>#application.MeetingAcronym# #application.SponsorYear#</cfoutput>.</p>
            
            <!-- Check if CSS file exists -->
            <cfif fileExists(expandPath('./styles.css'))>
                <div style="background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; margin: 10px 0; border-radius: 3px;">
                    <i class="fa fa-info-circle"></i> styles.css file found and ready to import.
                </div>
                
                <cfform action="#cgi.script_name#" method="post">
                    <div class="submit-container">
                        <input type="submit" name="updateCSS" value="Move CSS to Database" class="button button-register">
                    </div>
                </cfform>
            <cfelse>
                <div class="error-message">
                    <i class="fa fa-exclamation-triangle"></i>
                    styles.css file not found in the current directory.
                </div>
            </cfif>
            
            <p><a href="index.cfm">← Back to Dashboard</a></p>
        </div>
    </div>
</cfif>

<cfinclude template="footer.cfm">
