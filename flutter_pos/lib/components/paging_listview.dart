import 'package:flutter/material.dart';

import '../providers/type/paging_list_provider.dart';

class PagingListView extends StatelessWidget {
  PagingListProvider parentListProvider;
  Function itemWidgetFunction;
  PagingListView(this.parentListProvider, this.itemWidgetFunction, {
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0.0),
        controller: parentListProvider.scrollController,
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: parentListProvider.list.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              dynamic item = parentListProvider.list[index];
              return itemWidgetFunction(item);
            }
        ),
      ),
    );
  }
}
