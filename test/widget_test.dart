library;

import 'package:flutter_test/flutter_test.dart';
import 'package:local_go/app.dart';

void main() {
  testWidgets('App renders the onboarding screen with title',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    // The onboarding screen shows "Local Go" as the app title.
    expect(find.text('Local Go'), findsOneWidget);
  });
}
