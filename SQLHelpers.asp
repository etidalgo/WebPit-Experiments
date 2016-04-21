<%

'Wraps around classes that have Public Clauses() and Public NumRecords
'Assumes string. Object arrays will to use 'set' command. 
Class EnumeratorTemplate

	Private m_Array
    Private m_Idx

    Private Sub Class_Initialize()		
        m_Idx = 0
    End Sub

    Private Sub Class_Terminate()
		set m_Array	= Nothing
    End Sub
	
	Public Sub Init( objArray )
		set m_Array = objArray
		m_Idx = 0
	End Sub
	
	Function Current()
		
	End Function
	
	Function Next()
	End Function
End Class

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