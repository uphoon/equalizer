# equalizer

Interactive Flutter Equalizer Animation


펄싱 바를 시각적으로 모방하는 동적인 플러터 애플리케이션을 호스트합니다. CustomPainter와 AnimationController의 힘을 이용하여, 사용자의 상호 작용에 반응하여 간단한 탭으로 애니메이션을 시작하고 중지합니다.


## Features

+ Interactive animation toggle through user input
+ Customizable bar count and dimensions for varied visual appeal
+ Smooth and eye-catching animations with rounded stroke caps
+ Optimized animation performance for seamless user experience


## screenshot

![equalizer_1](https://github.com/uphoon/equalizer/assets/3182587/8cf226c7-58e9-4024-a28f-b38af1692eea)


## How to use

Equalizer 위젯을 사용하려면, 위젯 트리에 간단히 포함시키면 됩니다. 여기 Equalizer 위젯을 앱에 통합하는 기본 예제가 있습니다.

+ onPress: 이퀄라이저가 탭될 때 트리거되는 콜백 함수입니다.
+ isPlaying: 애니메이션을 시작하거나 멈추는 불린 값입니다. 애니메이션을 시작하려면 true로 설정하고, 멈추려면 false로 설정하세요.

```dart
...
    Equalizer(),
...
```

```dart
...
    Equalizer.event(
          onPress: () {
            print("hello equalizer");
          },
        ),
...
```

이퀄라이저를 탭하면 애니메이션의 상태(isPlaying)가 토글되며, 제공된 경우 onPress 콜백이 트리거됩니다.

```dart
...
    Equalizer.event(
            onPress: () {
                print("hello sound");
            },
            isPlaying: true,
            ),
...
```


## Understanding Equalizer.event()

```dart

    Equalizer.event({
    required Function onPress,
    bool isPlaying = false,
    Key? key,
    }) : super(key: key);

```

+ onPress: 필수 매개변수입니다. 이퀄라이저가 탭될 때 발생하는 일을 정의하는 함수를 전달해야 합니다.
+ isPlaying: 선택 매개변수입니다. 애니메이션의 초기 상태를 결정합니다. 기본값은 false입니다.


## dartpad

[![DartPad](https://github.com/uphoon/equalizer/assets/3182587/0f9ac0b2-0d90-497a-929d-b47d0d9f6bfb)](https://dartpad.dev/?id=d45563969f8b818d541ce39051decba2)


## Contributions

Contributions are welcome! If you have ideas on how to improve the animation or extend the functionality, feel free to fork the repository and submit your pull requests.

개선 아이디어가 있거나 기능을 확장하고 싶은 분들의 기여를 환영합니다! 저장소를 포크하고 풀 리퀘스트를 제출하여 자유롭게 기여해주세요.


*writed by ChatGPT*
