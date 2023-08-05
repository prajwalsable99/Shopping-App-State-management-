import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final double price;
  final String title;
  final String imgurl;
  const ItemCard({
    super.key,
    required this.title,
    required this.price,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Half of the width (or height)
              // color: Colors.blue,
      color:const Color.fromARGB(255, 100, 96, 100),
            ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      // elevation: 10,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title
            ,style:const TextStyle(
              fontWeight: FontWeight.bold,fontSize: 24,
              color: Colors.amber,
            ),),
        Text('$price \$',style:const TextStyle(
              fontWeight: FontWeight.bold,fontSize: 14,
              color: Colors.amber
            ),),
        Center(
          child: Image(
            image: AssetImage(imgurl),
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ]),
    );
  }
}
