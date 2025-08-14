
<cfset varUser = "tgill@amstat.org">
<cfset varPassword = "Amstat2023!">
<cfset varClientID = "1c54l7sd7li18bpdhklb0uqi4e">
<cfset varuserPoolID = "us-east-1_mKUDxsomy">
<cfset varAssociationKey = "33771">


<!--- Sandbox
    <cfset varUser = "tgill@amstat.org">
<cfset varPassword = "Amstat2023!">
<cfset varClientID = "dqv4vdh7kmvgi04qd4ckr653p">
<cfset varuserPoolID = "us-east-1_wkTYrXJ3s">
<cfset varAssociationKey = "34195">
--->



<!--- get bearer token --->
<cfhttp url="https://rest.membersuite.com/platform/v2/authdata/#varAssociationKey#" result="BearerToken" method="post" redirect="false" >
        <cfhttpparam type="header" name="Content-type" value="application/x-www-form-urlencoded">
        <cfhttpparam type="header" name="Accept" value="application/x-www-form-urlencoded">
        <cfhttpparam type="formfield" name="username" value="#varUser#" encoded="no"  >
        <cfhttpparam type="formfield" name="password" value="#varPassword#" encoded="no"  >
        <cfhttpparam type="formfield" name="clientID" value="#varClientID#" encoded="no"  >
        <cfhttpparam type="formfield" name="userPoolID" value="#varuserPoolID#" encoded="no"  >
    </cfhttp>

    <cfset response = deserializeJSON(BearerToken.filecontent)>

    <!---<cfset caller.session.varBearerToken = "Bearer #response.idToken#">
    <cfset caller.session.varNewTokenTime = dateadd("n",45,now())>--->
    <cfset caller.Application.varBearerToken = "Bearer #response.idToken#">
    <cfset caller.Application.varNewTokenTime = dateadd("n",60,now())>

