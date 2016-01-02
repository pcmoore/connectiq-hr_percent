using Toybox.WatchUi as Ui;

//
// Connect IQ HR Percentage Data Field
// Paul Moore <paul@paul-moore.com>
//

//
// (c) Copyright Paul Moore, 2016
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

class HRPercentView extends Ui.SimpleDataField {

	var hr_max;

	// NOTE: we can't currently get HR max or zone info from the Connect IQ API
	//       so we are stuck with the usual estimates for now

	//! Set the label of the data field here.
	function initialize() {
		var profile;
		var age;

		SimpleDataField.initialize();
		label = Ui.loadResource(Rez.Strings.field_label);

		// NOTE: calculations based on "Age adjusted" from below URL
		//       -> http://www.runningforfitness.org/faq/hrmax
		profile = UserProfile.getProfile();
		age = (1970 - profile.birthYear) + (Time.now().value() / 31536000);
		if (profile.gender == UserProfile.GENDER_FEMALE) {
			hr_max = 226 - age;
		} else {
			hr_max = 220 - age;
		}
	}

	//! The given info object contains all the current workout
	//! information. Calculate a value and return it in this method.
	function compute(info) {
		var hr_percent;

		// only update if we actually have a heart rate
		if (info.currentHeartRate == null) {
			return;
		}

		hr_percent = info.currentHeartRate.toFloat() / hr_max * 100;

		return hr_percent.format("%3d") + "%";
	}

}
