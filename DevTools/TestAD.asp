

<%@  language="VBScript" %>
<% Response.Buffer = True %>
<!--#include virtual="qik/includes/Qikdata.inc"-->
<!--#include virtual="qik/includes/Qikglobal.inc"-->
<!--#include virtual="qik/Client.asp"-->
<!--#include virtual="qik/QikSystree.asp"-->
<!--#include virtual="qik/includes/Qikdsn.inc"-->

<%

set conn = createobject("ADODB.Connection")
Set iAdRootDSE = GetObject("LDAP://RootDSE")
strDefaultNamingContext = iAdRootDSE.Get("defaultNamingContext")
Conn.Provider = "ADsDSOObject"
Conn.Open "ADs Provider"

strQueryDL = "<LDAP://" & strDefaultNamingContext & ">;(&(objectCategory=person)(objectClass=user));distinguishedName,adspath;subtree"
set objCmd = createobject("ADODB.Command")
objCmd.ActiveConnection = Conn
objCmd.Properties("SearchScope") = 2 ' we want to search everything
objCmd.Properties("Page Size") = 500 ' and we want our records in lots of 500 

objCmd.CommandText = strQueryDL
Set objRs = objCmd.Execute



%>
<html>
<head>
</head>
<body>
<%
While Not objRS.eof

	' do something with objRS.Fields("distinguishedName")'
	objRS.MoveNext
Wend
%>

</body>
</html>
