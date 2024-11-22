import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f1_game/main.dart';
  // Import the main.dart file where Formula1TriviaApp is defined

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build your app and trigger a frame.
    await tester.pumpWidget(const Formula1TriviaApp());

    // Verify that your counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that your counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
