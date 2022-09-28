import 'package:get/get.dart';
import 'package:getx_tutorial/models/product.dart';

class ShoppingController extends GetxController{
var products = <Product>[].obs;

@override
void onInit(){
  super.onInit();
  fetchProduct();
}

void fetchProduct() async {
  await Future.delayed(const Duration(seconds: 3));
  var productResult = [
    Product(
        id: 1,
        price: 30,
        productName: 'Bentley bicycle',
        productDescription: "A bicycle for kids worth having for your kids",
        productImage: 'abd'),
    Product(
        id: 2,
        price: 50,
        productName: 'Mattress',
        productDescription: "A Mattress for kids worth having for your kids",
        productImage: 'abd'),
    Product(
        id: 3,
        price: 240,
        productName: 'Toy Car',
        productDescription: "A toy car for kids",
        productImage: 'abd'),
    Product(
        id: 4,
        price: 90,
        productName: 'Bentley bicycle',
        productDescription: "A bicycle for kids worth having for your kids",
        productImage: 'abd'),
    Product(
        id: 5,
        price: 7,
        productName: 'Honda bicycle',
        productDescription: "A bicycle for kids worth having for your kids",
        productImage: 'abd'),
    Product(
        id: 6,
        price: 10,
        productName: 'A black Pen',
        productDescription: "A bicycle for kids worth having for your kids",
        productImage: 'abd'),
    Product(
        id: 7,
        price: 3,
        productName: 'Pencil',
        productDescription: "A Pencil for kids worth having for your kids",
        productImage: 'abd'),
  ];

  products.value = productResult;
}
}