component {
    // Application settings
    this.name = "ExhibitorForms";
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 0, 60, 0);
    this.applicationTimeout = createTimeSpan(2, 0, 0, 0);
    
    // Define upload directory
    this.UploadDirectory = "e:\inetpub\wwwroot\images\CompanyLogos";
    
    // onApplicationStart method runs when application first starts
    public boolean function onApplicationStart() {
        application.LoginAttempts = structNew();
        application.SponsorYear = "2025"; // Add SponsorYear as specified in schema
        application.MasterCode = "2468"; // Master code for admin access - change this as needed
        
        // Meeting configuration
        application.MeetingAcronym = "JSM";
        application.ParentEvent = "2e04bc98-0078-c684-cbd1-0b48009516cd";
        application.Meeting = application.MeetingAcronym & " " & application.SponsorYear;
        application.dbsource = "JSMSponsorsDEMO";
        
        // Email configuration
        application.EmailFrom = "noreply@amstat.org"; // Change this to your desired from address
        application.EmailSubject = "JSM 2025 Sponsors/Exhibitors Login Code"; // Will be dynamically built in SendCode.cfm
        
        url.ShowErrors = "";
        return true;
    }
    
    // onSessionStart method runs when a user's session begins
    public void function onSessionStart() {
        session.loggedIn = false; // Initialize login status
        

    }
    
    // onRequestStart method runs at the beginning of each request
    public boolean function onRequestStart(required string targetPage) {
        // DEBUG: Show detailed errors when url.ShowErrors is present
        // Comment out the next 3 lines when not debugging
        if (structKeyExists(url, "ShowErrors")) {
            this.enableRobustException = true;
        }
        
        // Application reset functionality - must come BEFORE session reset
        if (structKeyExists(url, "resetApp")) {
            writeOutput("<h3>DEBUG: Application Reset Triggered</h3>");
            writeOutput("<p>Time: " & now() & "</p>");
            writeOutput("<p>Calling applicationStop()...</p>");
            try {
                // Clear application scope variables first
                structClear(application);
                writeOutput("<p>Application scope cleared</p>");
                
                // Then call applicationStop
                applicationStop();
                writeOutput("<p>applicationStop() completed successfully</p>");
                
                // Small delay to ensure application stops
                sleep(200);
                writeOutput("<p>Sleep completed, redirecting...</p>");
                
                // Force application restart by redirecting to itself
                location(url="#cgi.script_name#?restarted=true", addToken="no");
                
            } catch (any e) {
                writeOutput("<p>ERROR in applicationStop(): " & e.message & "</p>");
                writeOutput("<p>Attempting manual application scope clear...</p>");
                try {
                    structClear(application);
                    writeOutput("<p>Manual application scope clear completed</p>");
                } catch (any e2) {
                    writeOutput("<p>ERROR in manual clear: " & e2.message & "</p>");
                }
                location(url="index.cfm?manualReset=true", addToken="no");
            }
            return false;
        }
        
        // Show restart confirmation
        if (structKeyExists(url, "restarted")) {
            writeOutput("<h3>DEBUG: Application Restarted Successfully</h3>");
            writeOutput("<p>Time: " & now() & "</p>");
            writeOutput("<p>Application scope has been reset</p>");
            writeOutput("<p><a href='index.cfm'>Continue to Application</a></p>");
            return false;
        }
        
        // Reset functionality (session only)
        if (structKeyExists(url, "reset")) {
            writeOutput("<h3>DEBUG: Session Reset Triggered</h3>");
            writeOutput("<p>Time: " & now() & "</p>");
            writeOutput("<p>Clearing session...</p>");
            try {
                structClear(session);
                writeOutput("<p>Session cleared successfully</p>");
                writeOutput("<p>Re-establishing session variables...</p>");
                // Re-establish session variables after clearing
                reestablishSessionVariables();
                writeOutput("<p>Session reset completed, redirecting...</p>");
                location(url="index.cfm?sessionReset=true", addToken="no");
            } catch (any e) {
                writeOutput("<p>ERROR in session reset: " & e.message & "</p>");
                location(url="index.cfm?resetError=true", addToken="no");
            }
            return false;
        }
        
        // Show session reset confirmation
        if (structKeyExists(url, "sessionReset")) {
            writeOutput("<h3>DEBUG: Session Reset Successfully</h3>");
            writeOutput("<p>Time: " & now() & "</p>");
            writeOutput("<p>Session variables have been reset</p>");
            writeOutput("<p><a href='index.cfm'>Continue to Application</a></p>");
            return false;
        }
        
        // Token handling
        //if (structKeyExists(url, "reset") || now() GT application.varNewTokenTime) {
        //    application.varBearerToken = "";
        //}
        
        //if (application.varBearerToken is "") {
        //    getNewToken();
        //}
        
        return true;
    }
    
    // Helper function to reestablish session variables
    private void function reestablishSessionVariables() {
        session.loggedIn = false; // Initialize login status
    }
    
    // Replace the ms_token custom tag functionality
    //private void function getNewToken() {
        // Call the MS_Token.cfm custom tag
    //    cfmodule(template="MS_Token.cfm");
    //}
}