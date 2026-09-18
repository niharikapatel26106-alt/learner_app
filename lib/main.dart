import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_menu_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/notifications_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LearnerApp());
}

class LearnerApp extends StatelessWidget {
  const LearnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learner App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/home': (_) => const HomeScreen(),
        '/favorites': (_) => const FavoritesScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/settings-menu': (_) => const SettingsMenuScreen(),
        '/settings': (_) => const SettingsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final item = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => DetailScreen(item: item),
          );
        }
        return null;
      },
    );
  }
}
