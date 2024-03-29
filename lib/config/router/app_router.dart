import 'package:form_app/presentation/screen/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes:   [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const HomeScreen(),
    ),
    GoRoute(
      path: '/cubits',
      builder: (context, state) =>  const CubitCounter(),
    ),

  ] 
);