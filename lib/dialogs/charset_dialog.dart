import 'package:flutter/material.dart';

class CharSetDialog extends StatefulWidget {
  final int chosenCharSet;
  CharSetDialog(this.chosenCharSet);
  @override
  _CharSetDialogState createState() => _CharSetDialogState(chosenCharSet);
}

class _CharSetDialogState extends State<CharSetDialog> {
  var charSet = {
    {
      {'lead': '25', 'text': 'First 25 Hiragana\nあ-な'},
      {'lead': '20', 'text': 'Next 20 Hiragana\nは-を'},
      {'lead': '25', 'text': 'Dakuten Kana\nが-ぽ'},
      {'lead': '36', 'text': 'Combo Hiragana\nきゃ-ぴょ'}
    },
    {
      {'lead': '25', 'text': 'First 25 Katakana\nア-ノ'},
      {'lead': '20', 'text': 'Next 20 Katakana\nハ-ヲ'},
      {'lead': '25', 'text': 'Dakuten Kana\nガ-ポ'},
      {'lead': '36', 'text': 'Combo Katakana\nキャ-ピョ'}
    }
  };

  final int chosenCharSet;
  _CharSetDialogState(this.chosenCharSet);

  var _checked = true;
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
              value: _checked,
              onChanged: (bool value) {
                setState(() {
                  _checked = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(1)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(1)['lead']),
              value: _checked,
              onChanged: (bool value) {
                setState(() {
                  _checked = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(2)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(2)['lead']),
              value: _checked,
              onChanged: (bool value) {
                setState(() {
                  _checked = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(3)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(3)['lead']),
              value: _checked,
              onChanged: (bool value) {
                setState(() {
                  _checked = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CONTINUE'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 10),
              ],
            ),
          ]),
        ));
  }
}
