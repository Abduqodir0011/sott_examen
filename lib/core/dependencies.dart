import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sott_examen/core/client.dart';
import 'package:sott_examen/data/repository/home_repository.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => HomeRepository(client: context.read())),
];
