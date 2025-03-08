String _twoDigits(int n) {
  /**
   * 将数字填充为2位，小于10的前面补0
   */
  if (n >= 10) return "$n";
  return "0$n";
}


String dateFormat([DateTime? date, String formatStr="yyyy-MM-dd hh:mm:ss"]){
  /**
   * 时间格式化为字符串
   */
  date ??= DateTime.now();
  String formattedDate =
      "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)} "
      "${_twoDigits(date.hour)}:${_twoDigits(date.minute)}:${_twoDigits(date.second)}";
  return formattedDate;
}

/**
 * 时间解析使用dart自带的DateTime.parse(?)
 */
