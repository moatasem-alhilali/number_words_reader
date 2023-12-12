# Number Words Reader

A Flutter package for converting numbers to Arabic and English words.

To use this package, add `number_words_reader` as a dependency in your `pubspec.yaml` file.

# Installation

```yaml
dependencies:
  number_words_reader: ^1.0.0
```

Then, run flutter pub get to fetch the package.

# import

```dart
import 'package:number_words_reader/number_words_reader.dart';
```

# Usage Arabic

```dart

void main() {
   NumberWordsReader.convertToArabic(4500);
  // Output: "أربعة آلاف وخمسمائة"
}
```

#### :small_orange_diamond: Usage English

```dart

void main() {

  NumberWordsReader.convertToEnglish(4500);
  // Output: "Four thousand five hundred"

  NumberWordsReader.convert(55);
  //Output:'fifty-five'

  NumberWordsReader.convert(100000);
  //Output:'one hundred thousand'

  NumberWordsReader.convert(13578921);
  //Output:'thirteen million five hundred seventy-eight thousand nine hundred twenty-one'

  NumberWordsReader.convert(123456789);
  //Output:'one hundred twenty-three million four hundred fifty-six thousand seven hundred eighty-nine'

}
```

Contributing
Feel free to contribute to this package by opening issues or submitting pull requests on the GitHub repository.

License
This package is licensed under the MIT License - see the LICENSE file for details.

Feel free to contribute to this package by opening issues or submitting pull requests on the [GitHub repository](https://github.com/moatasem-alhilali/number_words_reader).
