import 'package:mobile_shop_management_system/controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => LoginNotifier()),
];
