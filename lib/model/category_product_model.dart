class CategoryProductModel{

  String name, image, description,  price;
  CategoryProductModel({this.name,this.image,this.description,this.price});
  CategoryProductModel.fromJson(Map <String , dynamic> map){
    if( map == null)
    {return ;}

    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];

  }
  toJson(){
    return {
      'name': name,
      'image':image,
      'description':description,
      'price':price,
    };
  }
}