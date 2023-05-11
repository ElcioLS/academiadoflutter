import 'package:academiadoflutter/src/core/ui/styles/colors_app.dart';
import 'package:academiadoflutter/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../models/payment_type_model.dart';

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeModel payment;

  const PaymentTypeItem({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    final colorAll = payment.enabled ? Colors.black : Colors.grey;

    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/icons/payment_${payment.acronym}_icon.png',
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/icons/payment_notfound_icon.png',
                    color: colorAll,
                  );
                },
                color: colorAll,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forma de pagamento',
                    style: context.textStyles.textRegular.copyWith(
                      color: colorAll,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    payment.name,
                    style: context.textStyles.textTitle.copyWith(
                      color: colorAll,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Editar',
                      style: context.textStyles.textMedium.copyWith(
                        color: payment.enabled
                            ? context.colors.primary
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
