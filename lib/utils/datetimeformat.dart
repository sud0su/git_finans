import 'dart:convert';

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Senin", "2" : "Selasa", "3" : "Rabu", "4" : "Kamis", "5" : "Jumat", "6" : "Sabtu", "7" : "Minggu" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "Mai", "6" : "Jun", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  String day = date.day.toString().length < 2
      ? '0${date.day.toString()}'
      : date.day.toString();

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      day +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}
