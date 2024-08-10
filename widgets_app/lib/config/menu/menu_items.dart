import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en flutter',
      link: 'buttons_screen',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: 'cards_screen',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.check_box_outlined)
];
