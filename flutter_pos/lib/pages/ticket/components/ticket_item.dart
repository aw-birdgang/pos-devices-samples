import 'package:flutter/material.dart';

import '../../../models/ticket.dart';
import '../../../shared/constants.dart';

class TicketItem extends StatefulWidget {
  TicketItem(this.ticket, {super.key});
  Ticket ticket;
  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withOpacity(0.05),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contentView(),
          ],
        ),
      ),
    );
  }


  Widget getTextNumber(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }


  Widget contentView() {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }

}
