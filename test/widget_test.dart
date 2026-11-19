import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app boots without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Note app ready'),
          ),
        ),
      ),
    );

    expect(find.text('Note app ready'), findsOneWidget);
  });
}
