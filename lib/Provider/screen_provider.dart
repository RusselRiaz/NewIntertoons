

import 'package:flutter/material.dart';
import 'package:intertoons_ruz/Models/banner_models.dart';
import 'package:intertoons_ruz/Models/category_models.dart';
import 'package:intertoons_ruz/Models/products_models.dart';
import 'package:intertoons_ruz/utils/network_constants.dart';

class ScreenProvider with ChangeNotifier{
  BannerModel? BannerData;
  CategoryModel? categoryData;
  AllProducts? getProductsDatas,getCategoryBaseProducts;
  bool isBannerloading =true,isCatLoading=true,isProductloading=true,isCatProductsloading =true;


  Future<void>getBannerDatas()async{
    try{
      isBannerloading = false;
      BannerData = await getBanner();
    }
    catch(e){
      print(e);
      isBannerloading =true;
    }
    notifyListeners();
  }
  Future<void>getCategory()async{
    try{
      isCatLoading = false;
      categoryData = await getCategoryData();
    }
    catch(e){
      print(e);
      isCatLoading =true;
    }
    notifyListeners();
  }

  Future<void>getProductsD()async{
    try{
      isProductloading = false;
      getProductsDatas = await getProducts();
    }
    catch(e){
      print(e);
      isProductloading =true;
    }
    notifyListeners();
  }

  Future<void>getProductsbyCatid(Catid)async{
    try{
      isCatProductsloading = false;
      getCategoryBaseProducts = await getCatProducts(Catid);
    }
    catch(e){
      print(e);
      isCatProductsloading =true;
    }
    notifyListeners();
  }



  List<int> ProductID=[];
  List<int> quantity=[];
  double TotalcartPrice=0;
  AddtoCart(id,index){
    if(ProductID.contains(id)){
      quantity[index] +=1;
    }else{
      ProductID.add(id);
      quantity.add(1);
    }
    notifyListeners();
  }
  DecreaseQuantity(id,index,price){
    if(quantity[index] ==1){
      ProductID.remove(id);
    }
    else{
      quantity[index] -=1;
    }
    TotalcartPrice =TotalcartPrice - double.parse(price.toString());
    notifyListeners();
  }
  void getTotalprice(price)async {
    print(price);
    TotalcartPrice =TotalcartPrice +double.parse(price.toString());
    print(TotalcartPrice);
  }
}