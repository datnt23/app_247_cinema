import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  CollectionReference banner = FirebaseFirestore.instance.collection('Banner');
  CollectionReference genre = FirebaseFirestore.instance.collection('Genre');

}