# Flutter JSON Parsing

This Flutter project demonstrates how to parse JSON data manually without using any state management or JSON POJO classes. It uses a single function to parse JSON data into a list of `AndroidVersion` objects and displays the parsed data using buttons.

## Features

- Parse JSON data from static variables.
- Display parsed JSON data using buttons.
- No state management used.
- JSON parsing done manually without using JSON POJO classes.

## Model Class

The `AndroidVersion` model class used for the parsed data:

```dart
class AndroidVersion {
  AndroidVersion({
    this.id,
    this.title,
  });

  int? id;
  String? title;
}
