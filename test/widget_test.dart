import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alert_widgets_flutter/main.dart';

void main() {
  testWidgets('Shows confirmation before deleting a note',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.delete_outline).first);
    await tester.pumpAndSettle();

    expect(find.text('Delete note?'), findsOneWidget);
    expect(find.text('This note will be permanently removed.'), findsOneWidget);
  });

  testWidgets('Deleting a note removes it from the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.delete_outline).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('delete'));
    await tester.pumpAndSettle();

    expect(
      find.text('Buy groceries after today mobile dev lesson'),
      findsNothing,
    );
    expect(find.text('Submit assignment by Friday'), findsOneWidget);
  });

  testWidgets('Cancelling keeps the note', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.delete_outline).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(
      find.text('Buy groceries after today mobile dev lesson'),
      findsOneWidget,
    );
    expect(find.text('Submit assignment by Friday'), findsOneWidget);
  });
}
