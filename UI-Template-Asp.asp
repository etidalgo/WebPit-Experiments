<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>
      HTML Form Elements
		</title>
	</head>
	<body>
		<form name="HTMLFormElements" action="ui-template-asp.asp" method="post" id="HTMLFormElements">
			<table border="1" cellpadding="5">
				<!-- ...in a big HTML table. -->
				<tr>
					<td>
            Username:<br />
						<input type="text" name="username" size="15" />
					</td>
				</tr>
				<tr>
					<td>
            Password:<br />
						<input type="password" name="password" size="15" />
					</td>
				</tr>
				<tr>
					<td>
            TextArea Comment:<br />
						<textarea cols="40" name="comments" rows="6">Comments...</textarea>
					</td>
				</tr>
				<tr>
					<td>
			  Date field:<br />
						<input type="text" name="dateField" />
					</td>
				</tr>
				<tr>
					<td>
            Filename:<br />
						<input type="file" name="filename" size="35" />
						<input type="hidden" name="hiddenField" value=
            "Hidden Field Value" />
					</td>
				</tr>
				<tr>
					<td>
            Checkbox Items:<br />
						<input type="checkbox" name="checkboxes[]" value=
            "cb1" />Checkbox 1 
						<input type="checkbox" name="checkboxes[]"
            value="cb2" />Checkbox 2 
						<input type="checkbox" name=
            "checkboxes[]" value="cb3" checked="checked" />Checkbox 3
					</td>
				</tr>
				<tr>
					<td>
            Radio Items:<br />
						<input type="radio" name="radioval" value="rd1" />radio 1
						<input type="radio" name="radioval" value="rd2" checked=
            "checked" />radio 2 
						<input type="radio" name="radioval" value="rd3" />radio 3
					</td>
				</tr>
				<tr>
					<td>
            Multiple Select Values<br />
						<select multiple="multiple" name="multipleselect[]"
            size="4">
							<option value="ms1">
                Selection Item 1
							</option>
							<option value="ms2">
                Selection Item 2
							</option>
							<option value="ms3">
                Selection Item 3
							</option>
							<option value="ms4" selected="selected">
                Selection Item 4
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
            Dropdown:<br />
						<select name="dropdown">
							<option value="dd1">
                Drop Down Item 1
							</option>
							<option value="dd2">
                Drop Down Item 2
							</option>
							<option value="dd3" selected="selected">
                Drop Down Item 3
							</option>
							<option value="dd4">
                Drop Down Item 4
							</option>
							<option value="dd5">
                Drop Down Item 5
							</option>
							<option value="dd6">
                Drop Down Item 6
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="reset" name="submitbutton" value=
            "cancel" /> 
						<input type="submit" name="submitbutton"
            value="submit" />
					</td>
				</tr>
			</table>
		</form>
<%
dim fname
fname=Request.Form("username")
If fname<>"" Then
       Response.Write("Hello " & fname & "!")
End If
Dim dateValue 
dateValue = Request.Form("dateField")&""

If Request.Form.Count > 0 Then 
	Dim MyDate, formattedDate
		If IsDate(CDate(dateValue)) Then
			MyDate = CDate(dateValue)
		End If
		formattedDate = FormatDateTime(MyDate, vbGeneralDate)
		Response.Write formattedDate & "<br>"
		
		Response.Write ToSqlDateFormat( MyDate )
End If

'-- vbis function
Function ToSqlDateFormat( aDate ) 
    ToSqlDateFormat = Year(aDate) & "-" & _
    Right("0" & Month(aDate),2)  & "-" & _
    Right("0" & Day(aDate),2)  
End Function

	%>		
	</body>
</html>
