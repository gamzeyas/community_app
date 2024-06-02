import 'package:community_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firebasefirestore: FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseFirestore firebasefirestore;
  final FirebaseAuth auth;

  AuthRepository({required this.auth, required this.firebasefirestore});

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
  try {
    userModel.profilePhoto ??= "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    userModel.uid = auth.currentUser!.uid;
    await firebasefirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(userModel.toMap());
  } catch (e) {
    print("aha hata burada Firebase: $e");
  }
}

}
