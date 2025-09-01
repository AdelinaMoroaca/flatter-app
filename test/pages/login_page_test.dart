import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/pages/login_page.dart';

void main() {
  Widget makeTestableWidget() {
    return const MaterialApp(home: LoginPage());
  }

  testWidgets('LoginPage initial UI state', (tester) async {
    await tester.pumpWidget(makeTestableWidget());
    expect(find.text('Login'), findsOneWidget);
    expect(find.text("Don't have an account? Register"), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));  
  });

  testWidgets('Toggle to Register shows Full Name field', (tester) async {
    await tester.pumpWidget(makeTestableWidget());

    await tester.tap(find.text("Don't have an account? Register"));
    await tester.pumpAndSettle();

    expect(find.text('Register'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));  
    expect(find.widgetWithText(TextFormField, 'Full Name'), findsOneWidget);
  });

  testWidgets('Validates empty fields on submit', (tester) async {
    await tester.pumpWidget(makeTestableWidget());
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });

  testWidgets('Validates email format', (tester) async {
    await tester.pumpWidget(makeTestableWidget());

    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'bademail');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '123456');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
  });

  testWidgets('Validates password length', (tester) async {
    await tester.pumpWidget(makeTestableWidget());

    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '123');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
  });

  testWidgets('Validates Full Name on Register', (tester) async {
    await tester.pumpWidget(makeTestableWidget());

    // toggle la Register
    await tester.tap(find.text("Don't have an account? Register"));
    await tester.pumpAndSettle();

    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '123456');
    await tester.tap(find.text('Register'));
    await tester.pump();

    expect(find.text('Full Name is required'), findsOneWidget);
  });
}
