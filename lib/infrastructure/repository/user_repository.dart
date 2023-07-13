import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/user.dart';
import 'local_storage_repository.dart';

final UserRepository userRepositoryProvider = UserRepository(localStorageProvider.isarInstance);

final userProvider = StateNotifierProvider<UserRepository, User?>((ref) => userRepositoryProvider);

class UserRepository extends StateNotifier<User?>{
  final IsarCollection<User> _users;

  UserRepository(Isar isar) : _users = isar.users, super(null) {
    Future.microtask(() async {
      state = await isUserLoggedIn ? (await getUsers()).first : null;
    });
  }

  get isUserLoggedIn async => await _users.where().count() > 0;

  Future<List<User>> getUsers({int userID = 0}) async {
    if (userID > 0) {
      return _users.where().filter().userIdEqualTo(userID).findAll();
    }

    return _users.where().findAll();
  }

  Future<void> addUser(User user, {bool appendUser = false}) async {
    if(!appendUser){
      await _users.clear();
    }

    await _users.put(user).then((value) => state = user);
  }

  Future<bool> removeUser(User user) async {
    await _users.where().filter().userIdEqualTo(user.userId).deleteAll().then((value) => state = null);
    return (await getUsers()).isNotEmpty;
  }

  // static void logout(BuildContext context) => showModalBottomSheet(context: context, builder: (context) => const LogoutModalSheet()).then((doLogout) async {
  //   if (doLogout ?? false) {
  //     updateFCMAndLogout(context);
  //   }
  // });

}
