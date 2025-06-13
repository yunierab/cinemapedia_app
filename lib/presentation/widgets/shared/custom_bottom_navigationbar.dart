import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //Este tipo de widget pide como minimo dos widget hijos
      elevation: 0,
      currentIndex: getCurrentIndex(
        context,
      ), //Con esto logro que se muestre la pestaña activa con el color
      onTap: (value) {
        //Aqui controlamos la navegacion a cada una de las pestañas inferiores
        onItemTapped(context, value);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outlined),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/categories');
        break;
      case 2:
        context.go('/favorites');
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    String location = GoRouterState.of(context).uri.toString();
    if (location == '/') {
      return 0;
    } else if (location == '/categories') {
      return 1;
    } else if (location == '/favorites') {
      return 2;
    } else {
      return 0;
    }
  }
}
