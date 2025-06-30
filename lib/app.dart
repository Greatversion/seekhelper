import 'package:flutter/material.dart';
import 'package:seekhelperpro/models/userModel.dart';
import 'package:seekhelperpro/resources/themes.dart';
import 'package:seekhelperpro/views/addUserScreen.dart';
import 'package:seekhelperpro/views/home/homeScreen.dart';
import 'package:seekhelperpro/views/userDetails.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddUserScreen(),
        // For details, we'll handle arguments in onGenerateRoute instead
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final args = settings.arguments;
          if (args is int) {
            return MaterialPageRoute(
              builder: (context) => UserDetailScreen(userId: args),
            );
          }
          // If no valid argument passed, return error route or fallback
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text('Invalid or missing userId')),
            ),
          );
        }
        // Unknown route fallback
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
      },
    );
  }
}
