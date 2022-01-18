import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14,right: 10,top: 20,bottom: 10),
                child: Text("Order Summary",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,),),
              ),

             Center(
               child: Container(
                 width: MediaQuery.of(context).size.width * 0.91,
                 height: 1,
                 color: Colors.grey,
               ),
             )
            ],
          ),
        ),
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,),),
                  Text("\$ 33.90",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text("Address",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,),),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red.shade900),
                      onPressed: (){
                      }, child: const Text("Proceed to Payment",style: TextStyle(color: Colors.white,),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
