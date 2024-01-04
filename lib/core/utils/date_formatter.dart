abstract class DateFormatter {
  static String formatDateMmDDYYYY(DateTime date) {
    final String month = _getMonthName(date);
    final int day = date.day;
    final int year = date.year;
    return "$month $day $year";
  }

  static String _getMonthName(DateTime date) {
    switch (date.month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "July";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";

      default:
        return "Bad";
    }
  }
}
