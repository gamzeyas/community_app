import 'package:community_app/features/more/repository/more_repository.dart';
import 'package:community_app/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moreControllerProvider = Provider((ref) {
  final moreRepository = ref.watch(moreRepositoryProvider);
  return MoreController(moreRepository: moreRepository);
});

class MoreController {
  final MoreRepository moreRepository;

  MoreController({required this.moreRepository});

  Future<void> signOut() async {
    await moreRepository.signOut();
  }

  Future<UserModel> getUser() async {
    return await moreRepository.getUser();
  }
}
