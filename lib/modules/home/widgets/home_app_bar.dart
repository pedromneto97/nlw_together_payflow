import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/auth/auth_bloc.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/themes/text_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      color: AppColors.primary,
      child: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                    text: (state as SuccessAuthState).user.name,
                    style: TextStyles.titleBoldBackground,
                  ),
                ],
              ),
            ),
            subtitle: Text(
              'Mantenha sua contas em dia',
              style: TextStyles.captionShape,
            ),
            trailing: state.user.photoUrl.isNotEmpty
                ? Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(state.user.photoUrl),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(152);
}
