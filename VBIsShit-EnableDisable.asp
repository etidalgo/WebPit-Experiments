<%@ Language=VBScript %>
<%
	'Server side variables
	Dim sv_isLender, sv_LenderName
	sv_isLender = false
	sv_LenderName = "Efhan Hill"
%>
<html>
<head>

	<script type="text/javascript">
	// Set client side js vars based on server asp vars. 
	
	var cv_isLender = <% if (sv_isLender) THEN Response.Write "true" ELSE Response.Write "false" %>; 
	var cv_isLender2 = <% Call ToJsBool(sv_isLender) %>; 
	
	// This doesn't work, puts 'False'
	// var cv_isLender2 = <%=sv_isLender%>;
	var cv_LenderName = "<%=sv_LenderName%>"; // literals need quotes
	
	// Using plain js to understand concepts
	function enableLenderView( isEnabled ) {
		//debugger;
		var elems = document.getElementsByClassName('lenderView');
		var ix;
		for (ix = 0; ix < elems.length; ++ix) {
			if (isEnabled) {
				elems[ix].removeAttribute('disabled');
			} else {
				elems[ix].setAttribute('disabled', 'disabled');
			}
		}
	}

	function enableConsultantView( isEnabled ) {
		
		var elems = document.getElementsByClassName('consultantView');
		var ix;
		for (ix = 0; ix < elems.length; ++ix) {
			if (isEnabled) {
				elems[ix].removeAttribute('disabled');
			} else {
				elems[ix].setAttribute('disabled', 'disabled');
			}
		}
	}

	window.onload = function() {
		enableLenderView( cv_isLender );
		document.getElementById("lenderName").value = cv_LenderName;
	}
	</script>
</head>
<body>

	<div><input type="text" class="lenderView" id="lenderName" value="alpha" /></div>
	<div><input type="text" class="lenderView" id="lenderId" value="beta"/></div>
	<div><input type="text" class="consultantView" id="consultantName" value="gamma"/></div>
	<div><input type="text" class="consultantView" id="consultantId" value="delta"/></div>

	<div><input type="button" id="enableLender" value="Enable Lender" onclick="enableLenderView(true);" /></div>
	<div><input type="button" id="disableLender" value="Disable Lender" onclick="enableLenderView(false);" /></div>
	<div><input type="button" id="enableConsultant" value="Enable Consultant" onclick="enableConsultantView(true);" /></div>
	<div><input type="button" id="disableConsultant" value="Disable Consultant" onclick="enableConsultantView(false);" /></div>

</body>
</html>
<%
Sub ToJsBool(val) 
	If (val) THEN Response.Write "true" ELSE Response.Write "false" End If
End Sub
%>
