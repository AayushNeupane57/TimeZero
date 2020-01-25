//class BookedDetails{
//  String image;
//  String name;
//  // time at which order is made
//  DateTime orderDateTime;
//  // time the customer is supposed to get the food served
//  DateTime finalDateTime;
//  String address;
//  String item;
//  BookedDetails(this.image,this.name,this.orderDateTime,this.finalDateTime,this.address,this.item);
//}
//int count = 1;
//List <BookedDetails> bookedDetails =
//[
//  BookedDetails("images/syanko.png","Syanko",DateTime.parse("2020-01-22 13:47:39.106637"),
//    DateTime.parse("2020-01-22 14:11:39.106637"),"Thapathali","Burger"),
//];

//ChIJt5649ssZ6zkR7OMzx4o8G5U

class BookedDetails{
  Items item;
  Hotel hotel;
  DateTime orderedTime;
  Duration durationSelected;
  Stopwatch stopwatch;

  BookedDetails({this.item,this.hotel,this.orderedTime,this.durationSelected,this.stopwatch});
}
int count = 1;
List <BookedDetails> bookedDetails =
[

];



List <Items>foodCartData=[
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100"),

];

class Items
{
  String itemName;
  String itemImage;
  String itemPrice;
  String distance;

  Items({this.itemName, this.itemImage,this.itemPrice});


}
List <Items> foodsSoltae=[
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/mango.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/apple.jpg",itemPrice:"100")];

List <Items> foodsDwarika=[
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/mango.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/apple.jpg",itemPrice:"100")];
List <Items> foodsSyanko=[

  Items(itemName:"Katti Roll",itemImage:"images/chicken.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100"),
];
List <Items> foodsKfc=[

  Items(itemName:"Fried Chicken",itemImage:"images/chicken.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100"),
];
List <Items> foodsBurgerHouse=[

  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100"),
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100"), Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100"),
];



class Hotel {

  String name;
  int rating;
  String image;
  String position;
  List <Items>foodItems;
  Hotel({this.name,this.rating,this.image,this.foodItems,this.position});

}


Hotel soltae= Hotel(name:"Soltae",rating: 5, image:"images/soltae.jpg", foodItems:foodsSoltae,position:"27.6815169,85.321739,17z");
Hotel dwarika= Hotel(name:"Dwarika Hotel",rating: 5, image:"images/dwarika.jpg", foodItems:foodsDwarika,position:"27.6815169,85.321739,17z");
Hotel syanko =Hotel(name:"Syanko",rating: 4, image:"images/syanko.png", foodItems:foodsSyanko,position:"27.6815169,85.321739,17z");
Hotel kfc =Hotel(name:"KFC",rating: 3,image:"images/kfc.png", foodItems:foodsKfc,position:"27.6815169,85.321739,17z");
Hotel BurgerHouse =Hotel(name:"Burger House",rating: 4, image:"images/burgerHouse.jpg", foodItems:foodsBurgerHouse,position:"27.6815169,85.321739,17z");
