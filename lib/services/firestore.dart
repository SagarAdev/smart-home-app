import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService{
  final CollectionReference data = FirebaseFirestore.instance.collection('data');

  Future<void> addData(String temp, String humid){
    return data.add({
      'humid':humid,
      'temp':temp,
      'timestamp':Timestamp.now(),
    });
  }

  Future<QuerySnapshot> getData(){
    return  data.orderBy('timestamp',descending:true).snapshots().first;
  }
}
