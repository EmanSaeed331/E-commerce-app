import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryServices {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('CategoriesCallection');

  Future <List<QueryDocumentSnapshot>> getMenCategory() async {
    var value = await _collectionReference.get();
    return value.docs;

}
}
