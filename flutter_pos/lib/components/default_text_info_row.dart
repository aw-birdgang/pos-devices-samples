import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/responsive.dart';

Widget getTextInfoRow (BuildContext context, title, value, {maxLine = 3}) {
  return Row(
    children: [
      SizedBox(
        width: Responsive.isDesktop(context) ? 200 : 150,
        child: EasyRichText(
          title,
          defaultStyle: TextStyle(fontSize: !Responsive.isDesktop(context) ? 10 : 15),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      SizedBox(
        width: Responsive.isDesktop(context) ? 800 : 150,
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
    ],
  );
}