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
Dim DimArray_NoIinitialDimension()
%>
	Dim DimArray_NoInitialDimension() <br/>
	DimArray_NoInitialDimension LBound: LBound(DimArray_NoInitialDimension) causes an error <%'=LBound(DimArray_NoInitialDimension)
	%><br/>
	DimArray_NoInitialDimension UBound: UBound(DimArray_NoInitialDimension) causes an error <%'=UBound(DimArray_NoInitialDimension)
	%><br/>

	Contrary to:<br/>
	VBScript Variables &lt;https://msdn.microsoft.com/en-us/library/t7zd6etz(v=vs.84).aspx&gt;<br/>
	<pre>
	You can also declare an array whose size changes during the time your script is running. This is called a dynamic array. The array is initially declared within a procedure using either the Dim statement or using the ReDim statement. However, for a dynamic array, no size or number of dimensions is placed inside the parentheses. 
	</pre>	
<% 	
Dim DimArray_InitialDimension(0)
%>
	Must to have 0 at start<br/>
	Dim DimArray_InitialDimension(0) is OK<br/>
	DimArray_InitialDimension LBound:  <%=LBound(DimArray_InitialDimension)
	%><br/>
	DimArray_InitialDimension UBound:  <%=UBound(DimArray_InitialDimension)
	%><br/>

<%	

ReDim DynamicArray(0)
Dim idxLast
%>
	ReDim is OK too and also must have 0 or some dimension value<br/>
	ReDim DynamicArray(0)<br/>
	DynamicArray LBound: <%=LBound(DynamicArray)%><br/>
	DynamicArray UBound: <%=UBound(DynamicArray)%><br/>
	Assign <br/>
<%
DynamicArray(0) = "Zero element"	
%>
	DynamicArray(0): <%=DynamicArray(0)%></br>
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

