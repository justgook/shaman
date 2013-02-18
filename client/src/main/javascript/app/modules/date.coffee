###*
____________________________________________________________________________
    Mask       Description
----------------------------------------------------------------------------
d          | Day of the month as digits; no leading zero for single-digit days.
dd         | Day of the month as digits; leading zero for single-digit days.
ddd        | Day of the week as a three-letter abbreviation.
dddd       |  Day of the week as its full name.
m          |  Month as digits; no leading zero for single-digit months.
mm         |  Month as digits; leading zero for single-digit months.
mmm        |  Month as a three-letter abbreviation.
mmmm       |  Month as its full name.
yy         |  Year as last two digits; leading zero for years less than 10.
yyyy       |  Year represented by four digits.
h          |  Hours; no leading zero for single-digit hours (12-hour clock).
hh         |  Hours; leading zero for single-digit hours (12-hour clock).
H          |  Hours; no leading zero for single-digit hours (24-hour clock).
HH         |  Hours; leading zero for single-digit hours (24-hour clock).
M          |  Minutes; no leading zero for single-digit minutes. Uppercase M unlike CF timeFormat's m to avoid conflict with months.
MM         |  Minutes; leading zero for single-digit minutes. Uppercase MM unlike CF timeFormat's mm to avoid conflict with months.
s          |  Seconds; no leading zero for single-digit seconds.
ss         |  Seconds; leading zero for single-digit seconds.
l or L     |  Milliseconds. l gives 3 digits. L gives 2 digits.
t          |  Lowercase, single-character time marker string: a or p. No equivalent in CF.
tt         |  Lowercase, two-character time marker string: am or pm. No equivalent in CF.
T          |  Uppercase, single-character time marker string: A or P. Uppercase T unlike CF's t to allow for user-specified casing.
TT         |  Uppercase, two-character time marker string: AM or PM. Uppercase TT unlike CF's tt to allow for user-specified casing.
Z          |  US timezone abbreviation, e.g. EST or MDT. With non-US timezones or in the Opera browser, the GMT/UTC offset is returned, e.g. GMT-0500 No equivalent in CF.
o          |  GMT/UTC timezone offset, e.g. -0500 or +0230. No equivalent in CF.
S          |  The date's ordinal suffix (st, nd, rd, or th). Works well with d. No equivalent in CF.
'…' or "…" |  Literal character sequence. Surrounding quotes are removed. No equivalent in CF.
UTC:       |  Must be the first four characters of the mask. Converts the date from local time to UTC/GMT/Zulu time before applying the mask. The "UTC:" prefix is removed. No equivalent in CF.

________________________________________________________________________
     Name                  Mask                         Example
------------------------------------------------------------------------
default        | ddd mmm dd yyyy HH:MM:ss     | Sat Jun 09 2007 17:46:21
shortDate      | m/d/yy                       | 6/9/07
mediumDate     | mmm d, yyyy                  | Jun 9, 2007
longDate       | mmmm d, yyyy                 | June 9, 2007
fullDate       | dddd, mmmm d, yyyy           | Saturday, June 9, 2007
shortTime      | h:MM TT                      | 5:46 PM
mediumTime     | h:MM:ss TT                   | 5:46:21 PM
longTime       | h:MM:ss TT Z                 | 5:46:21 PM EST
isoDate        | yyyy-mm-dd                   | 2007-06-09
isoTime        | HH:MM:ss                     | 17:46:21
isoDateTim     | yyyy-mm-dd'T'HH:MM:ss        | 2007-06-09T17:46:21
isoUtcDateTime | UTC:yyyy-mm-dd'T'HH:MM:ss'Z' | 2007-06-09T22:46:21Z

###
define () ->
  token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g
  timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g
  timezoneClip = /[^-+\dA-Z]/g
  namedFormats =
    "default": "ddd mmm dd yyyy HH:MM:ss",
    shortDate: "m/d/yy",
    mediumDate: "mmm d, yyyy",
    longDate: "mmmm d, yyyy",
    fullDate: "dddd, mmmm d, yyyy",
    shortTime: "h:MM TT",
    mediumTime: "h:MM:ss TT",
    longTime: "h:MM:ss TT Z",
    isoDate: "yyyy-mm-dd",
    isoTime: "HH:MM:ss",
    isoDateTime: "yyyy-mm-dd'T'HH:MM:ss",
    isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
  dateFormat_i18n =
    dayNames: [
      "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
      "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
    ],
    monthNames: [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
      "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November",
      "December"
    ]

  ###*
   * Format Date Objet To string
   * @param {Date} date of week
   * @param {String} Format Format of date
   * @return {String} formated date string
  ###
  FormatDate = (date, format) ->
#    console.log date
    ###*
    * Format Date Objet To string
    * @param {Date|String|Int} date date objet or string of date or timpestamp
    * @return {Date}
    ###
  ParseDate = (date) ->
#    console.log date
    new Date(date)

  class ShamanWeek #extends Array
    constructor: (date = new Date) ->
      first =  1 - (date.getDay() || 7)
      currDate = new Date()
      returner = (new ShamanDate(currDate.setDate(date.getDate() + num)) for num in [first..6 + first])
      returner.next = @next
      return returner
    next: () ->
      console.log @[0]
  #.getDate()
  #      new ShamanWeek


  class ShamanDate extends Date
    _date = new Date
    format = namedFormats["default"]
    constructor: (date) ->
      _date = ParseDate(date or new Date)
    format: () ->
    toString: () =>
      "to string convertation"
    week: () =>
      (new ShamanWeek _date)


  ShamanDate


###*
  DateHelper =
    settings:
      #using for generating date
      firstDay = 1 # Sun = 0, Mon = 1 ...
    format: (date) ->
      FormatDate ParseDate(date)

    #*
     * Funtion to create array of week
     * @param {Date} date of week
     * @return {Array} array of 7 dates of week
    #
    week: (date = new Date()) ->
      #TODO add check for first day
      first =  1 - (date.getDay() || 7)
      currDate = new Date()
      (new Date(currDate.setDate(date.getDate() + num)) for num in [first..6 + first])
  DateHelper
###