import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class Data
{
  Auth auth = new Auth();
  final Firestore db = Firestore.instance;

  void setUser() async
  {
    FirebaseUser user = await auth.currentuser();
    try
    {
      await Firestore.instance.collection("user").document(user.uid).setData({
        'user' : user.displayName,
        'email' : user.email,
        'profile' : user.photoUrl
      });
      print("added");
    }
    catch(e)
    {
      print(e);
    }
  }

  Future<Map<String,dynamic>> getUser() async
  {
    try
    {
     FirebaseUser user = await auth.currentuser();
     DocumentSnapshot doc = await Firestore.instance.collection("user").document(user.uid).get();
     Map<String,dynamic> item = {
       'name': doc['name'],
       'email': doc['email'],
       'profile': doc['profile']
     };
     return item;
    }
    catch(e)
    {
      print(e);
      Map<String,dynamic> item;
      return item;
    }
  }

  void createRecord(String hotel,String name,String image, String price) async
  {
    try
    {
      FirebaseUser result = await auth.currentuser();
      await db.collection(hotel).document(result.uid).setData({
        'name': name,
        'image': image,
        'price': price,
      });
      print("added");
    }
    catch(e)
    {
      print(e);
    }
  }

  Future<Map<String,dynamic>> getRecord(String hotel) async
  {
    try
    {
      FirebaseUser result = await auth.currentuser();
      String uid = result.uid;
      DocumentSnapshot doc = await db.collection(hotel).document(uid).get();
      Map<String,String> item = {
        'name' : doc['name'],
        'food' : doc['food'],
        'price' : doc['price']
      };
      return item;
    }
    catch(e){
      print(e.toString());
      Map<String,dynamic> item;
      return item;
    }
  }

  Future<QuerySnapshot> getHotelItems(String hotelName) async
  {
    try
    {
      List<String> items;
      QuerySnapshot snapshot = await Firestore.instance.collection(hotelName).getDocuments().then((_items){
        return _items;
      });
      print(snapshot.documents.length);
//      for(int i=0;i<snapshot.documents.length;i++)
//        {
//          items.add(snapshot.documents[i].documentID);
//        }
      return snapshot;
    }
    catch(e)
    {
      print(e);
    }
  }

  void setFoodItems(String hotelName,String foodName,String image,String price) async
  {
    try
    {
      await Firestore.instance.collection(hotelName).document(foodName).setData({
        'image' : image,
        'price' : price
      });
      print("added");
    }
    catch(e)
    {
      print(e);
    }
  }

  Future<Map<String,dynamic>> getFoodItems(String hotelName,String foodName) async
  {
    try{
      DocumentSnapshot doc = await Firestore.instance.collection(hotelName).document(foodName).get().then((_item){
        return _item;
      });
      Map<String, dynamic> item = {'price' : doc['price'], 'image':doc['image']};
      return item;
    }
    catch(e)
    {
      print(e.toString());
      Map<String,dynamic> item;
      return item;
    }
  }

  void bookedDetails(Items item , Hotel hotel , DateTime orderedTime, Duration duration , String userId) async{
  try
  {
  await Firestore.instance.collection("BookedDetails").document(userId).setData({
    'Item':{
      'itemName': item.itemName,
      'image': item.itemImage,
      'price': item.itemPrice,
      'associatedhotel' : item.associatedHotel
    },
    'Hotel':{
      'name' : hotel.name,
      'image': hotel.image,
      'rating': hotel.rating,
      'postion': hotel.position
    } ,
    'orderedTime': orderedTime,
    'duration' : duration,
    'userId': userId
  });
  print("added");
  }
  catch(e)
  {
  print(e);
  }
}
  void setHotel(String name,String image,int rating) async
  {
    try
    {
      await Firestore.instance.collection("hotel").document(name).setData({
        'image' : image,
        'rating' : rating
      });
      print("added");
    }
    catch(e)
    {
      print(e);
    }
  }

  Future<Map<String,dynamic>> getHotel(String name) async
  {
    try
    {
      DocumentSnapshot doc = await Firestore.instance.collection("hotel").document(name).get().then((_item){
        return _item;
      });
      Map<String, dynamic> item = { 'image': doc['image'], 'rating': doc['rating'] };
      return item;
    }
    catch(e)
    {
      print(e.toString());
      Map<String,dynamic> item;
      return item;
    }
  }

  void notify(String hotelName,String foodName,int price) async{
    FirebaseUser user = await auth.currentuser();
    await Firestore.instance.collection("order").document(hotelName).setData({
      user.uid:{
        'foods':[foodName],
        'qty':[price]
      }
    });
  }

  void setOrder(String foodName, String price,String image,int items) async
  {
    try
    {
      FirebaseUser user = await auth.currentuser();
      await Firestore.instance.collection("order").document(user.uid).setData({
        foodName : {
          'price' : price,
          'image' : image
        }
      });
    }
    catch(e)
    {
      print(e.toString());
    }
  }

//  Future<List<Map<String, dynamic>>> getorder() async
//  {
//    try
//    {
//      FirebaseUser user = await auth.currentuser();
//      DocumentSnapshot doc = await Firestore.instance.collection("order").document(user.uid).get().then((_item){
//        return _item;
//      });
////      for(int i=0;i;i++)
////        {
////          Map<String,dynamic> item = {'name':snapshot.documents.length,'price':snapshot.documents.length};
////          items.add(item);
////        }
//      return item;
//    }
//    catch(e)
//    {
//      print(e.toString());
//      Map<String,dynamic> item;
//      return item;
//    }
//  }
}
