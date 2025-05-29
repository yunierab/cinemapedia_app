import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              SizedBox(width: 7),
              Text("Cinemapedia", style: titleStyle),
              Spacer(), //Con esto muevo lo de abajo hacia la parte mas a la derecha del Row
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: colors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
