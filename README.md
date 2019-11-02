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

***Most of the time, you can replace the base class name of a widget with the ones from this library. You do not need to rename or remove parameters; though at some points you eventually need to add one parameter***
*(This makes adaptive_library great, huh?)*

### Important things in advance

adaptive_library uses the concept of `InheritedWidget` to get access to the current platform. This makes sure that you do not need to reenter `Platform.isAndroid || Platform.isIOS` or whatever, every time you need a widget. And yes, "Fluttering" is done by widgets, so this would be... nah. ;)

### AdaptiveInheritance

`AdaptiveInheritance` is the core class. Every adaptive widget needs it, because it defines the Platform "state" (-> Android or iOS).

```dart
AdaptiveInheritance(
      adaptiveState: AdaptiveState.Cupertino,
      child: AdaptiveApp(
          //
      ),
    );
```

Typically, AdaptiveInheritance is the parent of the whole app. It enabled the functionality to reload all the widgets that are based on Platform state at the same time.

`adaptiveState` is set by an enum containing the fields; ***and if you want to set it dynamically, simply call `AdaptiveInheritance.getStateByPlatform()`***.
This method uses Dart's io package to find out which Platform the app is currently running on, providing the correct AdaptiveState.


In this example, the direct child is AdaptiveApp, that combines `MaterialApp` and `CupertinoApp`.

### AdaptiveApp

```dart
AdaptiveApp(
        home: HomeScreenPage(),
      )
```

Use this do enable Material or Cupertino design for your app.
Like the "originals", you can set parameters like `debugShowCheckedModeBanner` and `home` to define you App.
The full list of parameters are growing, and can be inspected in the class.


### AdaptiveButton