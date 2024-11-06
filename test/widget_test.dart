import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Substitua pelo caminho correto do seu arquivo main.dart

void main() {
  testWidgets('Adiciona e lista filmes', (WidgetTester tester) async {
    // Construa o aplicativo e acione um frame.
    await tester.pumpWidget(MyApp());

    // Verifique se o AppBar com o título está presente.
    expect(find.text('Filmes Assistidos'), findsOneWidget);

    // Verifique se o botão de adicionar filmes está presente.
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Toque no botão de adicionar filmes.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Aguarde a navegação para a nova página.

    // Verifique se o título da página de adicionar filmes está presente.
    expect(find.text('Adicionar Filme'), findsOneWidget);

    // Insira um título de filme e comentários.
    await tester.enterText(find.byType(TextField).first, 'Inception');
    await tester.enterText(find.byType(TextField).last, 'Great movie');

    // Toque no botão para adicionar o filme.
    await tester.tap(find.text('Adicionar'));
    await tester.pumpAndSettle(); // Aguarde a navegação de volta à página inicial.

    // Verifique se o filme foi adicionado à lista.
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('Great movie'), findsOneWidget);
  });
}
