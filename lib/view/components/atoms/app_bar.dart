import 'package:flutter/material.dart';
import '../../../core/constans/fonts.dart';

// AppBar
// 戻るボタンとタイトルと機能ボタンを表示する
class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({
    super.key,
    required this.titleText,
    this.featureIconButton,
    this.popFunction,
  });

  // 必ず必要
  final String titleText; // タイトル
  // null許容
  final IconButton? featureIconButton; // 右側のアイコン　必要なときとそうでないときがあるため、nullを許容する
  final bool Function()? popFunction; // 右側のアイコン タップ時の処理

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // タイトル
      centerTitle: true, // android向けにタイトルが真ん中であると明示する
      title: Text(
        titleText,
        style: Fonts.titleFont,
      ),
      // 右側のアイコン
      // nullチェック !でnullでないことを保証
      actions: featureIconButton != null ? <Widget>[featureIconButton!] : [],
    );
  }

  // 高さの設定
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
