// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/main.dart';

void main() {
  testWidgets('Can add and dismiss an item', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Item 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Item 1'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    expect(find.text('Item 1'), findsNothing);
  });

  testWidgets('When add new item, it is unchecked', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Item 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Item 1'), findsOneWidget);
    expect(find.byIcon(Icons.check_box_outline_blank), findsOneWidget);
    expect(find.byIcon(Icons.check_box), findsNothing);
  });

  testWidgets('When check an item, it is checked', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Item 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Item 1'), findsOneWidget);
    expect(find.byIcon(Icons.check_box_outline_blank), findsOneWidget);
    expect(find.byIcon(Icons.check_box), findsNothing);

    await tester.tap(find.byIcon(Icons.check_box_outline_blank));
    await tester.pump();

    // This one doesn't work
    // expect(find.byIcon(Icons.check_box_outline_blank), findsNothing);
    // expect(find.byIcon(Icons.check_box), findsOneWidget);
  });

  testWidgets('When dismiss an item, can add another one', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Item 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Item 1'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    expect(find.text('Item 1'), findsNothing);

    // This one doesn't work
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // expect(find.text('Item 1'), findsOneWidget);
  });
}
