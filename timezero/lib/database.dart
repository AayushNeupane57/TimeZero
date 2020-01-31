
class BookedDetails{
//  Items item;
  Item item;
  Hotel hotel;
  DateTime orderedTime;
  Duration durationSelected;
  Stopwatch stopwatch;

  BookedDetails({this.item,this.hotel,this.orderedTime,this.durationSelected,this.stopwatch});
}
class Hotel {

  String name;
  int rating;
  String image;
  String position;
  List <Items>foodItems;
  Hotel({this.name,this.rating,this.image,this.foodItems,this.position});

}

int count = 1;
List <BookedDetails> bookedDetails =
[

];

void add(String itemName, String associatedHotel)
{
//  foodCartData.add(Items(itemName:itemName,itemImage:itemImage,itemPrice:itemPrice,associatedHotel: associatedHotel));
  foodCartData.add(Item(itemName:itemName,associatedHotel: associatedHotel));
}

List<Item> foodCartData = [
  Item(itemName:"mango",associatedHotel:"KFC"),
  Item(itemName:"Momo",associatedHotel:"Syanko")
];
//List<Items> foodCartData;

class Item
{
  String itemName;
  String associatedHotel;
  Item({this.itemName,this.associatedHotel});
}

class Items
{
  String itemName;
  String itemImage;
  String itemPrice;
  String associatedHotel;
  Items({this.itemName, this.itemImage,this.itemPrice,this.associatedHotel});
}

List <Items> foodsSoltae=[
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100",associatedHotel: "soltae"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100",associatedHotel: "soltae"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100",associatedHotel: "soltae"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100",associatedHotel: "soltae"),
  Items(itemName:"Chow Mein",itemImage:"images/mango.jpg",itemPrice:"100",associatedHotel: "soltae"),
  Items(itemName:"Chow Mein",itemImage:"images/apple.jpg",itemPrice:"100",associatedHotel: "soltae")];

List <Items> foodsDwarika=[
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100",associatedHotel: "Dwarika"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100",associatedHotel: "Dwarika"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100",associatedHotel: "Dwarika"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100",associatedHotel: "Dwarika"),
  Items(itemName:"Chow Mein",itemImage:"images/mango.jpg",itemPrice:"100",associatedHotel: "Dwarika"),
  Items(itemName:"Chow Mein",itemImage:"images/apple.jpg",itemPrice:"100",associatedHotel: "Dwarika")
];
List <Items> foodsSyanko=[

  Items(itemName:"Katti Roll",itemImage:"images/chicken.jpg",itemPrice:"100",associatedHotel: "Syanko"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100",associatedHotel: "Syanko"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100",associatedHotel: "Syanko"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100",associatedHotel: "Syanko"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100",associatedHotel: "Syanko"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100",associatedHotel: "Syanko"),
];
List <Items> foodsKfc=[

  Items(itemName:"Fried Chicken",itemImage:"images/chicken.jpg",itemPrice:"100",associatedHotel: "KFC"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100",associatedHotel: "KFC"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100",associatedHotel: "KFC"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100",associatedHotel: "KFC"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100",associatedHotel: "KFC"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100",associatedHotel: "KFC"),
];
List <Items> foodsBurgerHouse=[

  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100",associatedHotel: "Burger House"),
  Items(itemName:"Momo",itemImage:"images/Momo.jpg",itemPrice:"100",associatedHotel: "Burger House"),
  Items(itemName:"Chow Mein",itemImage:"images/Chow Mein.jpg",itemPrice:"100",associatedHotel: "Burger House"),
  Items(itemName:"Sandwich",itemImage:"images/sandwich.jpg",itemPrice:"100",associatedHotel: "Burger House"),
  Items(itemName:"apple",itemImage:"images/apple.jpg",itemPrice:"100",associatedHotel: "Burger House"),
  Items(itemName:"mango",itemImage:"images/mango.jpg",itemPrice:"100",associatedHotel: "Burger House"),
  Items(itemName:"Burger ",itemImage:"images/burger.jpg",itemPrice:"100",associatedHotel: "Burger House"),
];

Hotel soltae= Hotel(name:"Soltae",rating: 5, image:"images/soltae.jpg", foodItems:foodsSoltae,position:"27.6815169,85.321739,17z");
Hotel dwarika= Hotel(name:"Dwarika Hotel",rating: 5, image:"images/dwarika.jpg", foodItems:foodsDwarika,position:"27.6815169,85.321739,17z");
Hotel syanko =Hotel(name:"Syanko",rating: 4, image:"images/syanko.png", foodItems:foodsSyanko,position:"27.6815169,85.321739,17z");
Hotel kfc =Hotel(name:"KFC",rating: 3,image:"images/kfc.png", foodItems:foodsKfc,position:"27.6815169,85.321739,17z");
Hotel BurgerHouse =Hotel(name:"Burger House",rating: 4, image:"images/burgerHouse.jpg", foodItems:foodsBurgerHouse,position:"27.6815169,85.321739,17z");
