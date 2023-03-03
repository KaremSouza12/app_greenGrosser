import 'package:app_greengrosser/src/pages/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:app_greengrosser/src/config/app_data.dart' as app_data;
import 'package:go_router/go_router.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //Email
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
            initialValue: app_data.user.email,
            readOnly: true,
          ),
          //Nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: app_data.user.name,
            readOnly: true,
          ),
          //Celular
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            initialValue: app_data.user.phone,
            readOnly: true,
          ),
          //CPF
          CustomTextField(
            icon: Icons.copy,
            label: 'CPF',
            initialValue: app_data.user.cpf,
            readOnly: true,
          ),
          //Senha
          CustomTextField(
            initialValue: app_data.user.password,
            icon: Icons.file_copy,
            label: 'Senha',
            isSecret: true,
            readOnly: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: const BorderSide(color: Colors.green),
              ),
              onPressed: () {
                updatePassord();
              },
              child: const Text('Atualizar senha'),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassord() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Atualização de Senha',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha Antiga',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_clock_outlined,
                        label: 'Nova Senha',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_clock_outlined,
                        label: 'Confirmar Senha',
                        isSecret: true,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Atualizar'),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: context.pop,
                    icon: const Icon(Icons.close),
                  ),
                )
              ],
            ),
          );
        });
  }
}
