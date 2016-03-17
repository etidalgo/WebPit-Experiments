<%

'Version compare
	Const VerCompare_LessThan = -1
	Const VerCompare_EqualTo = 0
	Const VerCompare_GreaterThan = 1
	
'Operating Systems
	Const Version_PreServer2008 = 3
	Const Version_WinUnknown = 4
	Const Version_XP_2000 = 5
	Const Version_XP64_Server2003 = 52
	Const Version_Vista_Server2008 = 60
	Const Version_Server2008R2_7 = 61
	Const Version_Server2012_8 = 62
	Const Version_Server2012R2_81 = 63
	Const Version_10_Server2016 = 100
	Const Version_Future = 200
	
	
	
Sub DumpWmiInfo ()
	'vbscript - How to determine windows version from a VB script? - Stack Overflow <http://stackoverflow.com/questions/4542284/how-to-determine-windows-version-from-a-vb-script>
	'WMI Tasks: Operating Systems (Windows) <https://msdn.microsoft.com/en-us/library/aa394596(v=vs.85).aspx?cs-save-lang=1&cs-lang=vb#code-snippet-2>

	Set dtmConvertedDate = CreateObject("WbemScripting.SWbemDateTime")
	strComputer = "."
	Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
	Set oss = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem")

	For Each os in oss
		Response.Write "Boot Device: " & os.BootDevice & "<br />"
		Response.Write "Build Number: " & os.BuildNumber & "<br />"
		Response.Write "Build Type: " & os.BuildType & "<br />"
		Response.Write "Caption: " & os.Caption & "<br />"
		Response.Write "Code Set: " & os.CodeSet & "<br />"
		Response.Write "Country Code: " & os.CountryCode & "<br />"
		Response.Write "Debug: " & os.Debug & "<br />"
		Response.Write "Encryption Level: " & os.EncryptionLevel & "<br />"
		dtmConvertedDate.Value = os.InstallDate
		dtmInstallDate = dtmConvertedDate.GetVarDate
		Response.Write "Install Date: " & dtmInstallDate  & "<br />"
		Response.Write "Licensed Users: " & os.NumberOfLicensedUsers & "<br />"
		Response.Write "Organization: " & os.Organization & "<br />"
		Response.Write "OS Language: " & os.OSLanguage & "<br />"
		Response.Write "OS Product Suite: " & os.OSProductSuite & "<br />"
		Response.Write "OS Type: " & os.OSType & "<br />"
		Response.Write "Primary: " & os.Primary & "<br />"
		Response.Write "Registered User: " & os.RegisteredUser & "<br />"
		Response.Write "Serial Number: " & os.SerialNumber & "<br />"
		Response.Write "Version: " & os.Version & "<br />"
	Next

	Set dtmConvertedDate = Nothing
	Set objWMIService = Nothing
	Set oss = Nothing
	
End Sub

Function GetOsVersion()

	'vbscript - How to determine windows version from a VB script? - Stack Overflow <http://stackoverflow.com/questions/4542284/how-to-determine-windows-version-from-a-vb-script>
	'WMI Tasks: Operating Systems (Windows) <https://msdn.microsoft.com/en-us/library/aa394596(v=vs.85).aspx?cs-save-lang=1&cs-lang=vb#code-snippet-2>

	Set dtmConvertedDate = CreateObject("WbemScripting.SWbemDateTime")
	strComputer = "."
	Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
	Set oss = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem")

	For Each os in oss
		GetOsVersion = os.Version
	Next

	Set dtmConvertedDate = Nothing
	Set objWMIService = Nothing
	Set oss = Nothing
	
End Function 'GetOsVersion

Function CompareVersion( verA, verB )
	CompareVersion = CompareVersionStrings(verA, verB, false)
End Function 'CompareVersion

' File Version Compare Code <http://makemsi-manual.dennisbareis.com/file_version_compare_code.htm>
'isUseShorterIndex 
Function CompareVersionStrings( verA, verB, isUseShorterIndex )
	CompareVersionStrings = VerCompare_EqualTo

	'-------- Split up the version numbers ------------------------------
	dim VerBitsF1 : VerBitsF1 = split(verA, ".")
	dim VerBitsF2 : VerBitsF2 = split(verB, ".")

	'-------- How many "bits" are there (use largest of the two) --------
	dim LastIndex : LastIndex = ubound(VerBitsF1)
	if  ( ubound(VerBitsF2) > LastIndex Xor isUseShorterIndex ) then
		LastIndex = ubound(VerBitsF2)
	end if	

	'-------- Work through each of the bits (probably 4) ----------------
	dim i
	for i = 0 to LastIndex
		'--- Work out the 2 "bits" to compare (use "0" on shorter versions) ---
		dim BitF1, BitF2
		if  i <= ubound(VerBitsF1) then BitF1 = VerBitsF1(i) else BitF1 = ""
		if  i <= ubound(VerBitsF2) then BitF2 = VerBitsF2(i) else BitF2 = ""
		if  BitF1 = "" then  BitF1 = "0"        'May as well be paranoid...
		if  BitF2 = "" then  BitF2 = "0"

		'-------- Compare the values (exit when mismatch found) ---------
		if  cint(BitF1) > cint(BitF2) then
			CompareVersionStrings = VerCompare_GreaterThan
		else
			if  cint(BitF1) < cint(BitF2) then
				CompareVersionStrings = VerCompare_LessThan
			end if
		end if
		if CompareVersionStrings <> VerCompare_EqualTo then exit for
	next
	
End Function 'CompareVersionStrings

Function GetWindowsVersion()
	OsVersion = GetOsVersion()
	
	GetWindowsVersion = Version_PreServer2008
	If CompareVersionStrings( OsVersion, "6.0", true ) = VerCompare_EqualTo Then  GetWindowsVersion = Version_PreServer2008
	If CompareVersionStrings( OsVersion, "6.1", true ) = VerCompare_EqualTo Then  GetWindowsVersion = Version_Server2008R2_7
	If CompareVersionStrings( OsVersion, "6.2", true ) = VerCompare_EqualTo Then  GetWindowsVersion = Version_Server2012_8
	If CompareVersionStrings( OsVersion, "6.3", true ) = VerCompare_EqualTo Then  GetWindowsVersion = Version_Server2012R2_81
	If CompareVersionStrings( OsVersion, "10.0", true ) = VerCompare_EqualTo Then  GetWindowsVersion = Version_10_Server2016
	If CompareVersionStrings( OsVersion, "10.0", true ) = VerCompare_GreaterThan Then  GetWindowsVersion = Version_Future

End Function

%>

