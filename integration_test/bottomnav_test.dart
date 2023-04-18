import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_hunter/features/initial_pages/onboarding_screen.dart';

void main() {
  testWidgets('Test tapping bottom nav items', (WidgetTester tester) async {
    // Wait for the splash screen to disappear
    await tester.pump(const Duration(seconds: 3));

    // Build the OnboardingScreen
    await tester
        .pumpWidget(MaterialApp(home: OnboardingScreen(key: UniqueKey())));

    // Verify that the first onboarding screen is displayed
    expect(find.text('Discover Your Favourite Games'), findsOneWidget);

    // Tap the Next button
    await tester.tap(find.byKey(const Key('nextButtonKey')));
    await tester.pumpAndSettle();

    // Verify that the second onboarding screen is displayed
    expect(find.text('Get Free Games'), findsOneWidget);

    // Tap the Done button
    await tester.tap(find.byKey(const Key('doneButtonKey')));
    await tester.pumpAndSettle();

    for (int i = 0; i < 4; i++) {
      await tester.pump(const Duration(seconds: 2));
      // Tap the Trending Trending Screen
      await tester.tap(find.byIcon(Icons.trending_up_outlined));
      await tester.pumpAndSettle();
      expect(find.text('High Rated MetaCritic Games'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));

      // Tap the Profile BottomNavigationBarItem
      await tester.tap(find.byIcon(Icons.perm_identity));
      await tester.pumpAndSettle();
      expect(find.text('Sample Account'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));
      // Tap the Home BottomNavigationBarItem
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
      expect(find.text('Cari'), findsOneWidget);
    }
  });
}
