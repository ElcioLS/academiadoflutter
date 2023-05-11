import 'package:academiadoflutter/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class PaymentTypeItem extends StatelessWidget {
  const PaymentTypeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Image.asset('assets/images/icons/payment_cc_icon.png'),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forma de pagamento',
                    style: context.textStyles.textRegular,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'CARTÃO DE CRÉDITO',
                    style: context.textStyles.textTitle.copyWith(fontSize: 14),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Editar'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
