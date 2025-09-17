import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedTextKit - Demo G1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimatedTextKitDemo(),
    );
  }
}

class AnimatedTextKitDemo extends StatefulWidget {
  const AnimatedTextKitDemo({super.key});

  @override
  State<AnimatedTextKitDemo> createState() => _AnimatedTextKitDemoState();
}

class _AnimatedTextKitDemoState extends State<AnimatedTextKitDemo> {
  int currentIndex = 0;

  late final List<_ExamplePage> pages = [
    const _ExamplePage(
      title: 'TypewriterAnimatedText',
      description: 'Efeito máquina de escrever.',
      child: _TypewriterExample(),
    ),
    const _ExamplePage(
      title: 'TyperAnimatedText',
      description: 'Digita palavras de forma contínua.',
      child: _TyperExample(),
    ),
    const _ExamplePage(
      title: 'ColorizeAnimatedText',
      description: 'Gradiente de cores correndo sobre o texto.',
      child: _ColorizeExample(),
    ),
    const _ExamplePage(
      title: 'FadeAnimatedText',
      description: 'Texto aparecendo/desaparecendo suavemente.',
      child: _FadeExample(),
    ),
    const _ExamplePage(
      title: 'ScaleAnimatedText',
      description: 'Anima o texto aumentando/diminuindo a escala.',
      child: _ScaleExample(),
    ),
    const _ExamplePage(
      title: 'RotateAnimatedText',
      description: 'Rotaciona entre várias palavras/frases.',
      child: _RotateExample(),
    ),
  ];

  void nextPage() {
    setState(() {
      currentIndex = (currentIndex + 1) % pages.length;
    });
  }

  void prevPage() {
    setState(() {
      currentIndex = (currentIndex - 1 + pages.length) % pages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacote: animated_text_kit'),
      ),
      body: Center(child: page),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: prevPage,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Anterior'),
            ),
            Text('${currentIndex + 1} / ${pages.length}'),
            ElevatedButton.icon(
              onPressed: nextPage,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExamplePage extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const _ExamplePage({
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: t.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(description, style: t.bodyLarge, textAlign: TextAlign.center),
          const SizedBox(height: 32),
          child,
        ],
      ),
    );
  }
}

/// ---------- EXEMPLOS PRÁTICOS ----------

class _TypewriterExample extends StatelessWidget {
  const _TypewriterExample();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(milliseconds: 800),
      animatedTexts: [
        TypewriterAnimatedText(
          'Olá ... 👋',
          speed: const Duration(milliseconds: 90),
          textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
          cursor: '|',
        ),
        TypewriterAnimatedText(
          'Este é o Typewriter...',
          speed: const Duration(milliseconds: 70),
          textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 32,
              ),
        ),
      ],
    );
  }
}

class _TyperExample extends StatelessWidget {
  const _TyperExample();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: true,
      totalRepeatCount: 2,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      animatedTexts: [
        TyperAnimatedText(
          'Rápido e direto.',
          speed: const Duration(milliseconds: 80),
          textStyle: const TextStyle(fontSize: 32),
        ),
        TyperAnimatedText(
          'Perfeito para slogans.',
          textStyle: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}

class _FadeExample extends StatelessWidget {
  const _FadeExample();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        FadeAnimatedText('Simples.', textStyle: const TextStyle(fontSize: 32)),
        FadeAnimatedText('Suave.', textStyle: const TextStyle(fontSize: 32)),
        FadeAnimatedText('Legível.', textStyle: const TextStyle(fontSize: 32)),
      ],
    );
  }
}

class _ColorizeExample extends StatelessWidget {
  const _ColorizeExample();

  @override
  Widget build(BuildContext context) {
    final colorizeColors = [Colors.purple, Colors.blue, Colors.yellow, Colors.red];
    final colorizeTextStyle = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
    );

    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText('Colorize!', textStyle: colorizeTextStyle, colors: colorizeColors),
        ColorizeAnimatedText('Destaque visual', textStyle: colorizeTextStyle, colors: colorizeColors),
      ],
    );
  }
}

class _ScaleExample extends StatelessWidget {
  const _ScaleExample();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ScaleAnimatedText(
          'Zoom in/out',
          scalingFactor: 0.2,
          textStyle: const TextStyle(fontSize: 32),
          duration: const Duration(milliseconds: 5000),
        ),
      ],
    );
  }
}

class _RotateExample extends StatelessWidget {
  const _RotateExample();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        RotateAnimatedText('Rápido', textStyle: TextStyle(fontSize: 32)),
        RotateAnimatedText('Fácil', textStyle: TextStyle(fontSize: 32)),
        RotateAnimatedText('Eficiente', textStyle: TextStyle(fontSize: 32)),
      ],
    );
  }
}
