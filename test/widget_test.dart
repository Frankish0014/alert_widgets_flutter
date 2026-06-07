import 'package:flutter_test/flutter_test.dart';

import 'package:alert_widgets_flutter/main.dart';

void main() {
  testWidgets('Shows confirmation popup when delete is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Delete Item'));
    await tester.pumpAndSettle();

    expect(find.text('Delete item?'), findsOneWidget);
    expect(
      find.text('Are you sure you want to delete this item? This cannot be undone.'),
      findsOneWidget,
    );
  });

  testWidgets('Confirm proceeds with the action', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Delete Item'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    expect(find.text('Item deleted.'), findsOneWidget);
  });

  testWidgets('Cancel stops the action', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Delete Item'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.text('Action cancelled.'), findsOneWidget);
  });
}
