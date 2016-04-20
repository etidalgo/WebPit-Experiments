<%@ Language=VBScript %>
<html>
<head>
	<title>Data dump - ASP Application and Session Data</title>
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
	
	</script>
</head>
<body>
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
    Response.Write "Application[" & keyName & "]: " & keyValue & "<BR>" & vbCrLf  
Next 
	
	Response.Write "<hr>"
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
    Response.Write "Session[" & keyName & "]: " & keyValue & "<BR>" & vbCrLf  
Next 
%>


</body>
</html>
