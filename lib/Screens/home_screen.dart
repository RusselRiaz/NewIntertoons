import 'package:flutter/material.dart';
import 'package:intertoons_ruz/Components/image_shimmer.dart';
import 'package:intertoons_ruz/Provider/screen_provider.dart';
import 'package:intertoons_ruz/Screens/cart_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ScreenProvider>(context,listen: false).getBannerDatas();
    Provider.of<ScreenProvider>(context,listen: false).getCategory();
    Provider.of<ScreenProvider>(context,listen: false).getProductsD();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.only(left: 10,top: 10,bottom: 20),
            child: Text("Deliver to",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ),
        body: Consumer<ScreenProvider>(builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                BannerItem1(data),
                const Text(
                  "Explore Menu",
                  style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w700,),
                ),
                BamnerItem2(data),
                const Text(
                  "Featured",
                  style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w700,),
                ),
                BannerItem3(data),
                const Text(
                  "Bestseller",
                  style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w700,),
                ),
                BannerItem4(data)
              ],
            )
          );
        }),
        bottomNavigationBar: Consumer<ScreenProvider>(
            builder: (context,data,child) {
              return data.ProductID.isNotEmpty?Container(
                height: 30,
                color: Colors.red.shade900,
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text('${data.ProductID.length} item(S) in cart \$ ${data.TotalcartPrice}',style: TextStyle(fontSize: 13,color: Colors.white,),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
                    }, child: const Text("View Cart",style: TextStyle(fontSize: 13,color: Colors.white,),))
                  ],
                ),
              ):Container(
                height: 10,
              );
            }
        ),
      ),
    );
  }
  
  BannerItem1 (data){
    return SizedBox(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data.BannerData?.data?.sliderBanners?.length,
          itemBuilder: (context, index) {
            return data.isBannerloading == false
                ? Padding(
              padding: const EdgeInsets.only(
                  left: 5, right: 5, bottom: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: data.BannerData?.data?.sliderBanners?[index].bannerImg !=null?
                  Image.network(
                      '${data.BannerData?.data?.sliderBanners?[index].bannerImg}',
                      height: double.infinity,
                      width: 200,
                      fit: BoxFit.fill)
                      :ImageShimmer(height: 120.0,width: 200.0,)),
            )
                : const CircularProgressIndicator();
          }),
    );
  }


  BamnerItem2 (data){
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.categoryData?.data?.length,
          itemBuilder: (context, index) {
            return data.isCatLoading == false
                ? Column(
              children: [
                Container(
                  height: 80,
                  width: 100,
                  padding:
                  const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    child: data.categoryData?.data?[index].catImg !=null?Image.network(
                      '${data.categoryData?.data?[index].catImg}',
                      fit: BoxFit.fill,
                    ):ImageShimmer(height: 80.0,width: 100.0),
                  ),
                ),
                Text(
                  '${data.categoryData?.data?[index].catName}',
                  style: const TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w600,),
                )
              ],
            )
                : const CircularProgressIndicator();
          }),
    );

  }

  BannerItem3(data){
    return SizedBox(
      height: 180,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data.BannerData?.data?.sliderBanners?.length,
          itemBuilder: (context, index) {
            if (data.isBannerloading == false) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, bottom: 10),
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      data.BannerData?.data?.featuredProducts?[index].image !=null?Image.network(
                        '${data.BannerData?.data?.featuredProducts?[index].image}',
                        height: 120,
                        width: 200,
                        fit: BoxFit.fill,
                      ):ImageShimmer(height: 120.0,width: 200.0),
                      Row(

                        children: [
                          const Icon(Icons.indeterminate_check_box,color: Colors.green,size: 20,),
                          SizedBox(width: 5,),
                          Text('${data.BannerData?.data?.featuredProducts?[index].name}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,),),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text('\$ ${data.BannerData?.data?.featuredProducts?[index].specialPrice}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.red.shade900,),),
                          SizedBox(width: 5,),
                          Text('  C\$ ${data.BannerData?.data?.featuredProducts?[index].price} ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey,decoration: TextDecoration.lineThrough,),),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }

  BannerItem4(data){
    return  ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: data.BannerData?.data?.bestsellerProducts?.length ?? 1,
        itemBuilder: (context,index){
          return data.isProductloading ==false?Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 5),
            child: SizedBox(
              height: 80,
              child: ListTile(
                  leading: SizedBox(
                      height: 60,
                      width: 60,
                      child: data.BannerData?.data?.bestsellerProducts?[index].image !=null? Image.network('${data.BannerData?.data?.bestsellerProducts?[index].image}',fit: BoxFit.fill,):ImageShimmer(height: 50.0,width: 50.0)),
                  title: Text('${data.BannerData?.data?.bestsellerProducts?[index].name}',style: TextStyle(fontSize: 14),),
                  subtitle: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 25,width: 55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red.shade900),
                                onPressed: (){
                                  data.AddtoCart(data.BannerData?.data?.bestsellerProducts?[index].id,index);
                                  data.getTotalprice(data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?data.BannerData!.data!.bestsellerProducts![index].specialPrice.toString():data.BannerData?.data?.bestsellerProducts?[index].price.toString());
                                  print(data.ProductID.toString());
                                }, child: const Text("ADD",style: TextStyle(fontSize: 10,color: Colors.white,),))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?'  \$ ${data.BannerData?.data?.bestsellerProducts?[index].specialPrice}' :'',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.red.shade900,),),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            ),
          ):const CircularProgressIndicator();
        });
  }



}


