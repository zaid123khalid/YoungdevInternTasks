import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  List buttons = [
    ['C', 'CE', '/', '⌫'],
    ['7', '8', '9', 'x'],
    ['2', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['%', '0', '.', '='],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              showCursor: true,
              maxLines: 5,
            ),
            const Spacer(),
            for (int i = 0; i < buttons.length; i++)
              Row(
                children: [
                  for (int j = 0; j < buttons[i].length; j++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Material(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: MaterialButton(
                            height: 50,
                            minWidth: 50,
                            onPressed: () {
                              switch (buttons[i][j]) {
                                case 'C':
                                  _controller.text = '';
                                  break;
                                case 'CE':
                                  if (_controller.text
                                      .contains(RegExp('[-*/+]'))) {
                                    _controller.text = _controller.text
                                        .substring(
                                            0,
                                            _controller.text.lastIndexOf(
                                                    RegExp('[-*/+]')) +
                                                1);
                                  } else {
                                    _controller.text = '';
                                  }
                                  break;
                                case '⌫':
                                  _controller.text = _controller.text.substring(
                                      0, _controller.text.length - 1);
                                  break;
                                case '%':
                                  double percent =
                                      double.parse(_controller.text) / 100;
                                  var newResult = percent % 1 == 0
                                      ? percent.toInt()
                                      : percent;
                                  _controller.text = newResult.toString();

                                  break;
                                case '=':
                                  String text = _controller.text;
                                  List<String> numbers =
                                      text.split(RegExp(r'[+x/-]'));
                                  List<String> operators = text
                                      .replaceAll(RegExp(r'[0-9.]'), '')
                                      .split('');
                                  double result = double.parse(numbers[0]);
                                  for (int i = 0; i < operators.length; i++) {
                                    switch (operators[i]) {
                                      case '+':
                                        result += double.parse(numbers[i + 1]);
                                        break;
                                      case 'x':
                                        result *= double.parse(numbers[i + 1]);
                                        break;
                                      case '-':
                                        result -= double.parse(numbers[i + 1]);
                                        break;
                                      case '/':
                                        result /= double.parse(numbers[i + 1]);
                                        break;
                                    }
                                    _controller.text = result.toString();
                                  }
                                  break;
                                default:
                                  _controller.text += buttons[i][j];
                              }
                            },
                            child: Text(buttons[i][j]),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
