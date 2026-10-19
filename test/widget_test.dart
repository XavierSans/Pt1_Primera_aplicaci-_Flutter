import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('generates a new word pair and can favorite it',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(BigCard), findsOneWidget);
    expect(find.text('No favorites yet.'), findsNothing);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Like'));
    await tester.pump();
    expect(
      find.descendant(
        of: find.widgetWithText(ElevatedButton, 'Like'),
        matching: find.byIcon(Icons.favorite),
      ),
      findsOneWidget,
    );

    await tester.tap(find.widgetWithText(ElevatedButton, 'Next'));
    await tester.pump();
    expect(find.byType(BigCard), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
  });
}
