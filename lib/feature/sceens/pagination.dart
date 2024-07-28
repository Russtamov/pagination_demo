import 'package:flutter/material.dart';
import 'package:pagination_demo/feature/providers/item_provider.dart';
import 'package:pagination_demo/feature/widgets/item_list_tile.dart';
import 'package:provider/provider.dart';

class PaginationPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemProvider()..loadMoreData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pagination Demo'),
        ),
        body: Consumer<ItemProvider>(
          builder: (context, itemProvider, child) {
            _scrollController.addListener(() {
              if (itemProvider.isLoading) return;
              if (_scrollController.position.pixels ==
                  _scrollController.position.maxScrollExtent) {
                itemProvider.loadMoreData();
              }
            });

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: itemProvider.items.length + (itemProvider.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == itemProvider.items.length) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ItemListTile(item: itemProvider.items[index]);
                    },
                  ),
                ),
                if (itemProvider.isLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
