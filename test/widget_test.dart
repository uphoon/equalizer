// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:equalizer/main.dart';

void main() {
  testWidgets('Animation start smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Equalizer());
    await tester.pumpWidget(Equalizer.event(
      onPress: () {
        print("hello world");
      },
    ));
    await tester.pumpWidget(Equalizer.event(
      onPress: () {
        print("hello world");
      },
      isPlaying: true,
    ));

    // Verify that our Equalizer is animating.
    expect(find.byType(Equalizer), findsOneWidget);
    await tester.tap(find.byType(Equalizer));
    await tester.pump();
  });
}
