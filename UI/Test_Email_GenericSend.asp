<%@ Language=VBScript %> 

<!--#include virtual="qik/includes/Qikdata.inc"-->
<!--#include virtual="qik/includes/Qikglobal.inc"-->
<!--#include virtual="qik/includes/Qikdsn.inc"-->


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
'Assumption - Emails seem to have a maximum of 3 attachments (as of 20 May 2016). Default to 7 as a max, increase if needed. 
Dim Attachments(7) 
%>
	Attachments LBound: <%=LBound(Attachments)%><br/>
	Attachments UBound: <%=UBound(Attachments)%><br/>
	
<% 	
'Try dynamic, must have 0 at start
Dim DynamicArray(0)
Dim idxLast
%>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
<%
idxLast = UBound(DynamicArray)
ReDim Preserve DynamicArray(idxLast + 1) 
idxLast = UBound(DynamicArray)
%>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
<%
DynamicArray(idxLast) = "C:\Dev\aklqikdev-solution\aklqikdev-local\qik\Test\pbtech\pbtech_qik_inc.txt"	
%>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
<%
Dim result
	result = Email_GenericSend("qikmail2@fnl.net.nz", "Not a Spammer", "ernest@financenow.co.nz", "This is NOT spam", "Please ignore this message", DynamicArray )

%>
	Result: <%=result%>
	
</body>
</html>

