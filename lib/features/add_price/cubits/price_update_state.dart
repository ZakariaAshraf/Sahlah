part of 'price_update_cubit.dart';

@immutable
sealed class PriceUpdateState {}

final class PriceUpdateInitial extends PriceUpdateState {}
final class PriceUpdateSuccess extends PriceUpdateState {}
final class PriceUpdateLoading extends PriceUpdateState {}
final class PriceUpdateFailed extends PriceUpdateState {
 final String errorMessage;
 PriceUpdateFailed({required this.errorMessage});
}
