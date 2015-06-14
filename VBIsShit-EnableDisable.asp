<%@ Language=VBScript %>
<%
	'Server side variables
	Dim sv_isLender
	sv_isLender = false
%>
<html>
<head>
	<script type="text/javascript">
	// Set client side js vars based on server asp vars. 
	var cv_isLender = <% if (sv_isLender) Then Response.Write "true" ELSE Response.Write "false" %>;
	
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
	}
	</script>
</head>
<body>

<div><input type="text" class="lenderView" id="textbox1" value="alpha" /></div>
<div><input type="text" class="lenderView" id="textbox2" value="beta"/></div>
<div><input type="text" class="consultantView" id="textbox3" value="gamma"/></div>
<div><input type="text" class="consultantView" id="textbox4" value="delta"/></div>

<div><input type="button" id="enableLender" value="Enable Lender" onclick="enableLenderView(true);" /></div>
<div><input type="button" id="disableLender" value="Disable Lender" onclick="enableLenderView(false);" /></div>
<div><input type="button" id="enableConsultant" value="Enable Consultant" onclick="enableConsultantView(true);" /></div>
<div><input type="button" id="disableConsultant" value="Disable Consultant" onclick="enableConsultantView(false);" /></div>
</body>
</html>
