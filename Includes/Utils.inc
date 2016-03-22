
<%
'-----------------------------------------------------------------------------------------------
Sub ToJsBool(val) 
	If (val) THEN Response.Write "true" ELSE Response.Write "false" End If
End Sub
'-----------------------------------------------------------------------------------------------
Function ToJsBoolStr(val) 
	If (val) THEN ToJsBoolStr = "true" ELSE ToJsBoolStr = "false" End If
End Function
%>
