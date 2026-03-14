import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutPage extends HookConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider).requireValue;
    final appInfo = ref.watch(appInfoProvider).requireValue;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.about.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.logo.svg(width: 80, height: 80),
            const Gap(16),
            Text(
              Constants.appName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const Gap(4),
            Text(
              "v${appInfo.presentVersion}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
            const Gap(32),
            Text(
              "by SohoRoom",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
            const Gap(16),
            FilledButton.tonalIcon(
              icon: const Icon(FluentIcons.send_24_regular),
              label: const Text("@ConsoleWriteBug"),
              onPressed: () async {
                await UriUtils.tryLaunch(Uri.parse(Constants.telegramChannelUrl));
              },
            ),
          ],
        ),
      ),
    );
  }
}
