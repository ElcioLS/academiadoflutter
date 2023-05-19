import 'package:academiadoflutter/src/core/extensions/formatter_extensions.dart';
import 'package:academiadoflutter/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              'X-trtfdd',
              style: context.textStyles.textRegular,
            ),
          ),
          Text('15', style: context.textStyles.textRegular),
          Expanded(
            child: Text(
              100.0.CurrencyPTBR,
              textAlign: TextAlign.end,
              style: context.textStyles.textRegular,
            ),
          ),
        ],
      ),
    );
  }
}
