using Toybox.Application as App;

//
// Connect IQ "Moving Time" Data Field
// Paul Moore <paul@paul-moore.com>
//

//
// (c) Copyright Paul Moore, 2015
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of version 2 of the GNU General Public License as
// published by the Free Software Foundation.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

class MovingTimeApp extends App.AppBase {

	function initialize() {
		AppBase.initialize();
	}

	//! onStart() is called on application start up
	function onStart() {
	}
	
	//! onStop() is called when your application is exiting
	function onStop() {
	}
	
	//! Return the initial view of your application here
	function getInitialView() {
		return [ new MovingTimeView() ];
	}

}
