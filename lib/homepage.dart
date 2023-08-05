import 'package:flutter/material.dart';
import 'package:shopping_app/global_var.dart';
import 'package:shopping_app/item_card.dart';
import 'package:shopping_app/prod_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters= const ['All','Zara','Gucci','H&M','Prada','Adidas','Puma','Louis vuitton'];

  late String selectedfilter;

  @override
  void initState() {
    
    super.initState();
    selectedfilter=filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Clothes\nStore",
                  style: TextStyle(fontSize: 32,fontWeight:  FontWeight.bold),
                ),
              ),
              Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        

                      ),
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                    ),

                    prefixIcon: Icon(Icons.search),
                    // prefixIconColor: Colors.grey,
                  ),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      
                    ),
                    

              )),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                        selectedfilter=filters[index];
                          
                        });
                        
                      },
                      child: Chip(
                        backgroundColor: filters[index]==selectedfilter?const Color.fromARGB(255, 238, 229, 54):null,
                        label:Text(filters[index],style:const TextStyle(fontSize: 20),),
                        padding:const EdgeInsets.fromLTRB(8 ,2, 8, 2),
                        elevation: 10,
                              // side: const BorderSide(style: BorderStyle.solid),
                              ),
                    ),
                  );
              }
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder:(context,index){

                final prod=products[index];
          
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                     MaterialPageRoute(builder: (context){
                        return   ProductDetailsPage(product: prod);

                     }) 
                    );
                  },
                  child: ItemCard(
                    title:prod['title'].toString() ,
                    price: prod['price'] as double,
                    imgurl: prod['imageUrl'] as String,
                    
                    ),
                );
                
              } 
            
            ),
          )
        ],
      ),
    );
  }
}
