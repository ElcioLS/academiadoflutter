import 'package:academiadoflutter/src/core/extensions/formatter_extensions.dart';
import 'package:academiadoflutter/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/env/env.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: LayoutBuilder(builder: (_, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: constraints.maxHeight * .6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${Env.instance.get('backend_base_url')}/storage/flutterweb.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Curso de Flutter Web ADF',
                style: context.textStyles.textMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(49.99.CurrencyPTBR),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Editar',
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
