import 'package:get/get.dart';
import 'package:getx_tutorial/models/product.dart';

class CartController extends GetxController{

  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product){
    cartItems.add(product);
  }

  void removeFromCart(int id){
    cartItems.removeWhere((item)=> item.id == id );
  }
}