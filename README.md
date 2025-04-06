# Long Press Animation Button

[![pub package](https://img.shields.io/pub/v/long_press_animation_button.svg)](https://pub.dev/packages/long_press_animation_button)

The `long_press_animation_button` package for Flutter is designed that implement **loading buttons** activated by long-press gestures with **animation**.

<p align="center">
  <img src="https://raw.githubusercontent.com/mithun1st/long-press-animation-button/master/example/screenshots/animation.gif" width="200" alt="example">
</p>



## Getting started

> Add the package to your `pubspec.yaml` file:
```yaml
dependencies:
  long_press_animation_button: <latest version>
```

> Import the Package:
```dart
import 'package:long_press_animation_button/long_press_animation_button.dart';
```

> Implement Widget:
```dart
LongPressAnimationButton(
    onLongPress: () => print('Click !'),
    child: Text("Long Press Animation Button"),
),
```


## Usage

> Create a String variable:
```dart
String _text = 'ready for checkout';
```
> View Data of String Variable:
```dart
Text(
    _text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
    ),
),
```

> Implement Long Press Animation Button:
```dart
LongPressAnimationButton(
  onTap:
      () => setState(() {
        _text = 'Long Press To Checkout.\n-- onTap() --';
      }),
  onLongPressCancel:
      () => setState(() {
        _text = 'Checkout Cancel !\n-- onLongPressCancel() --';
      }),
  onLongPress:
      () => setState(() {
        _text = 'CHECKOUT SUCCESS :)\n-- onLongPress() --';
      }),

  height: 80,
  width: 200,
  backgroundColor: Colors.tealAccent,
  loadingColor: Colors.yellow,
  borderRadius: 12,
  border: Border.all(width: 4, color: Colors.orange),

  child: Text(
    'Checkout',
    style: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.brown,
    ),
  ),
),
```


## Limitation

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :----: |
|   ✅    | ✅  |  ✅   |   ✅   |  ✅   |   ✅   |


## Additional information

`long_press_animation_button` plugin is developed by [Mahadi Hassan](https://www.linkedin.com/in/mithun1st/)
> mithun.2121@yahoo.com | [LinkedIn](https://www.linkedin.com/in/mithun1st/) | [GitHub](https://www.github.com/mithun1st/) | [Website](https://mithun1st.blogspot.com/)
