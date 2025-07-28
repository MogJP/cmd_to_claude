# Claude Code Command Prompt Wrapper

Windows環境で、コマンドプロンプト等から直接`claude`コマンドを実行できます。
副産物として、VSCodeのデフォルトターミナルがpowershell/command promptでも、オレンジのclaude-codeボタンから起動できるようになります。

## アーキテクチャ

```
(VSCode →) cmd → claude(中身はclaude.bat) → WSL → claude
```

## 特徴

- ✅ VSCodeのデフォルトターミナル(cmd)を維持
- ✅ `claude`ボタン/`claude`コマンドのみWSLで実行
- ✅ 管理者権限不要
- ✅ 安全な手動PATH設定方式
- ✅ インストール・アンインストールスクリプト付き

## 必要条件

- Windows 10/11
- WSL (Windows Subsystem for Linux)
- WSL内にClaude Code CLI がインストール済み

## インストール

1. このリポジトリをクローンまたはダウンロード
2. `scripts/install.bat`をダブルクリック実行
3. 表示される手順に従ってPATH環境変数を手動設定
4. VSCodeまたはコマンドプロンプトを再起動

### 手動PATH設定手順

インストール時にも表示されますが、以下の手順でPATH環境変数を設定してください：

1. `Win + R` → `sysdm.cpl` → Enter
2. 「詳細設定」タブ → 「環境変数」ボタン
3. 「ユーザー環境変数」の「Path」を選択 → 「編集」
4. 「新規」をクリックして `C:\Tools\claude\` を追加
5. すべてのダイアログで「OK」をクリック
6. VSCodeまたはコマンドプロンプトを再起動

## 使用方法

インストール完了後、VSCodeのClaude Code拡張機能が正常に動作します。

```cmd
claude --version
```

## アンインストール

1. `scripts/uninstall.bat`をダブルクリック実行
2. 表示される手順に従ってPATH環境変数から手動削除
3. オプションでインストールディレクトリも削除可能

## ファイル構成

```
cmd_to_claude/
├── scripts/
│   ├── claude.bat              # メインラッパースクリプト
│   ├── install.bat             # インストールスクリプト
│   ├── uninstall.bat           # アンインストールスクリプト
│   └── test.bat               # 動作テストスクリプト
└── README.md
```

## 技術詳細

- **配置場所**: `C:\Tools\claude\` (固定)
- **PATH設定**: ユーザー環境変数のみ（システム環境変数は変更しません）
- **安全性**: 手動PATH設定でPATH破壊リスクを回避
- **文字コード**: batはASCII文字のみ使用で文字化け防止

## 貢献

バグ報告や機能要望は[Issues](https://github.com/MogJP/cmd_to_claude/issues)からお願いします。

## 📄 ライセンス

**非商用・再配布制限ライセンス** - 詳細は [LICENSE](LICENSE) ファイルを参照

- ✅ 個人・非商用利用: 自由に使用可能
- ❌ 商用利用: 禁止
- ❌ 再配布: 事前許可が必要

商用利用や再配布をご希望の場合は [GitHub Issues](../../issues) でお問い合わせください。

## サポート

このプロジェクトが役に立った場合は、ぜひサポートをお願いします！

[![Buy Me A Coffee](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png)](https://buymeacoffee.com/mog_jp)

---

作成者: [@MogJP](https://github.com/MogJP)