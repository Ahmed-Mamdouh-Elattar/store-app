import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/models/user_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  UserModel? userData;
  Future<UserModel?> getUserData() async {
    emit(UserDataLoading());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString(kUserId)!;
    try {
      QuerySnapshot<Map<String, dynamic>> userDataJson = await FirebaseFirestore
          .instance
          .collection('users')
          .where("user_id", isEqualTo: userId)
          .get();
      userData = UserModel.fromjson(userDataJson.docs[0]);
      emit(UserDataSuccess());
    } on Exception catch (e) {
      emit(UserDataFailure(error: e.toString()));
    }
    return userData;
  }
}
