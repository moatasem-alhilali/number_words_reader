library number_words_reader;

/// A class to convert numbers to Arabic or English words.
class NumberWordsReader {
  /// Converts the given [number] to Arabic words.
  ///
  /// Example:
  /// ```dart
  /// var arabicResult = NumberWords.convertToArabic(4500);
  /// print(arabicResult); // Output: "أربعة آلاف وخمسمائة"
  /// ```
  static String convertToArabic(int number) {
    if (number == 0) {
      return 'صفر';
    }

    var units = [
      '',
      'ألف',
      'مليون',
      'مليار',
      'تريليون',
      'كوادريليون',
      'كوينتيليون'
    ];

    var result = '';
    var unitIndex = 0;

    while (number > 0) {
      var currentSegment = number % 1000;
      if (currentSegment != 0) {
        if (result.isNotEmpty) {
          result = ' و $result';
        }
        result =
            "${_convertSegmentToArabicWords(currentSegment)} ${units[unitIndex]}$result";
      }

      number ~/= 1000; // Divide by 1000 to move to the next segment
      unitIndex++;
    }

    return result.trim();
  }

  /// Converts a three-digit [segment] to Arabic words.
  ///
  /// Example:
  /// ```dart
  /// var result = NumberWords._convertSegmentToArabicWords(123);
  /// print(result); // Output: "مئة وثلاثة وعشرون"
  /// ```
  static String _convertSegmentToArabicWords(int segment) {
    if (segment == 0) {
      return '';
    }

    var ones = [
      '',
      'واحد',
      'اثنان',
      'ثلاثة',
      'أربعة',
      'خمسة',
      'ستة',
      'سبعة',
      'ثمانية',
      'تسعة'
    ];
    var tens = [
      '',
      'عشرة',
      'عشرون',
      'ثلاثون',
      'أربعون',
      'خمسون',
      'ستون',
      'سبعون',
      'ثمانون',
      'تسعون'
    ];

    var result = '';

    // Extract ones, tens, and hundreds places
    var onesPlace = segment % 10;
    var tensPlace = (segment % 100) ~/ 10;
    var hundredsPlace = segment ~/ 100;

    if (hundredsPlace > 0) {
      result += '${ones[hundredsPlace]} مئة';
      if (tensPlace > 0 || onesPlace > 0) {
        result += ' و ';
      }
    }

    if (tensPlace > 1) {
      result += tens[tensPlace];
      if (onesPlace > 0) {
        result += ' و ';
      }
    } else if (tensPlace == 1) {
      if (segment % 100 != 10) {
        result += 'عشر';
        if (onesPlace > 0) {
          result += ' و ';
        }
      } else {
        result += 'عشرون';
      }
    }

    if (onesPlace > 0) {
      result += ones[onesPlace];
    }

    return result;
  }

  /// Converts the given [number] to English words.
  ///
  /// Example:
  /// ```dart
  /// var englishResult = NumberWords.convertToEnglish(4500);
  /// print(englishResult); // Output: "Four thousand five hundred"
  /// ```
  static String convertToEnglish(int number) {
    if (number == 0) {
      return 'Zero';
    }

    var result = '';
    var unitIndex = 0;

    while (number > 0) {
      var currentSegment = number % 1000;
      if (currentSegment != 0) {
        if (result.isNotEmpty) {
          result = ' and $result';
        }
        result =
            "${_convertSegmentToEnglishWords(currentSegment)}${_getEnglishUnit(unitIndex)}$result";
      }

      number ~/= 1000; // Divide by 1000 to move to the next segment
      unitIndex++;
    }

    return result.trim();
  }

  /// Converts a three-digit [segment] to English words.
  ///
  /// Example:
  /// ```dart
  /// var result = NumberWords._convertSegmentToEnglishWords(123);
  /// print(result); // Output: "One hundred and twenty-three"
  /// ```
  static String _convertSegmentToEnglishWords(int segment) {
    if (segment == 0) {
      return '';
    }

    var ones = [
      '',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine'
    ];
    var teens = [
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen'
    ];
    var tens = [
      '',
      '',
      'Twenty',
      'Thirty',
      'Forty',
      'Fifty',
      'Sixty',
      'Seventy',
      'Eighty',
      'Ninety'
    ];

    var result = '';

    // Extract ones, tens, and hundreds places
    var onesPlace = segment % 10;
    var tensPlace = (segment % 100) ~/ 10;
    var hundredsPlace = segment ~/ 100;

    if (hundredsPlace > 0) {
      result += '${ones[hundredsPlace]} Hundred';
      if (tensPlace > 0 || onesPlace > 0) {
        result += ' and ';
      }
    }

    if (tensPlace == 1) {
      result += teens[onesPlace];
    } else if (tensPlace > 1) {
      result += tens[tensPlace];
      if (onesPlace > 0) {
        result += '-';
      }
    }

    if (tensPlace != 1 && onesPlace > 0) {
      result += ones[onesPlace];
    }

    return result;
  }

  /// Gets the English unit based on the [unitIndex].
  ///
  /// Example:
  /// ```dart
  /// var result = NumberWords._getEnglishUnit(2);
  /// print(result); // Output: "Thousand"
  /// ```
  static String _getEnglishUnit(int unitIndex) {
    var units = [
      '',
      'Thousand',
      'Million',
      'Billion',
      'Trillion',
      'Quadrillion',
      'Quintillion'
    ];

    return units[unitIndex];
  }
}
