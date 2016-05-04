<%@ Language=VBScript %>


<html>
	<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	
        <style type="text/css">
    div#alertMsgOverlay,
    div#confirmMsgOverlay,
    div#processing,
    div#okCheckDataConfirmMsgOverlay,
    div#LiabNoneMsgOverlay,
    div#verifyingMsgOverlay,
    dov#IsJointConfirmMsgOverlay {position:fixed !important;}		
		
.ConfirmMsgBox {
    width: 440px;
    height: 220px;
    border: 1px solid #ccc;
    background-color: #f3f3f3;
    position: absolute;
    top: -10px;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    padding: 0 10px;
}

    .ConfirmMsgBox p {
        font-size: 12px;
        float: left;
        width: 100%;
        line-height: 1.25em;
        height: auto;
        margin: 0;
    }

    .ConfirmMsgBox h2 {
        font-size: 16px;
        color: #003962;
        margin-bottom: 5px;
    }

    .ConfirmMsgBox span.btn {
        margin: 10px 5px 5px 0px;
        display: inline-block;
    }

		
		</style>
	
		<script type="text/javascript" >

			function setAlertBox(h, w, ph, strMsg, strFld){                
				$("#alertMsgOverlay").fadeIn();
				$("#alertMsgBox").css("height",h).css("width",w);
				$("#alertMsgBox img.pshadow").css("width","100%");
				$("#alertMsgBody").css("height",ph).html(strMsg);
				$("#Hid_AlertFocus").val(strFld);
			}

			function setConfirmBox(h, w, ph, strMsg, strFld){                
				$("#confirmMsgOverlay").fadeIn();
				$("#confirmMsgBox").css("height",h).css("width",w);
				$("#confirmMsgBox img.pshadow").css("width","100%");
				$("#confirmMsgBody").css("height",ph).html(strMsg);
				$("#Hid_AlertFocus").val(strFld);
			}
		
			function ShowConfirm() {
			}
		</script>
	</head>
	<body>

                <!-- *** Alert Message Overlay ***************** -->
                <div id="alertMsgOverlay" class="bgFix" style="position:absolute; top:0; left:0; height:100%; width:100%; text-align:center; z-index:9999; display:none;">

                    <div id="alertMsgBox" class="MsgBox" style="">

                        <h2 id="alertMsgTitle"><i class="fa fa-warning" style="font-size: 26px;"></i></h2>

                        <p id="alertMsgBody"></p>

                        <span id="closeAlertOverlay" class="btn" style="">Close</span>
                
                    </div>

                </div> <!-- end of Alert Message Overlay -->


                <!-- *** Confirm Message Overlay ***************** -->
                <div id="confirmMsgOverlay" class="bgFix" style="position:absolute; top:0; left:0; height:100%; width:100%;  text-align:center; z-index:9999; display:none; ">

                    <div id="confirmMsgBox" class="MsgBox" style="">

                        <h2 id="confirmMsgTitle">Confirmation</h2>

                        <p id="confirmMsgBody"></p>

                        <span id="okConfirmOverlay" class="btn" style="">Yes</span>&nbsp;&nbsp;&nbsp;

                        <span id="closeConfirmOverlay" class="btn" style="">No</span>
                
                    </div>

                </div> <!-- end of Alert Message Overlay -->
				
				<button type="button" onclick="ShowConfirm()">Show Confirm</button>
	
	</body>
</html>

