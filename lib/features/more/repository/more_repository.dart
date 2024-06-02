import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moreRepositoryProvider = Provider((ref) => MoreRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance));

class MoreRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  MoreRepository({required this.auth, required this.firebaseFirestore});

  Future<void> signOut() async {
    await auth.signOut();
  }
  Future<UserModel> getUser() async {
    final user = await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get();
    return UserModel.fromMap(user.data()!);
  }
}
