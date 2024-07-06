import 'package:flutter/material.dart';

import '../../../components/paging_listview.dart';
import '../../../models/game.dart';
import '../../../models/ticket.dart';
import '../../../providers/ticket_provider.dart';
import '../../../shared/constants.dart';
import 'ticket_item.dart';

class TicketDetail extends StatefulWidget {

  TicketDetail(this.ticketProvider, {
    super.key
  });

  TicketProvider ticketProvider;

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  late TicketProvider ticketProvider;

  bool status = true;

  Widget itemWidget(Ticket item) {
    return TicketItem(item, key: Key("ticket_${item.id}"));
  }

  @override
  Widget build(BuildContext context) {
    ticketProvider = widget.ticketProvider;
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PagingListView(ticketProvider, itemWidget),
          const Divider(thickness: 2,),
        ],
      ),
    );
  }

}