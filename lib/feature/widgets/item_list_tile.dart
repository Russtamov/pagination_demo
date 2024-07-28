import 'package:flutter/material.dart';
import 'package:pagination_demo/feature/model/item_model.dart';

class ItemListTile extends StatelessWidget {
  final Item item;

  ItemListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Liste ${item.id}'),
    );
  }
}
