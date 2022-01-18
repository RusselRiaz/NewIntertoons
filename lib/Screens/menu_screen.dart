import 'package:flutter/material.dart';
import 'package:intertoons_ruz/Components/image_shimmer.dart';
import 'package:intertoons_ruz/Provider/screen_provider.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    var data= Provider.of<ScreenProvider>(context,listen: false);
    data.getProductsbyCatid(2);
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<ScreenProvider>(
        builder: (context,data,child) {
          return DefaultTabController(
              length: data.categoryData!.data!.length,
              child: SafeArea(
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                            padding: const EdgeInsets.only(top: 10,left: 10),
                            child: const Text("Explore Menu",style: TextStyle(color: Colors.white,fontSize: 18),)),
                        TabBar(
                          labelColor: Colors.red.shade900,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.red.shade900,
                          onTap: (int index){
                            data.getProductsbyCatid(2);
                          },
                          isScrollable: true,
                          tabs: List<Widget>.generate(data.categoryData!.data!.length, (int index) {
                            return  Tab(
                                text: '${data.categoryData?.data?[index].catName}');
                          }),

                        ),
                      ],
                    ),
                  ),
                  body: data.isCatProductsloading ==false?ListView.builder(
                      itemCount: data.getCategoryBaseProducts?.data?.products?.length ??0,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 300,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                data.getCategoryBaseProducts?.data?.products?[index].image !=null? Stack(
                                  children: [
                                    Image.network('${data.getCategoryBaseProducts?.data?.products?[index].image}',height: 200,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                                    Positioned(
                                      right: 00,
                                      bottom: 00,
                                      child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.grey,)),
                                    )
                                  ],
                                ):ImageShimmer(height: 200, width:  MediaQuery.of(context).size.width),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                                  child: Text('${data.getCategoryBaseProducts?.data?.products?[index].name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      data.getCategoryBaseProducts?.data?.products?[index].specialPrice !=0?Text(' \$ ${data.getCategoryBaseProducts?.data?.products?[index].price}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.redAccent,),)
                                          :Text(' \$ ${data.getCategoryBaseProducts?.data?.products?[index].price}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.redAccent,),
                                      ),
                                      SizedBox(
                                          height: 25,width: 55,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red.shade900),
                                              onPressed: (){}, child: const Text("ADD",style: TextStyle(fontSize: 10,color: Colors.white,),))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }):const CircularProgressIndicator(),
                ),
              )
          );
        }
    );
  }
}
