var _loadScript = function(path){ 
    var script= document.createElement('script');
    script.type= 'text/javascript';
    script.src= path;
	document.head.appendChild(script); 
}

 _loadScript('https://code.jquery.com/jquery-1.11.3.min.js');
