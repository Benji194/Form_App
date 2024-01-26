import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body:  BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Nombre de Usuario',
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              _formkey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo Requerido';
              if (value.trim().isEmpty) return 'Campo Requerido';
              if (value.trim().length < 6) return 'Se requiere mas de 6 letras';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Correo Electronico',
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formkey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo Requerido';
              if (value.trim().isEmpty) return 'Campo Requerido';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value))
                return 'No tiene formato de correo';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formkey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo Requerido';
              if (value.trim().isEmpty) return 'Campo Requerido';
              if (value.trim().length < 6) return 'Se requiere mas de 6 letras';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formkey.currentState!.validate();
              if (!isValid) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
