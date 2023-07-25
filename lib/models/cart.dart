import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  //catalog field
  late CatalogModel _catalog;

  //collection of id store of each items
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get item in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get tottal price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item because AddMutation

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  //remove item
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
