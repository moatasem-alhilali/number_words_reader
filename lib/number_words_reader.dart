library number_to_word_arabic;

import 'helper/number_arabic_reader.dart';
import 'helper/number_english_reader.dart';

class NumberWordsReader {
  /// Converts the given [number] to Arabic words.
  ///
  /// Example:
  /// ```dart
  /// var arabicResult = NumberArabicReader.convert('4500');
  /// print(arabicResult); // Output: "أربعة آلاف وخمسمائة"
  /// ```
  static String convertToArabic(number) {
    return NumberArabicReader.convert(number);
  }

  /// Converts the given [number] to English words.
  ///
  /// Example:
  /// ```dart
  /// var englishResult = NumberWords.convertToEnglish(4500);
  /// print(englishResult); // Output: "Four thousand five hundred"
  /// ```
  static String convertToEnglish(number) {
    return NumberEnglishReader.convert(number);
  }
}
