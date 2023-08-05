import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 240, 234),
        appBar: AppBar(
          title: const Text("Product Details"),
          centerTitle: true,
          // leading: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: main,
              children: [
                Text(
                  widget.product['title'].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Image(
                        image:
                            AssetImage(widget.product['imageUrl'].toString()),
                        // width: 150,
                        // height: 150,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Text(
                  "${widget.product['price']} \$",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Container(
                  height: 250,
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromARGB(255, 135, 134, 133),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Available sizes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            itemCount:
                                (widget.product['sizes'] as List<int>).length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final size =
                                  (widget.product['sizes'] as List<int>)[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(size.toString()),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  elevation: 10,
                                  backgroundColor: selectedSize == size
                                      ? Colors.amber.shade200
                                      : null,
                                ),
                              );
                            }),
                      ),
                      ElevatedButton(
                        onPressed: () {

                          if (selectedSize!=0) {
                            
                          
                          Provider.of<CartProvider>(context, listen: false)
                              .addProduct(
                            {
                              'id': widget.product['id'],
                              'title':widget.product['title'],
                              'price': widget.product['price'],
                              'brand': widget.product['brand'],
                              'size': selectedSize,
                              'imageUrl': widget.product['imageUrl']
                            });
                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added successfully")));

                          } else {

                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select size")));
                            
                          }

                          
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Icon(Icons.shopping_cart),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
