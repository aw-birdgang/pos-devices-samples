import 'package:flutter/material.dart';
import 'package:flutter_pos/providers/game_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class GameNumberScroll extends StatefulWidget {
  const GameNumberScroll({super.key});
  @override
  State<GameNumberScroll> createState() => _NumberScrollState();
}

class _NumberScrollState extends State<GameNumberScroll> {

  late final ValueChanged<String> onDataChanged;
  List<int> selectedNumbers = [];

  void toggleNumber(int number) {
    setState(() {
      if (selectedNumbers.contains(number)) {
        selectedNumbers.remove(number);
      } else {
        if (selectedNumbers.length >= 5) return;
        selectedNumbers.add(number);
      }
    });
  }


  Widget _displaySelectedNumbers () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '## : ',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 5),
        Text(
          selectedNumbers.join(', '),
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }


  Widget _btnController (final provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            print("GEN");
            List<int> numbers = provider.generateRandomLottoNumbers();
            setState(() {
              selectedNumbers.addAll(numbers);
            });
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            child: const Center(child: Text('GEN')),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            print("SAVE");
            if (selectedNumbers.length >= 5) {
              provider.addGameNumbers(selectedNumbers);
            }
            setState(() {
              selectedNumbers.clear();
            });
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            child: const Center(child: Text('SAVE')),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            print("PRINT");
            String result = provider.printTicket();
            showToast(result);
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            child: const Center(child: Text('PRINT')),
          ),
        ),
      ],
    );
  }


  Widget _keyboardController (final provider) {
    return SizedBox(
      height: 120,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 열의 수를 5로 설정
          childAspectRatio: 1.0,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemCount: 45,
        itemBuilder: (context, index) {
          int number = index + 1;
          bool isSelected = selectedNumbers.contains(number);
          return GestureDetector(
            onTap: () => toggleNumber(number),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context, listen: false);

    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _displaySelectedNumbers (),
                const SizedBox(width: 5),
                _btnController(provider),
              ],
            ),
            const SizedBox(height: 10),
            _keyboardController(provider),
          ],
        ),
      ),
    );
  }
}