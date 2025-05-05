// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/shopper/screens/cart_screen.dart';
import '../models/cart.dart';
import '../models/catalog.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(() {
            Navigator.pop(context);
          }),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyListItem(index),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed:
          isInCart
              ? null
              : () {
                var cart = context.read<CartModel>();
                cart.add(item);
              },
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child:
          isInCart
              ? const Icon(Icons.check, semanticLabel: 'ADDED')
              : const Text('ADD'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  const _MyAppBar(this.onPressed);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return SliverAppBar(
      title: Text('Products', style: Theme.of(context).appBarTheme.titleTextStyle),
      floating: true,
      leading: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_back),
          color: Colors.deepOrange
      ),
      actions: [
        IconButton(
          icon: cart.items.isEmpty? const Icon(Icons.shopping_cart) : Badge.count(count: cart.items.length, child: const Icon(Icons.shopping_cart)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()),);
          },
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: Container(color: item.color)),
            const SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme)),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
