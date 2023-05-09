import 'package:flutter/material.dart';

import '../../core/env/env.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader();
          await Future.delayed(const Duration(seconds: 5));
          hideLoader();
          // showError('Erro qualquer');
          showWarning('atenção');
        },
      ),
      body: Column(
        children: [
          Text(
            Env.instance.get('backend_base_url'),
          ),
          Text(
            context.screenWidget.toString(),
          ),
          Container(
            color: context.colors.primary,
            width: context.percentWidth(.5),
            height: context.percentHeight(.3),
            child: Text(
              'ExtraBold',
              style: context.textStyles.textBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Login'),
                ),
                validator: (String) => 'Erro',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão'),
          ),
        ],
      ),
    );
  }
}
