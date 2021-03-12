import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDB {

  final _dbConnection = FirebaseFirestore.instance;

  void addDataInDB(String collectionName , String docName , Map<String , dynamic>docFields){
    _dbConnection.collection(collectionName).doc(docName).set(docFields);
  }

}