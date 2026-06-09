import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alert_widgets_flutter/main.dart';

void main() {
  testWidgets('Shows confirmation before deleting a note',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    expect(find.text('Delete note?'), findsOneWidget);
    expect(find.text('This note will be permanently removed.'), findsOneWidget);
  });

  testWidgets('Deleting a note removes it from the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(find.text('Buy groceries after work'), findsNothing);
    expect(find.text('No notes yet.'), findsOneWidget);
  });

  testWidgets('Cancelling keeps the note', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.text('Buy groceries after work'), findsOneWidget);
    expect(find.text('No notes yet.'), findsNothing);
  });
}
