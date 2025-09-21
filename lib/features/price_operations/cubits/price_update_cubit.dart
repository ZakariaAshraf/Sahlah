import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/price_entry_model.dart';
import '../../../data/services/firestore_service.dart';

part 'price_update_state.dart';

class PriceUpdateCubit extends Cubit<PriceUpdateState> {
  PriceUpdateCubit() : super(PriceUpdateInitial());

  final FirestoreService _service = FirestoreService();

  updatePrice(
    String categoryId,
    String subcategoryId,
    String productId,
    PriceEntry entry,
      String supermarketId,
  ) async {
    try {
      emit(PriceUpdateLoading());
      await _service.addPrice(categoryId, subcategoryId, productId, entry,supermarketId);
      emit(PriceUpdateSuccess());
    } on Exception catch (e) {
      emit(PriceUpdateFailed(errorMessage: e.toString()));
    }
  }
}
