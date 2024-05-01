import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.boardSize});

  final String boardSize;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String currentPlayer = "X";
  List<String>? board;
  int boardSize = 3;
  int player1Score = 0;
  int player2Score = 0;

  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    boardSize = int.parse(widget.boardSize.split("x")[0]);
    board = List.filled((boardSize) * (boardSize), "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text("Tic Tac Toe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Player 1: X\nScore: $player1Score",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  "Player 2: O\nScore: $player2Score",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: board!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: boardSize),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (isGameOver) {
                        return;
                      }
                      if (board![index] == "") {
                        setState(() {
                          board![index] = currentPlayer;
                          currentPlayer = currentPlayer == "X" ? "O" : "X";
                          bool isWinner = false;
                          if (boardSize == 3) {
                            isWinner = checkWinner3x3();
                          } else if (boardSize == 4) {
                            isWinner = checkWinner4x4();
                          } else if (boardSize == 5) {
                            isWinner = checkWinner5x5();
                          }
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(board![index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkWinner3x3() {
    for (int i = 0; i < boardSize; i++) {
      if (board![i] == board![i + 3] &&
          board![i + 3] == board![i + 6] &&
          board![i] == board![i + 6] &&
          board![i] != "") {
        showWinDialog(winner: board![i]);
        return true;
      }
    }

    for (int i = 0; i < boardSize * boardSize; i += boardSize) {
      if (board![i] == board![i + 1] &&
          board![i + 1] == board![i + 2] &&
          board![i] == board![i + 2] &&
          board![i] != "") {
        showWinDialog(winner: board![i]);
        return true;
      }
    }

    if (board![0] == board![4] &&
        board![4] == board![8] &&
        board![0] == board![8] &&
        board![0] != "") {
      showWinDialog(winner: board![0]);
      return true;
    }
    if (board![2] == board![4] &&
        board![4] == board![6] &&
        board![2] == board![6] &&
        board![2] != "") {
      showWinDialog(winner: board![2]);
      return true;
    }
    if (!board!.contains("")) {
      showWinDialog(draw: "draw");
      return "draw";
    }
    return false;
  }

  checkWinner4x4() {
    for (int i = 0; i < boardSize; i++) {
      if (board![i] == board![i + 4] &&
          board![i] == board![i + 8] &&
          board![i] == board![i + 12] &&
          board![i + 4] == board![i + 8] &&
          board![i + 4] == board![i + 12] &&
          board![i + 8] == board![i + 12] &&
          board![i] != "") {
        showWinDialog(winner: board![i]);
        return true;
      }
    }

    for (int i = 0; i < boardSize * boardSize; i += boardSize) {
      if (board![i] == board![i + 1] &&
          board![i] == board![i + 2] &&
          board![i] == board![i + 3] &&
          board![i + 1] == board![i + 2] &&
          board![i + 1] == board![i + 3] &&
          board![i + 2] == board![i + 3] &&
          board![i] != "") {
        showWinDialog(winner: board![i]);
        return true;
      }
    }
    if (board![0] == board![5] &&
        board![5] == board![10] &&
        board![10] == board![15] &&
        board![0] == board![10] &&
        board![0] == board![15] &&
        board![5] == board![15] &&
        board![0] != "") {
      showWinDialog(winner: board![0]);
      return true;
    }
    if (board![3] == board![6] &&
        board![6] == board![9] &&
        board![9] == board![12] &&
        board![3] == board![9] &&
        board![3] == board![12] &&
        board![6] == board![12] &&
        board![3] != "") {
      showWinDialog(winner: board![3]);
      return true;
    }
    if (!board!.contains("")) {
      showWinDialog(draw: "draw");
      return true;
    }
    return false;
  }

  checkWinner5x5() {
    for (int i = 0; i < boardSize; i++) {
      if (board![i] == board![i + 5] &&
          board![i] == board![i + 10] &&
          board![i] == board![i + 15] &&
          board![i] == board![i + 20] &&
          board![i + 5] == board![i + 10] &&
          board![i + 5] == board![i + 15] &&
          board![i + 5] == board![i + 20] &&
          board![i + 10] == board![i + 15] &&
          board![i + 10] == board![i + 20] &&
          board![i + 15] == board![i + 20] &&
          board![i] != "") {
        showWinDialog(winner: board![i]);
        return true;
      }
    }

    for (int i = 0; i < boardSize * boardSize; i += boardSize) {
      if (board![i] == board![i + 1] &&
          board![i] == board![i + 2] &&
          board![i] == board![i + 3] &&
          board![i] == board![i + 4] &&
          board![i + 1] == board![i + 2] &&
          board![i + 1] == board![i + 3] &&
          board![i + 1] == board![i + 4] &&
          board![i + 2] == board![i + 3] &&
          board![i + 2] == board![i + 4] &&
          board![i + 3] == board![i + 4] &&
          board![i] != "") {
        showWinDialog(winner: board![i]);
        return true;
      }
    }
    if (board![0] == board![6] &&
        board![0] == board![12] &&
        board![0] == board![18] &&
        board![0] == board![24] &&
        board![6] == board![12] &&
        board![6] == board![18] &&
        board![6] == board![24] &&
        board![12] == board![18] &&
        board![12] == board![24] &&
        board![18] == board![24] &&
        board![0] != "") {
      showWinDialog(winner: board![0]);
      return true;
    }
    if (board![4] == board![8] &&
        board![4] == board![12] &&
        board![4] == board![16] &&
        board![4] == board![20] &&
        board![8] == board![12] &&
        board![8] == board![16] &&
        board![8] == board![20] &&
        board![12] == board![16] &&
        board![12] == board![20] &&
        board![16] == board![20] &&
        board![4] != "") {
      showWinDialog(winner: board![4]);
      return true;
    }
    if (!board!.contains("")) {
      showWinDialog(draw: "draw");
      return true;
    }
    return false;
  }

  showWinDialog({String winner = "", String draw = ""}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(winner == "" ? "Draw" : "Winner"),
          content: Text(winner == "" ? "It's a draw" : "Player $winner wins"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (winner == "X") {
                    player1Score++;
                  } else if (winner == "O") {
                    player2Score++;
                  }

                  board = List.filled((boardSize) * (boardSize), "");
                  isGameOver = false;
                  currentPlayer = "X";
                });
                Navigator.pop(context);
              },
              child: const Text("Play Again"),
            )
          ],
        );
      },
    );
  }
}
