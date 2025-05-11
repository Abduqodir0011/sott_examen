import 'package:bloc/bloc.dart';
import 'package:sott_examen/data/repository/home_repository.dart';
import 'package:sott_examen/features/home/managers/home_state.dart';
part 'home_events.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc({required HomeRepository repo})
      : _repo = repo,
        super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad());
  }
  final HomeRepository _repo;

  Future<void> _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final products = await _repo.fetchProducts();
      emit(state.copyWith(products: products, status: HomeStatus.success));
    } catch (d) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}