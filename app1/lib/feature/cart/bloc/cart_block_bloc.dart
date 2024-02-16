import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_block_event.dart';
part 'cart_block_state.dart';

class CartBlockBloc extends Bloc<CartBlockEvent, CartBlockState> {
  CartBlockBloc() : super(CartBlockInitial()) {
    on<CartBlockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
