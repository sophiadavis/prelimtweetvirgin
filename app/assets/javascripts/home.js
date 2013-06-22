// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

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
	$("#footer").html("Today is " + wkday + ", " + month + " " + day + ", " + year + " at " + hour + ":" + min + ":" + sec + " " + meridian + ".");
	
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

var Spinner = {
  SPINNER_ID: '_spinner',
  prefix: (navigator.userAgent.indexOf('WebKit') != -1) ? 'webkit' : 'moz',
  getSpinner: function(size, numberOfBars, color) {
    if (document.getElementById(this.SPINNER_ID) == null) {
      var style = document.createElement('style');
      style.setAttribute('id', this.SPINNER_ID);
      style.innerHTML = '@-'+this.prefix+'-keyframes fade {from {opacity: 1;} to {opacity: 0.25;}}';
      document.getElementsByTagName('head')[0].appendChild(style);
    }
    var spinner = document.createElement('div');
    spinner.style.width = size;
    spinner.style.height = size;
    spinner.style.position = 'relative';
    var rotation = 0;
    var rotateBy = 360 / numberOfBars;
    var animationDelay = 0;
    var frameRate = 1 / numberOfBars;
    for (var i = 0; i < numberOfBars; ++i) {
      var bar = document.createElement('div');
      spinner.appendChild(bar);
      bar.style.width = '12%';
      bar.style.height = '26%';
      bar.style.background = color;
      bar.style.position = 'absolute';
      bar.style.left = '44.5%';
      bar.style.top = '37%';
      bar.style.opacity = '1';
      bar.style.setProperty('-'+this.prefix+'-border-radius', '50px', null);
      bar.style.setProperty('-'+this.prefix+'-box-shadow', '0 0 3px rgba(0,0,0,0.2)', null);
      bar.style.setProperty('-'+this.prefix+'-animation', 'fade 1s linear infinite', null);
      bar.style.setProperty('-'+this.prefix+'-transform', 'rotate('+rotation+'deg) translate(0, -142%)', null);
      bar.style.setProperty('-'+this.prefix+'-animation-delay', animationDelay + 's', null);
      rotation += rotateBy;
      animationDelay -= frameRate;
    }
    return spinner;
  }
}