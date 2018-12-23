import 'package:flutter_test/flutter_test.dart';
import 'package:pajarogram/post_item.dart';
import 'package:flutter/material.dart';


void main() {
  testWidgets('Renders list of posts', (WidgetTester tester) async {
    // Build our app and trigger a frame.
//    await tester.pumpWidget(const MaterialApp(
//      home: PostItem(),
//    ));

    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('A new bird is on tha hood'), findsNWidgets(2));
  });
}