PhoneGap Developer 
===
Command line utilities for PhoneGap. 

- app generation
- app packaging
- system reporting

Usage
---
	phonegap --generate path/to/MyFreshApp 
	phonegap --build path/to/MyFreshApp
	phonegap --report path/to/MyFreshApp

Options
---
	-h, --help ......... Displays help message.
	-v, --version  ..... Display the version and then exit.
	-g, --generate ..... Generates a PhoneGap application skeleton. 
	-b, --build ........ Compiles your PhoneGapp application for supported platforms.
	-r, --report ....... Generates a report for supported SDK's.
	
TODO
---
- make executable chmod +x phonegap.rb
- install phonegap source into ~/.phonegap using git if available
- make bootstrap.js useful 
- add debug and release options
- launch iphone simulator
- builds for each platform
- fix report for android and blackberry
- check for specific versions of iphone, android and bb in the report and build
- gemify
- add shoulda tests

---

Copyright (c) 2009 Brian LeRoux. Licensed under the MIT License:
http://www.opensource.org/licenses/mit-license.php
