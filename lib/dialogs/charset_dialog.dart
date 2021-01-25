import 'package:flutter/material.dart';
import 'package:Midori/screens/quiz_screen.dart';

class CharSetDialog extends StatefulWidget {
  final int chosenCharSet;
  CharSetDialog(this.chosenCharSet);
  @override
  _CharSetDialogState createState() => _CharSetDialogState(chosenCharSet);
}

class _CharSetDialogState extends State<CharSetDialog> {
  var charSet = {
    {
      {'lead': '25', 'text': 'First 25 Hiragana\nあ - な'},
      {'lead': '20', 'text': 'Next 20 Hiragana\nは - を'},
      {'lead': '25', 'text': 'Dakuten Kana\nが - ぽ'},
      {'lead': '36', 'text': 'Combo Hiragana\nきゃ - ぴょ'}
    },
    {
      {'lead': '25', 'text': 'First 25 Katakana\nア - ノ'},
      {'lead': '20', 'text': 'Next 20 Katakana\nハ - ヲ'},
      {'lead': '25', 'text': 'Dakuten Kana\nガ - ポ'},
      {'lead': '36', 'text': 'Combo Katakana\nキャ - ピョ'}
    }
  };

  final int chosenCharSet;
  _CharSetDialogState(this.chosenCharSet);

  var _checked = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Select the ones you want to practice:',
                  style: TextStyle(fontSize: 16),
                )),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(0)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(0)['lead']),
              value: _checked[0],
              onChanged: (bool value) {
                setState(() {
                  _checked[0] = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(1)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(1)['lead']),
              value: _checked[1],
              onChanged: (bool value) {
                setState(() {
                  _checked[1] = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(2)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(2)['lead']),
              value: _checked[2],
              onChanged: (bool value) {
                setState(() {
                  _checked[2] = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(3)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(3)['lead']),
              value: _checked[3],
              onChanged: (bool value) {
                setState(() {
                  _checked[3] = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CONTINUE'),
                  onPressed: () {
                    print(_checked);
                    Navigator.pop(context, _checked);
                    Navigator.pushNamed(
                      context,
                      QuizScreen.routeName,
                      arguments: QuizArguments(
                        chosenCharSet,
                        _checked,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ]),
        ));
  }
}
