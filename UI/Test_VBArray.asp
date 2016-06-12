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
	Dim Attachments(7) <br/>
	Attachments LBound: <%=LBound(Attachments)%><br/>
	Attachments UBound: <%=UBound(Attachments)%><br/>
	<br/>
<% 	
Dim DimArray_NoInitDim()
%>
	Dim DimArray_NoInitDim() <br/>
	DimArray_NoInitDim LBound: LBound(DimArray_NoInitDim) causes an error <%'=LBound(DimArray_NoInitDim)
	%>
	<br/>
	DimArray_NoInitDim UBound: UBound(DimArray_NoInitDim) causes an error <%'=UBound(DimArray_NoInitDim)
	%><br/>

	Contrary to:<br/>
	VBScript Variables &lt;https://msdn.microsoft.com/en-us/library/t7zd6etz(v=vs.84).aspx&gt;<br/>
	<pre>
	You can also declare an array whose size changes during the time your script is running. This is called a dynamic array. The array is initially declared within a procedure using either the Dim statement or using the ReDim statement. However, for a dynamic array, no size or number of dimensions is placed inside the parentheses. 
	</pre>	
	<br/>
<% 	
Dim DimArray_InitDim(0)
Dim idxLast
%>
	Must to have 0 at start<br/>
	Dim DimArray_InitDim(0) is OK<br/>
	DimArray_InitDim LBound:  <%=LBound(DimArray_InitDim)
	%><br/>
	DimArray_InitDim UBound:  <%=UBound(DimArray_InitDim)
	%><br/>
	<br/>

<%	
	idxLast = UBound(DimArray_InitDim)
	'ReDim Preserve DimArray_InitDim(idxLast+1)

%>
	ReDim Preserve DimArray_InitDim(idxLast+1) throws an error "This array is fixed or temporarily locked" <br/>
	DimArray_InitDim LBound:  <%=LBound(DimArray_InitDim)
	%><br/>
	DimArray_InitDim UBound:  <%=UBound(DimArray_InitDim)
	%><br/>
	<br/>
<%	
'Best practice: Use ReDim AND initial dimension
ReDim DynamicArray(0)
%>
	'Best practice: Use ReDim AND initial dimension<br/>
	ReDim DynamicArray(0)<br/>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
	Assign <br/>
	<br/>
<%
DynamicArray(0) = "Zero element"	
%>
	DynamicArray(0): <%=DynamicArray(0)%></br>
	Resize ReDim Preserve DynamicArray(idxLast + 1) <br/>
<%
idxLast = UBound(DynamicArray)
ReDim Preserve DynamicArray(idxLast + 1) 
%>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
	<br/>
<%
idxLast = UBound(DynamicArray)
DynamicArray(idxLast) = "C:\Dev\aklqikdev-solution\aklqikdev-local\qik\Test\pbtech\pbtech_qik_inc.txt"	
%>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
	<br/>
<%
Dim result
	For ix = LBound(DynamicArray) to UBound(DynamicArray) 
		Response.Write "ix: " & ix & " : " 
		If Len(DynamicArray(ix)) > 0 Then 
			Response.Write  DynamicArray(ix)
		Else
			Response.Write "[Empty]"
		End If
		Response.Write "<br/>" 

	Next
%>
	Result: <%=result%>
	
</body>
</html>

