import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smc_iot/constant.dart';
import 'package:smc_iot/model/EspDataModel/EspModel.dart';
part 'esp_state.dart';

class EspCubit extends Cubit<EspState> {
  EspCubit() : super(EspInitial());

  List<DataModel> Esp=[];
  int? value;


void toggle(index2,context,index) {
  emit(LoadingToggle());
    FirebaseFirestore.instance
        .collection('$Token')
        .doc(
        '$Token${EspCubit.get(context).Esp[index].Name}')
        .update({
      'auto': index2 == 1 ? true : false
    });
  emit(FinishToggle());
  }
  void getEspData(){
    emit(EspLoading());
    FirebaseFirestore.instance
        .collection('$Token')
        .snapshots().listen((event) {
          Esp=[];
          event.docs.forEach((element) {
            Esp.add(DataModel.fromJson(element.data()));

          });

          emit(EspSuccess());
    });

  }





  static EspCubit get(context) => BlocProvider.of(context);
}
