using Toybox.WatchUi as Ui;

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

class MovingTimeView extends Ui.SimpleDataField {

	var time_timer;
	var time_hours;
	var time_mins;
	var time_secs;
	var time_fmt;

	//! Set the label of the data field here.
	function initialize() {
		SimpleDataField.initialize();
		label = Ui.loadResource(Rez.Strings.field_label);
		time_hours = 0;
		time_mins = 0;
		time_secs = 0;
		time_fmt = "00:00";
	}

	//! The given info object contains all the current workout
	//! information. Calculate a value and return it in this method.
	function compute(info) {

		// only update if the activity is actively running
		if (info.timerTime == null || info.timerTime == time_timer) {
			return time_fmt;
		}
		time_timer = info.timerTime;

		// only update the data if we are currently moving
		if (info.currentSpeed == null || info.currentSpeed == 0) {
			return time_fmt;
		}

		// NOTE: we assume that we execute one each second, additional
		//       logic will be needed if that is not the case

		// update the time counters
		time_secs++;
		if (time_secs >= 60) {
			time_mins++;
			time_secs = 0;
		}
		if (time_mins >= 60) {
			time_hours++;
			time_mins = 0;
		}

		// format the time counter into a string format
		time_fmt = time_mins.format("%02d") + ":" +
			   time_secs.format("%02d");
		if (time_hours > 0) {
			time_fmt = time_hours.format("%02d") + ":" + time_fmt;
		}

		return time_fmt;
	}

}
