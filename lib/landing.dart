import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/services/model.dart';
import 'package:flutter_application_1/services/services.dart';
import 'package:provider/provider.dart';

class LandnigPage extends StatelessWidget {
  const LandnigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Provider.of<UserModel?>(context);
    final bool check = userModel != null;
    return check ? const HomePage() : const AuthPage();
  }
}
