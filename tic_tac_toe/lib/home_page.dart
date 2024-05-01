import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? boardSize = "3x3";

  void setBoardSize(String? size) {
    setState(() {
      boardSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RadioListTile(
              title: const Text("3x3"),
              value: "3x3",
              groupValue: boardSize,
              onChanged: (value) => setBoardSize(value)),
          RadioListTile(
              title: const Text("4x4"),
              value: "4x4",
              groupValue: boardSize,
              onChanged: (value) => setBoardSize(value)),
          RadioListTile(
              title: const Text("5x5"),
              value: "5x5",
              groupValue: boardSize,
              onChanged: (value) => setBoardSize(value)),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width - 20,
            color: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePage(boardSize: boardSize!),
                ),
              );
            },
            child: const Text("Player Vs Player"),
          ),
        ],
      ),
    );
  }
}
