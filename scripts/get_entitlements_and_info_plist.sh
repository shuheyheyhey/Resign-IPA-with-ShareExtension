IPA="???"
APP_NAME="???"
SHARE_EXTENSION_NAME="???"

## ipa を解凍
unzip "$IPA" -d temp

## entitlements の抜き出し
mkdir entitlements
## アプリ
codesign -d --entitlements :- temp/Payload/"${APP_NAME}".app > entitlements/app_entitlements.plist
## ShareExtension
codesign -d --entitlements :- temp/Payload/"${APP_NAME}".app/PlugIns/"${SHARE_EXTENSION_NAME}".appex > entitlements/share_ex_entitlements.plist

## Info.plist の抜き出し
mkdir plists
## アプリ
cp temp/Payload/"${APP_NAME}".app/Info.plist plists/app_info.plist
## ShareExtension
cp temp/Payload/"${APP_NAME}".app/PlugIns/"${SHARE_EXTENSION_NAME}".appex/Info.plist plists/share_ex_info.plist

## 掃除
rm -rf temp
