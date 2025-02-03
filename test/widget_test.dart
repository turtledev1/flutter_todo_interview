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
}
