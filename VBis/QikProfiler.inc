


<%

Dim IntervalStart(100), IntervalEnd(100), IntervalTag(100), IntervalIndex
Dim IntervalCapture

Sub ProfilerEnd()
	Response.Clear
	For IntervalIndex = 0 To UBound(IntervalStart)
	 Response.Write IntervalIndex & " - " & IntervalTag(IntervalIndex) & " - " & (IntervalEnd(IntervalIndex) - IntervalStart(IntervalIndex)) & "<br/>"
	Next
	Response.End
End Sub 'ProfilerEnd


Sub StartInterval(ix, tag)
	IntervalTag(ix) = tag
	IntervalStart(ix) = Timer
End Sub

Sub EndInterval(ix)
	IntervalEnd(ix) = Timer
End Sub

%>