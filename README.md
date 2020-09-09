# 概要

本スクリプトはShareExtension を含む IPA の entitlements.plist や Info.plist に変更を加え、再署名を行うのを簡単に実施できるようにするためのものである。

# 各ファイルについて

*  `get_entitlements_and_info_plist.sh`  
IPA ファイルから `entitlements.plist` および `Info.plist` を抜き出す  
* `resign.sh`  
IPA ファイルを再署名します

# 使用手順

## 前提

* 配布証明書などが keychain に登録されていること
* プロビジョニングプロファイルは作成済みでローカルにダウンロードしていること
ShareExtension および アプリの両方

## 手順

1. 各スクリプトの定数の内容を適切な内容に書き換える  
2. `get_entitlements_and_info_plist.sh`  を実行する  
`/entitlements` および `/plist` ディレクトリが作成され、.plist ファイルが格納される
2. plist ファイルを任意の内容に書き換える
3. `resign.sh` を実行して再署名をする

# 補足

* 本スクリプトは十分にエラー処理などされていない。使用には十分注意すること。
