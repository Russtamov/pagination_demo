import 'package:flutter/material.dart';
import 'package:pagination_demo/feature/model/item_model.dart';
import 'package:pagination_demo/feature/service/item_service.dart';


class ItemProvider with ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = false;
  int _currentPage = 0;
  final int _itemsPerPage = 15;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;

  void loadMoreData() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    List<Item> newItems = ItemService.fetchItems(_currentPage, _itemsPerPage);
    _items.addAll(newItems);
    _currentPage++;
    _isLoading = false;
    notifyListeners();
  }
}
