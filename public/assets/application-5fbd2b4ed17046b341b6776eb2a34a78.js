// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
= require jquery
//= require jquery_ujs
//= require_tree .
function getClock() {
	var today = new Date();
	var wkday = dayToWord(today.getDay());
	var day = today.getDate();
	var month = monthToWord(today.getMonth());
	var year = today.getFullYear();
	var hour = today.getHours();
	var meridian = (hour > 12) ? "PM" : "AM";
	var min = today.getMinutes();
	var sec = today.getSeconds();
// add a zero in front of numbers<10
	min=checkTime(min);
	sec=checkTime(sec);
	hour = twelvehr(today.getHours());
	document.getElementById('footer').innerHTML = "Today is " + wkday + ", " + month + " " + day + ", " + year + " at " + hour + ":" + min + ":" + sec + " " + meridian + ".";
	t=setTimeout(function(){getClock()},500);
}

function checkTime(i) {
	if (i<10)
	  {
	  i="0" + i;
	  }
	return i;
}

function twelvehr(h) {
	return h%12
}

function dayToWord(n) {
	var day;
	switch (n) {
		case 0:
			day = "Sunday";
			break;
		case 1:
			day = "Monday";
			break;
		case 2:
			day = "Tuesday";
			break;
		case 3:
			day = "Wednesday";
			break;
		case 4:
			day = "Thursday";
			break;
		case 5:
			day = "Friday";
			break;
		case 6:
			day = "Saturday";
			break;
	}
	return day;
}

function monthToWord(n) {
	var month;
	switch (n) {
		case 0:
			month = "January";
			break;
		case 1:
			month = "February";
			break;
		case 2:
			month = "March";
			break;
		case 3:
			month = "April";
			break;
		case 4:
			month = "May";
			break;
		case 5:
			month = "June";
			break;
		case 6:
			month = "July";
			break;
		case 7:
			month = "August";
			break;
		case 8:
			month = "September";
			break;
		case 9:
			month = "October";
			break;
		case 10:
			month = "November";
			break;
		case 11:
			month = "December";
			break;
	}
	return month;
}
;
