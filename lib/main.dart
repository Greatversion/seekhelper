import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seekhelperpro/view_model/userViewModel.dart';

import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}
