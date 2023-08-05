import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context).cartStore;
    return   SafeArea(child: 
    Column(
      children: [
        const Center(
          child: Text("My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context,index){
              final item=cart[index];
              final size=item['size'].toString();
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(item['imageUrl'].toString()),
                ),
                title: Text(item['title'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle:  Text("Selected size : $size"),
                trailing: IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){

                      return  AlertDialog(
                        title: const Text("Delete item"),
                        content: const Text("Are you sure ?"),
                        actions: [
                          TextButton(onPressed: (){
                              Navigator.of(context).pop();
                          }, child: const Text("No",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                          TextButton(onPressed: (){
                            Provider.of<CartProvider>(context, listen: false).removeProduct(item);
                            Navigator.of(context).pop();

                          }, child: const Text("Yes",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
                        ],
                      );

                    })  ;


                }, icon:const Icon(Icons.delete)),
              );
        
            
          }),
        )
      ],
    )
    
    )
    ;
  }
}