<cfapplication   name="ExhibitorForms" sessionmanagement="Yes"
               sessiontimeout="#createtimespan( 0, 0, 60, 0)#"
               applicationtimeout="#createtimespan(2, 0, 0, 0)#">


<cfif isdefined("url.reset")>
    <cfscript>
        structclear(session);
    </cfscript>   
    <cflocation url="index.cfm" addtoken="No">            
</cfif>

<cfset Application.UploadDirectory = "e:\inetpub\wwwroot\images\CompanyLogos">
<cfset Application.LoginAttempts = StructNew()>
<cfset Session.MeetingYear = "2025">
<cfset Session.MeetingAcronym = "JSM">
<cfset Session.ParentEvent = "2e04bc98-0078-c684-cbd1-0b48009516cd">
<cfparam name="session.MeetingCode" default="#session.MeetingAcronym##Session.MeetingYear#">
<cfparam name="session.Meeting" default="#Session.MeetingAcronym# #session.MeetingYear#">

<cfset session.dbsource = "#Session.MeetingAcronym##session.MeetingYear#AbsDEMO">


<cfquery datasource="#session.dbsource#" name="qryMeetingInfo">
select tblConstants.*
from tblConstants
</cfquery>


<cfparam name="application.varBearerToken" default="">
<cfparam name="Application.varNewTokenTime" default="">
<cfif isdefined("url.reset") or now() GT Application.varNewTokenTime>
    <cfset application.varBearerToken = "">
</cfif>
<cfif application.varBearerToken is "">
    <cf_ms_token>
</cfif>