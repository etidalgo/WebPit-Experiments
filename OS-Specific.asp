<%@ Language=VBScript %>
<!--#include virtual="Experiments/Utils/OsUtils.asp"-->

<html>
<head>
<style>
pre{
  font-family: Consolas, Menlo, Monaco, Lucida Console, Liberation Mono, DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif;
  margin-bottom: 10px;
  overflow: auto;
  width: auto;
  padding: 5px;
  background-color: #eee;
  width: 650px!ie7;
  padding-bottom: 20px!ie7;
  max-height: 600px;
}
</style>
</head>
<body>
<% 
Sub TestCompare ( verA, verB, expected ) 
	If (CompareVersionStrings( verA, verB) <> expected) Then Response.Write "Error: CompareVersionStrings( """ & verA & """, """ & verB & """) = " & CompareVersionStrings( verA, verB) &" <br />"
End Sub

	Call DumpWmiInfo
	
	'Stop
	Call TestCompare( "1.0", "1.0", Version_EqualTo )
	Call TestCompare( "1.0", "2.0", Version_LessThan )
	Call TestCompare( "2.0", "1.0", Version_GreaterThan )
	Call TestCompare( "1.0", "1.0.0", Version_EqualTo )
	Call TestCompare( "1.0.0", "1.0", Version_EqualTo )

	Call TestCompare( "1.0.1.0", "1.0.2.0", Version_LessThan )
	Call TestCompare( "1.0.2", "1.0.1", Version_GreaterThan )
	Call TestCompare( "2.1", "1.3", Version_GreaterThan )
	Call TestCompare( "1.0.1.0", "1.0", Version_GreaterThan )

	Call TestCompare( "1.0", "1.0", Version_LessThan )
	Call TestCompare( "1.0", "2.0", Version_EqualTo )
	Call TestCompare( "2.0", "1.0", Version_EqualTo )

	
%>
<br />

tags - Display HTML code in HTML - Stack Overflow <http://stackoverflow.com/questions/2820453/display-html-code-in-html>
<br />

<div>
IF COL_LENGTH(N'Applicants', N'TaxStatus') IS NOT NULL 
BEGIN
	ALTER TABLE [dbo].[Applicants] DROP COLUMN TaxStatus;
END
GO

ALTER TABLE [dbo].[Applicants] ADD TaxStatus NVARCHAR(25) NULL;
GO
</div>

<div>
<code>
IF COL_LENGTH(N'Applicants', N'TaxStatus') IS NOT NULL 
BEGIN
	ALTER TABLE [dbo].[Applicants] DROP COLUMN TaxStatus;
END
GO

ALTER TABLE [dbo].[Applicants] ADD TaxStatus NVARCHAR(25) NULL;
GO
</code>
</div>

<div>
<pre>
IF COL_LENGTH(N'Applicants', N'TaxStatus') IS NOT NULL 
BEGIN
	ALTER TABLE [dbo].[Applicants] DROP COLUMN TaxStatus;
END
GO

ALTER TABLE [dbo].[Applicants] ADD TaxStatus NVARCHAR(25) NULL;
GO
</pre>
</div>


<div>
<pre>
<code>
IF COL_LENGTH(N'Applicants', N'TaxStatus') IS NOT NULL 
BEGIN
	ALTER TABLE [dbo].[Applicants] DROP COLUMN TaxStatus;
END
GO

ALTER TABLE [dbo].[Applicants] ADD TaxStatus NVARCHAR(25) NULL;
GO
</code>
</pre>
</div>

<div>
<blockquote>
<pre>
<code>
IF COL_LENGTH(N'Applicants', N'TaxStatus') IS NOT NULL 
BEGIN
	ALTER TABLE [dbo].[Applicants] DROP COLUMN TaxStatus;
END
GO

ALTER TABLE [dbo].[Applicants] ADD TaxStatus NVARCHAR(25) NULL;
GO
</code>
</pre>
</blockquote>
</div>

</body>
</html>