<%
'Post data sent as x-www-form-urlencoded
dim sessionVarName
dim sessionVarValue
dim strItem

Response.Write "Request.Form --------------------------------------------------------- <BR>"
if Request.ServerVariables("REMOTE_ADDR") = Request.ServerVariables("LOCAL_ADDR") then
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        For Each strItem In Request.Form 
            Response.Write "Request.Form[" & strItem & "]: " & Request.Form(strItem) & "<BR>"
        Next 
    End If
end if

Response.Write "--------- --------------------------------------------------------- <BR>"
'Process csv from form post data (array)

        Dim rawElements, SelectedBorrowerNumbers
        rawElements = Request.Form("SoPBorrowers_3") & ""
        SelectedBorrowerNumbers = split(rawElements, ",")
		Response.Write "LBound: " & LBound(SelectedBorrowerNumbers) & " UBound: " & UBound(SelectedBorrowerNumbers) & "<BR>"
        For i=LBound(SelectedBorrowerNumbers) to UBound(SelectedBorrowerNumbers)
            Response.Write " " & SelectedBorrowerNumbers(i) & "<BR>"
        Next 


Response.Write "Request.ServerVariables --------------------------------------------------------- <BR><BR>"
For Each strItem In Request.ServerVariables 
    Response.Write "Request.ServerVariables[" & strItem & "]: " & Request.ServerVariables(strItem) & "<BR>"
Next 

%>
