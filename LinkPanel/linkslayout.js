function CreateLink( displayText, link ) {
	if ( displayText.length <= 0 ) {
		displayText = " ... ";
	} else if ( displayText.length > 16 ) {
		displayText= displayText.substring(0, 16) + " ... ";
	}
// jquery - How do I create a link using javascript? - Stack Overflow <http://stackoverflow.com/questions/4772774/how-do-i-create-a-link-using-javascript>
	var a = document.createElement('a');
	var linkText = document.createTextNode(displayText);
	a.appendChild(linkText);
	a.title = displayText;
	a.href = link;
	a.className = 'tiLink';
	return a;
}

function AddLink( parent, displayText, link ) {
// jquery - How do I create a link using javascript? - Stack Overflow <http://stackoverflow.com/questions/4772774/how-do-i-create-a-link-using-javascript>
	parent.appendChild(CreateLink(displayText, link));
}

function CreatePanel()
{

}

function DisplaySites( webSite ) {
}
// for...in - JavaScript | MDN <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in>

function CreateBaseColumn( columnHeaderFields, rowArray ){
	var table = document.createElement("table");
	var tableBody = document.createElement("tbody");
	table.appendChild(tableBody);
	var headerRow = document.createElement("tr");
	
 	var headerText = document.createTextNode("");	
	var cell = document.createElement("td");  
	cell.appendChild(headerText);
	headerRow.appendChild( cell );

	rowArray.push(headerRow);
	tableBody.appendChild(headerRow);
	
	for (var webPath in columnHeaderFields) {

		// table row creation
		var row = document.createElement("tr");

		// create element <td> and text node 
		//Make text node the contents of <td> element
		// put <td> at end of the table row
		var cell = document.createElement("td");    
		var cellText = document.createTextNode(webPath); 

		cell.appendChild(cellText);
		row.appendChild(cell);
		rowArray.push(row);

		//row added to end of table body
		tableBody.appendChild(row);
	}
	return table;
}

function AddColumn(table, rowArray, webBaseLabel, webBase, pathMap) {
	var ix = 0;
	headerRow = rowArray[0];
 	var headerText = document.createTextNode(webBaseLabel);	
	var cell = document.createElement("td");  
	cell.appendChild(headerText);
	headerRow.appendChild( cell );
	ix++;
	for (var webPath in pathMap) {
		var newLink = webBase + '/' + pathMap[webPath];
		var cellLink = CreateLink( pathMap[webPath], newLink);

		var cell = document.createElement("td");  
		cell.appendChild(cellLink);
		var row = document.createElement("tr");
		rowArray[ix].appendChild(cell);
		ix++;
	}
}

function CreateLinksTable() {
	var rowArray = [];
	var table = CreateBaseColumn(tiPathMap, rowArray);
	document.body.appendChild(table);

	for (var webBase in tiWebBase) {
		AddColumn(table, rowArray, webBase, tiWebBase[webBase], tiPathMap);
	}
}

function CreateLinksTableBasic() {
	for (var webBase in tiWebBase) {
		var linkGroup = document.createElement('div');
		linkGroup.classList.add('links');
		linkGroup.classList.add('panel');
		document.body.appendChild(linkGroup);
		var title = document.createElement('div');
		title.classList.add('links');
		title.classList.add('title');
		title.innerText = webBase;
		linkGroup.appendChild( title );

		for (var webPath in tiPathMap) {
		  var linkDiv = document.createElement('div');
		  linkDiv.classList.add('tiLink');
		  linkGroup.appendChild(linkDiv);
		  var newLink = tiWebBase[webBase] + '/' + tiPathMap[webPath];
		  AddLink( linkDiv, webPath, newLink ); 
		}
		linkGroup.appendChild( document.createElement('br'));
	}
}
