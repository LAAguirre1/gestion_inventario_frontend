import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/sidemenu_provider.dart';
import '../views/nopagefound_view.dart';

class NoPageFoundHandler {
  static Handler noPageFound = Handler(
    handlerFunc: (context, Map<String, List<String>> params) {
      Provider.of<SideMenuProvider>(context!, listen: false)
          .setCurrentPage("newPage");
      return const NoPageFoundView();
    },
  );
}
