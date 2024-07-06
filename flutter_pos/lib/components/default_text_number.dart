import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/responsive.dart';

Widget getTextNumber (BuildContext context, value, {maxLine = 1}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      child: GestureDetector(
        child: EasyRichText(
          value,
          defaultStyle: TextStyle(
            color: Colors.green.shade300,
            fontSize: !Responsive.isDesktop(context) ? 10 : 15,
          ),
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis,
        ),
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: value)).then((_){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: EasyRichText(
              '$value copied to clipboard',
              defaultStyle: const TextStyle(
                color: Colors.red,
              ),
            )));
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$value copied to clipboard')));
          });
        },
      ),
    ),
  );
}