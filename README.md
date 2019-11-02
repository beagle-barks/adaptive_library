# adaptive_library

A set of Widgets that create a native look and feel on iOS and Android.

Flutter already gives us a great library for Material and Cupertino widgets.
But as a cross platform tool, Flutter does *not* provide a good way of displaying the right widgets at the right place.

*adaptive_library* crashes in and... *here it is!* 

## Getting Started

To get started, import the package to your app, after [getting the package](https://pub.dev/packages/adaptive_library).

```dart
import 'package:adaptive_library/adaptive_library.dart';
```

## The widgets

Our library currently includes 7 widgets that can be used to create a native look and feel on iOS and Android devices.
There are more in the future, so stay tuned.

### Important things in advance

adaptive_library uses the concept of `InheritedWidget` to get access to the current platform. This makes sure that you do not need to reenter `Platform.isAndroid || Platform.isIOS` or whatever, every time you need a widget. And yes, "Fluttering" is done by widgets.

### AdaptiveInheritance