import 'package:pagination_demo/feature/model/item_model.dart';


class ItemService {
  static List<Item> fetchItems(int page, int itemsPerPage) {
    return List.generate(itemsPerPage, (index) => Item(page * itemsPerPage + index));
  }
}
