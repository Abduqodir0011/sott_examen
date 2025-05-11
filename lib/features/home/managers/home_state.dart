import 'package:equatable/equatable.dart';
import 'package:sott_examen/data/model/home_model.dart';

enum HomeStatus { idle, loading, success, error }

class HomeState extends Equatable {
  final List<HomeModel> products;
  final HomeStatus status;

  const HomeState({
    this.products = const [],
    this.status = HomeStatus.idle,
  });

  HomeState copyWith({
    List<HomeModel>? products,
    HomeStatus? status,
  }) {
    return HomeState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }
  factory HomeState.initial() => const HomeState();

  @override
  List<Object> get props => [products, status];
}