import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/ticket_provider.dart';
import 'components/ticket_detail.dart';


class TicketPage extends StatefulWidget {
  const TicketPage({super.key});
  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ChangeNotifierProvider<TicketProvider>(
          create: (context) => TicketProvider(),
          child: Consumer<TicketProvider>(
            builder: (context, provider, child) {
              return TicketDetail(provider);
            },
          ),
        )
    );
  }
}