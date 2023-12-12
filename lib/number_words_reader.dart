library number_to_word_arabic;

import 'package:number_words_reader/number_arabic.dart';
import 'package:number_words_reader/number_english.dart';

class NumberWordsReader {
  /// Converts the given [number] to Arabic words.
  ///
  /// Example:
  /// ```dart
  /// var arabicResult = NumberArabicReader.convert('4500');
  /// print(arabicResult); // Output: "أربعة آلاف وخمسمائة"
  /// ```
  static String convertToArabic(String number) {
    return NumberArabic.convert(number);
  }

  /// Converts the given [number] to English words.
  ///
  /// Example:
  /// ```dart
  /// var englishResult = NumberWords.convertToEnglish(4500);
  /// print(englishResult); // Output: "Four thousand five hundred"
  /// ```
  static String convertToEnglish(number) {
    return NumberEnglish.convert(number);
  }
}
