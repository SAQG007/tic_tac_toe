import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tic_tac_toe/global/utils.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {

  String _currentPlayer = "X";
  List<String> gridSymbols = List.filled(9, "");
  int _filledIndexCount = 0;
  String _winner = "";
  int _xWinCount = 0;
  int _oWinCount = 0;

  final List<List<int>> _winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void _changeGridSymbol(int index) {
    setState(() {
      gridSymbols[index] = _currentPlayer;
    });
    _filledIndexCount++;
  }

  void _changeCurrentPlayer() {
    setState(() {
      _currentPlayer == "X" ? _currentPlayer = "O" : _currentPlayer = "X";
    });
  }

  void _findWinner() {
    for(final combination in _winningCombinations) {
      
      final symbol = gridSymbols[combination[0]];

      if(
        symbol.isNotEmpty &&
        // The index is the value in the combination list.
        // If combination is [3, 4, 5], the variable index will take on the values 3, 4, and 5 during the iteration.
        combination.every((index) => gridSymbols[index] == symbol)
      ) {
        _winner = symbol;
        return;
      }
    }

    if(_filledIndexCount == 9) {
      _showDrawBar(context);
    }
  }

  void _incrementWinCount() {
    setState(() {
      _winner == "X" ? _xWinCount++ : _oWinCount++;
    });
  }

  void _showWinBar(BuildContext context){
    AchievementView(
      content: Text(
        "The winner is $_winner",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      color: const Color.fromARGB(255, 40, 35, 73),
      isCircle: true,
      icon: const Icon(
        Icons.emoji_events_outlined,
        size: 30,
      ),
    ).show(context);
  }

  void _showDrawBar(BuildContext context){
    AchievementView(
      content: Text(
        "Match Draw",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      color: const Color.fromARGB(255, 40, 35, 73),
      isCircle: true,
      icon: const Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.block_outlined,
            color: Colors.red,
            size: 40,
            weight: 0.1,
            grade: 0.1,
          ),
        ],
      ),
    ).show(context);
  }

  void _resetBoard() {
    setState(() {
      gridSymbols = List.filled(9, "");
      _currentPlayer = "X";
    });
    _filledIndexCount = 0;
    _winner = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            'assets/backgrounds/stars.riv',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            antialiasing: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Turn ($_currentPlayer)",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Center(
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        if(gridSymbols[index].isEmpty && _winner.isEmpty) {
                          playButtonTapSound();
                          _changeGridSymbol(index);

                          // this will only run if 5 or more indexes are filled
                          _filledIndexCount > 4 ? _findWinner() : null;

                          // this will only run if there is a winner
                          _winner.isNotEmpty ? 
                          {
                            _showWinBar(context),
                            _incrementWinCount()
                          } : null;

                          _changeCurrentPlayer();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: Color(0xff120f25),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white24,
                              blurRadius: 5.0,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            gridSymbols[index],
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Win Streak",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "X - $_xWinCount",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 55,
                  ),
                  Text(
                    "O - $_oWinCount",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          playButtonTapSound();
          _resetBoard();
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
