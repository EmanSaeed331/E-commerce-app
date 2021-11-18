import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices{
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _ProductcollectionReference =
  FirebaseFirestore.instance.collection('Products');

  Future <List<QueryDocumentSnapshot>> getCategory() async {
     var value = await _collectionReference.get();
     return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _ProductcollectionReference.get();
    return value.docs;
  }
}