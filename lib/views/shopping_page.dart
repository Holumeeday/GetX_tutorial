import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:getx_tutorial/controllers/cart_controller.dart';
import 'package:getx_tutorial/controllers/shopping_controller.dart';



class ShoppingPage extends StatelessWidget {
  final ShoppingController = Get.put(ShoppingController());
  final cartController = Get.put(cartController());

  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: GetX<ShoppingController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.products.length,
                        itemBuilder: (context, index){
                          return Card(
                            margin: const EdgeInsets.all(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.products[index].productName, style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          Text(controller.products[index].productDescription, style: const TextStyle(
                                            fontSize: 16,
                                          ),)
                                        ],
                                      ),
                                      Text('\$${controller.products[index].price}')
                                    ],
                                  ),
                                  MaterialButton(
                                      onPressed: (){
                                        cartController.addToCart(controller.products[index]);
                                      },
                                    color: Colors.greenAccent,
                                    textColor: Colors.white,
                                    child: const Text('Add to cart'),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }
                )
            ),
            GetX<CartController>(
              builder: (controller) {
                return  Text('Total amount: \$ ${controller.totalPrice}',
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
              }
            ),
           const  SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        backgroundColor: Colors.amber,
        icon: const Icon(Icons.add_shopping_cart, color: Colors.black,),
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString(),
              style: const TextStyle(color: Colors.black,fontSize: 22, fontWeight: FontWeight.bold),);
          }
        ),
      ),
    );
  }
}
