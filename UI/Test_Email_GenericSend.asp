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
'Assumption - Emails seem to have a maximum of 3 attachments (as of 20 May 2016). Default to 7 as a max, increase if needed. 
Dim Attachments(7) 
%>
	Attachments LBound: <%=LBound(Attachments)%><br/>
	Attachments UBound: <%=UBound(Attachments)%><br/>
	
<% 	
'Try dynamic, must have 0 at start
ReDim DynamicArray(0)
Dim idxLast
%>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
	Resize <br/>
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
	For ix = LBound(DynamicArray) to UBound(DynamicArray) 
		Response.Write "ix: " & ix & " : " 
		If Len(DynamicArray(ix)) > 0 Then Response.Write  DynamicArray(ix)
		Response.Write "<br/>" 

	Next
%>
	Result: <%=result%>
	
</body>
</html>

