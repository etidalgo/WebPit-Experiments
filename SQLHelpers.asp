<%

'-----------------------------------------
Class ClauseBuilder
	Public Clauses()
	Public NumRecords
	
    '-------------------------
    Private Sub Class_Initialize()		
        NumRecords = 0
    End Sub

    Private Sub Class_Terminate()
    End Sub

	Function Add( clause )
		Dim newRecord

		ReDim Preserve Clauses(NumRecords) 'NumRecords is 0-based
		Clauses(NumRecords) = clause
		NumRecords = NumRecords + 1

	End Function	

	Function List( connector ) 
		Dim clauseStr
		clauseStr = ""
		
		if ( NumRecords > 0 ) Then clauseStr = Clauses(0)
        Dim i
	    For i = 1 To NumRecords -1
			clauseStr = clauseStr & connector & Clauses(i)
	    Next

		List = clauseStr
	End Function
	
End Class


%>