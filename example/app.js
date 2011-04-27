// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

//Include the module.

var svprogresshud = require('com.svprogresshud');
Ti.API.info("module is => " + svprogresshud);

//You must create a view that holds the progress indicator. The easiest thing to do is to add this to your main app window.
//The indicator *should* automatically take care of putting itself on top of other views/windows, although this has not ben extensively tested.

var foo = svprogresshud.createView();

window.add(foo);

//Show the HUD with a status message. You can also choose to show a Network Indicator (default is true).

foo.showHUD({status: "Test", showNetwork: true});

setTimeout(function() {
	
	//Update the status text of the currently shown indicator.
	
	foo.setStatus("Step 2");
},	3000);

setTimeout(function() {
	
	//Dismiss the current indicator, with an optional status message. Also choose to show an error icon (error: true) or a success icon (error: false)
	
	foo.dismissHUD({error: false, status: "Complete!"});
}, 6000);

setTimeout(function() {
	foo.showHUD({status: "Going", showNetwork: false});
}, 9000);

setTimeout(function() {
	foo.dismissHUD({status: "Gone!", error: true});
}, 12000);