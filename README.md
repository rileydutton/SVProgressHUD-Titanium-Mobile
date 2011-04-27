# SVProgessHUD-Titanium-Mobile

## Description

This is a simple port of the SVProgressHUD iOS library to Titanium Mobile. 
You can simply include it as a module in your Titanium project, and use a 
few basic commands to get a great-looking progress indicator.

## Installation (Pre-Compiled)

**These are instructions for those of you who just want to use the library without modifying it in your own project.**

Create a new folder called `modules` in the root directory of your Titanium Project. Create a subfolder of the `modules` directory called `ios`. Download and extract `svprojecthud-0.1.zip` into that directory. Refer to the Usage section below for information on actually using the library in your application.

## Installation (Source)

Clone the git repository or download it as a zip/tar file. You should then be able to open the `xcodeproj` and compile the project. Refer to (the module documentation)[http://wiki.appcelerator.org/display/guides/Module+Developer+Guide+for+iOS] if you need more information on how to create/edit/compile/distribute Titanium Mobile modules.

## Usage

	// open a single window
	var window = Ti.UI.createWindow({
		backgroundColor:'white'
	});
	var label = Ti.UI.createLabel();
	window.add(label);
	window.open();

	//Include the module.

	var svprogresshud = require('com.svprogresshud');

	//You must create a view that holds the progress indicator. The easiest thing to do is to add this to your main app window.
	//The indicator *should* automatically take care of putting itself on top of other views/windows, although this has not ben extensively tested.

	var indicator = svprogresshud.createView();

	window.add(indicator);

	//Show the HUD with a status message. You can also choose to show a Network Indicator (default is true).

	indicator.showHUD({status: "Test", showNetwork: true});

	setTimeout(function() {
	
		//Update the status text of the currently shown indicator.
	
		indicator.setStatus("Step 2");
	},	3000);

	setTimeout(function() {
	
		//Dismiss the current indicator, with an optional status message. Also choose to show an error icon (error: true) or a success icon (error: false)
	
		indicator.dismissHUD({error: false, status: "Complete!"});
	}, 6000);

	setTimeout(function() {
		indicator.showHUD({status: "Going", showNetwork: false});
	}, 9000);

	setTimeout(function() {
		indicator.dismissHUD({status: "Gone!", error: true});
	}, 12000);

## License

This work is licensed under an MIT License. Please note, however, that like the original SVProgressHUD this repository contains two images from the excellent Glyphish icon set. They are licensed under their own terms, visit the Glyphish website for more information about them.