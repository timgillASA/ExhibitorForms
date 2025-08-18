<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="JSM, Joint Statistical Meetings, statistics, exhibitors, sponsors"/>
<meta name="description" content="2025 Joint Statistical Meetings (JSM) Exhibitor and Sponsor Forms" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">
<link rel="icon" href="../favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="../css/flexboxgrid.min.css" type="text/css" />
<link rel="preconnect" href="https://cdn.fonts.net">
<link href="https://cdn.fonts.net/kit/4693c63d-ed90-496b-8e3b-d8b72a972427/4693c63d-ed90-496b-8e3b-d8b72a972427.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/style.css?v=2025.1" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<!-- Get Meeting-specific CSS from database -->
<cfquery name="getMeetingCSS" datasource="#application.dbsource#">
    SELECT MeetingCSS 
    FROM tblMeetings 
    WHERE MeetingAcronym = <cfqueryparam value="#application.MeetingAcronym#" cfsqltype="cf_sql_varchar">
    AND MeetingYear = <cfqueryparam value="#application.SponsorYear#" cfsqltype="cf_sql_integer">
</cfquery>

<cfif getMeetingCSS.recordCount GT 0 AND len(trim(getMeetingCSS.MeetingCSS))>
    <style type="text/css">
        <cfoutput>#getMeetingCSS.MeetingCSS#</cfoutput>
    </style>
</cfif>

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>
    <cfparam name="pageTitle" default="Exhibitor / Sponsor Form">
    <cfoutput>#pageTitle# - JSM 2025</cfoutput>
</title>
</head>
<body>
    <div class="header">
        <div id="navbar">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12" id="logo" style="text-align: center;">
                        <a href="index.cfm"><img src="../images/logo.png?v=2025" alt="2025 Joint Statistical Meetings - Exhibitor Forms" class="logo" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container" style="margin-top: 20px;">
        <div class="row">
            <div class="col-xs-12">
