import 'package:intl/intl.dart';

class Util{
  static String appId = "5d477a5e279d9e2e6fdacf4ffd3eae70";

  // For converting the date into human readable form.
  static String getFormattedDate(DateTime dateTime){
    return DateFormat("EEE, MMM d, y").format(dateTime);
  }

  static String getFormattedTime(DateTime dateTime){
    return DateFormat("Hm").format(dateTime);
  }
}

