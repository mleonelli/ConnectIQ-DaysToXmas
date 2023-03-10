import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;

class DaysToChristmasDFView extends WatchUi.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = WatchUi.loadResource(Rez.Strings.DataFieldLabel);
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        // See Activity.Info in the documentation for available information.
        var today = new Time.Moment(Time.today().value());
        var todayInfo = Gregorian.info(today, Time.FORMAT_SHORT);
        
        var year = todayInfo.year;
        if (todayInfo.month == 12 && todayInfo.day > 25) {
        	year = year+1;
        }
        
        var xmas = Gregorian.moment({
		    :year   => year,
		    :month  => 12,
		    :day    => 25
		});
		var moment = xmas.subtract(today).divide(60).divide(60).divide(24);
        return moment.value();
        
    }

}