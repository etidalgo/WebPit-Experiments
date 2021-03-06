<%@ Language=VBScript %>
<html>
<head>
	<title>Data dump - ASP Application and Session Data</title>
	<script src="https://code.jquery.com/jquery-2.2.3.min.js" ></script>
    <script type="text/javascript">
<%	
For Each keyName In Application.Contents
    If ( IsObject( Application(keyName) ) ) Then
        keyValue = "object"
    ElseIf ( IsArray( Application(keyName) ) ) Then
        keyValue = "array"
    ElseIf ( IsNull(Application.Contents(keyName) ) ) Then
        keyValue = "nothing"
    Else
        keyValue = cstr(Application.Contents(keyName))
    End If
    Response.Write "var appvar_" & keyName & " = '" & keyValue & "';" & vbCrLf  
Next 
	
For Each keyName In Session.Contents
    If ( IsObject( Session(keyName) ) ) Then
        keyValue = "object"
    ElseIf ( IsArray( Session(keyName) ) ) Then
        keyValue = "array"
    ElseIf ( IsNull(Session.Contents(keyName) ) ) Then
        keyValue = "nothing"
    Else
        keyValue = cstr(Session.Contents(keyName))
    End If
    Response.Write "var sesvar_" & keyName & " = '" & keyValue & "';" & vbCrLf 
	
Next 
%>
	function PostSessionValues() {
		var settings = {
		  "async": true,
		  "crossDomain": true,
		  "url": "/Experiments/DevTools/SessionDataAssign.asp",
		  "method": "POST",
		  "headers": {
			"cache-control": "no-cache",
			"content-type": "application/x-www-form-urlencoded"
		  },
		  "data": {
			"ALPHA": "ALPHA_VALUE  1461146872",
			"BETA": "BETA_VALUE  1461146872"
		  }
		}

		$.ajax(settings).done(function (response) {
		  console.log(response);
		});	
	}

	$(document).ready(function(){
		window.setInterval(function() {
			window.location.reload();
		}, 5000);
	});
	</script>
	<style>
		.pageContent {
		
		}
		.header {
		}
		
		.entry {
			margin-left: 20px;
			width: 700px;
		}
		
		.entry div {
			display: inline-block;			
		}
		.keyName {
		}
		
		.keyValue {
			color: blue;
			margin-left: 50px;

		}
	</style>
</head>
<body>
<p>Helper for Classic ASP - Session and Application value dump</p>
<p>Aims</p>
<ul>
<li>Batch session variables</li>
<li>Click and edit</li>
<li>Improve formatting</li>
<li>Delete</li>
<li>Single page app style - refresh section instead of page</li>
</ul>
<div><input type="button" value="Post Session Values" onclick="PostSessionValues()"></input></div>
<div><input type="button" value="Reload" onclick="javascript:window.location.reload()"></input></div>

<label class="header">Application Variables - <% =Application.Contents.Count %> Found</label><br><br>
SVRCONFIG_DB_NAME: <%=Application("SVRCONFIG_DB_NAME")%> <BR><BR>

<%

Dim keyName
Dim keyValue
    Response.Write "SessionID: " & Session.SessionID & "<BR><BR>"

	Response.Write "Auth_User: " & Request.ServerVariables("AUTH_USER") & "<BR><BR>"
	Response.Write "Application(""SVRCONFIG_DB_NAME""): " & Application("SVRCONFIG_DB_NAME") & "<BR><BR>"
	
For Each keyName In Application.Contents
    If ( IsObject( Application(keyName) ) ) Then
        keyValue = "&lt;object&gt;"
    ElseIf ( IsArray( Application(keyName) ) ) Then
        keyValue = "&lt;array&gt;"
    ElseIf ( IsNull(Application.Contents(keyName) ) ) Then
        keyValue = "&lt;nothing&gt;"
    Else
        keyValue = cstr(Application.Contents(keyName))
    End If
%>	
    <div class="entry"><div class="keyName"><%=keyName%></div> <div class="keyValue"><%=keyValue%></div></div><BR>
<%	
Next 
%>	
<hr>
<label class="header">Session Variables - <% =Session.Contents.Count %> Found</label><br><br>
<%	
For Each keyName In Session.Contents
    If ( IsObject( Session(keyName) ) ) Then
        keyValue = "&lt;object&gt;"
    ElseIf ( IsArray( Session(keyName) ) ) Then
        keyValue = "&lt;array&gt;"
    ElseIf ( IsNull(Session.Contents(keyName) ) ) Then
        keyValue = "&lt;nothing&gt;"
    Else
        keyValue = cstr(Session.Contents(keyName))
    End If
%>	
    <div class="entry"><div class="keyName"><%=keyName%></div> <div class="keyValue"><%=keyValue%></div></div><BR>
<%	
Next 
%>

</div>
</body>
</html>
