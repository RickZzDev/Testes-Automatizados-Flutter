// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:studyingTestsAuto/main.dart';
import 'package:studyingTestsAuto/mocks/mockTest.dart';
import 'package:studyingTestsAuto/pages/todoPage.dart';

void main() {
  testWidgets("Deve navegar para outra página", (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: MyHomePage(),
        navigatorObservers: [mockObserver],
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    verify(mockObserver.didPush(any, any));

    expect(find.byType(TodoList), findsOneWidget);
  });

  test("Deve somar", () async {
    const a = 2;
    const b = 5;
    const valorEsperado = 10;

    expect(testFunction(a, b), valorEsperado);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  //Procurando texto dentro da tela
  testWidgets("I have to found the word testing", (WidgetTester teste) async {
    await teste.pumpWidget(MyApp());
    expect(find.text("Testing"), findsOneWidget);
  });

  // Procurar por uma instancia de um widget especifico
  testWidgets("Finding for an widget instance ", (WidgetTester tester) async {
    final childWidget = SizedBox();
    await tester.pumpWidget(Container(
      child: childWidget,
    ));
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  // Testando o To Do List
  testWidgets("Tem que adicionar e ap agar o item da lista",
      (WidgetTester tester) async {
    //Carrega o widget
    await tester.pumpWidget(TodoList());

    //Digita texto na caixa
    await tester.enterText(find.byType(TextField), "Nova To do");

    //Pressiona o botao para adicionar
    await tester.tap(find.byIcon(Icons.add));

    //Recarrega a tela
    await tester.pump();

    //Teste em si
    expect(find.text("Nova To do"), findsOneWidget);

    //Dirliza
    await tester.drag(find.text("Nova To do"), Offset(500.0, 0.0));

    //Recarrega e espera o fim da animação
    await tester.pumpAndSettle();

    //testando se foi apagado
    expect(find.text("Nova To do"), findsNothing);
  });
}
