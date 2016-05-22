<%@ Language=VBScript %> 



<html>
<head>
	<style>
		textarea.displayxml {
			display: inline;
			height: 250px;
			width: 500px;
		}
	</style>
</head>
<body>

	
<% 	
'
'Convention - Attachments 
ReDim Attachments(0) 

%>
	Attachments LBound: <%=LBound(Attachments)%><br/>
	Attachments UBound: <%=UBound(Attachments)%><br/>
	Attachments last element: <% If Len(Attachments(UBound(Attachments)))= 0 Then Response.Write "Zero Length" %><br/>
	
<%

	For ix = LBound(Attachments) to UBound(Attachments) 
		Response.Write "ix: " & ix & " : " 
		If Len(Attachments(ix)) > 0 Then 
			Response.Write  Attachments(ix)
		Else
			Response.Write "[Empty]"
		End If
		Response.Write "<br/>" 

	Next
	
Dim result	
	'result = Email_GenericSend( "fake.admin@financenow.co.nz", "Fake Administrator", "etidalgo@financenow.co.nz", "THIS MESSAGE CAN BE IGNORED", "Please ignore this message", Attachments)
%>
	Result: <%=result%><br/>

<%
'Convention: The current UBound is empty and assignable. Assign the current UBound and increase the Array size. 
'Alternate convention: Allocate element and assign. Treat the 0 element as unused. 
idxLast = UBound(Attachments)
Attachments(idxLast) = "C:\Dev\aklqikdev-solution\aklqikdev-local\qik\Test\pbtech\pbtech_qik_inc.txt"
ReDim Preserve Attachments(idxLast+1)	

	'result = Email_GenericSend( "fake.admin@financenow.co.nz", "Fake Administrator", "etidalgo@financenow.co.nz", "THIS MESSAGE CAN BE IGNORED", "Please ignore this message", Attachments)
%>
	One Attachment
	Result: <%=result%><br/>
</body>
</html>

