import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/test/test_screen.dart';

void main() {
 testWidgets('My Widget has Title and Message', (tester) async {
   await tester.pumpWidget(const TestScreen(title: 'title', message: 'message'));
   final title  = find.text('title');
   final message  = find.text('message');

   expect(title, findsOneWidget);
   expect(message, findsOneWidget);
 });
}