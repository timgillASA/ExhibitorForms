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
        application.varBearerToken = "";
        application.varNewTokenTime = "";
        application.SponsorYear = "2025"; // Add SponsorYear as specified in schema
        url.ShowErrors = "";
        return true;
    }
    
    // onSessionStart method runs when a user's session begins
    public void function onSessionStart() {
        session.MeetingYear = "2025";
        session.MeetingAcronym = "JSM";
        session.ParentEvent = "2e04bc98-0078-c684-cbd1-0b48009516cd";
        session.MeetingCode = session.MeetingAcronym & session.MeetingYear;
        session.Meeting = session.MeetingAcronym & " " & session.MeetingYear;
        session.dbsource = "JSMSponsors";
        session.loggedIn = false; // Initialize login status
        

    }
    
    // onRequestStart method runs at the beginning of each request
    public boolean function onRequestStart(required string targetPage) {
        // DEBUG: Show detailed errors when url.ShowErrors is present
        // Comment out the next 3 lines when not debugging
        if (structKeyExists(url, "ShowErrors")) {
            this.enableRobustException = true;
        }
        
        // Reset functionality
        if (structKeyExists(url, "reset")) {
            structClear(session);
            // Re-establish session variables after clearing
            reestablishSessionVariables();
            location(url="index.cfm", addToken="no");
            return false;
        }
        
        // Application reset functionality
        if (structKeyExists(url, "resetApp")) {
            applicationStop();
            location(url="index.cfm", addToken="no");
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
        session.MeetingYear = "2025";
        session.MeetingAcronym = "JSM";
        session.ParentEvent = "2e04bc98-0078-c684-cbd1-0b48009516cd";
        session.MeetingCode = session.MeetingAcronym & session.MeetingYear;
        session.Meeting = session.MeetingAcronym & " " & session.MeetingYear;
        session.dbsource = "JSMSponsorsDEMO";
        session.loggedIn = false; // Initialize login status
    }
    
    // Replace the ms_token custom tag functionality
    //private void function getNewToken() {
        // Call the MS_Token.cfm custom tag
    //    cfmodule(template="MS_Token.cfm");
    //}
}