import 'package:flutter/material.dart';
import 'package:noteapp/app_localizations.dart';
import 'package:noteapp/providers/auth_provider.dart';
import 'package:noteapp/providers/theme_provider.dart';
import 'package:noteapp/routes.dart';
import 'package:noteapp/ui/setting/setting_language_actions.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("settingAppTitle")),
      ),
      body: _buildLayoutSection(context),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
              AppLocalizations.of(context).translate("settingThemeListTitle")),
          subtitle: Text(AppLocalizations.of(context)
              .translate("settingThemeListSubTitle")),
          trailing: Switch(
            activeThumbColor: Theme.of(context).appBarTheme.backgroundColor,
            activeTrackColor:
                Theme.of(context).textTheme.titleMedium?.color ??
                    Theme.of(context).colorScheme.primary,
            value: Provider.of<ThemeProvider>(context).isDarkModeOn,
            onChanged: (booleanValue) {
              Provider.of<ThemeProvider>(context, listen: false)
                  .updateTheme(booleanValue);
            },
          ),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)
              .translate("settingLanguageListTitle")),
          subtitle: Text(AppLocalizations.of(context)
              .translate("settingLanguageListSubTitle")),
          trailing: SettingLanguageActions(),
        ),
        ListTile(
          title: Text(
              AppLocalizations.of(context).translate("settingLogoutListTitle")),
          subtitle: Text(AppLocalizations.of(context)
              .translate("settingLogoutListSubTitle")),
          trailing: ElevatedButton(
              onPressed: () {
                _confirmSignOut(context);
              },
              child: Text(AppLocalizations.of(context)
                  .translate("settingLogoutButton"))),
        )
      ],
    );
  }

  _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(AppLocalizations.of(context).translate("alertDialogTitle")),
        content:
            Text(AppLocalizations.of(context).translate("alertDialogMessage")),
        actions: <Widget>[
          TextButton(
            child: Text(
                AppLocalizations.of(context).translate("alertDialogCancelBtn")),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
          TextButton(
            child: Text(
                AppLocalizations.of(context).translate("alertDialogYesBtn")),
            onPressed: () {
              final authProvider =
                  Provider.of<AuthProvider>(context, listen: false);

              authProvider.signOut();

              Navigator.of(dialogContext).pop();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.login, ModalRoute.withName(Routes.login));
            },
          )
        ],
      ),
    );
  }
}
