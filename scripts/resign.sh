IPA="???"
APP_NAME="???"
SHARE_EXTENSION_NAME="???"
CERTIFICATION_NAME="???"
APP_PROVISIONING_FILE_PATH="???"
SHAREEX_PROVISION_FILE_PATH="???"

OUTPUT="output"
NEW_APP="resigned"

## 解凍
unzip "${IPA}" -d "${OUTPUT}" > /dev/null

## Info.plist の差し替え
## アプリ
cp plists/app_info.plist "${OUTPUT}"/Payload/"${APP_NAME}".app/Info.plist
## ShareExtension
cp plists/share_ex_info.plist "${OUTPUT}"/Payload/"${APP_NAME}".app/PlugIns/"${SHARE_EXTENSION_NAME}".appex/Info.plist

## プロビジョニングプロファイルの差し替え
## アプリ
cp "${APP_PROVISIONING_FILE_PATH}" "${OUTPUT}"/Payload/"${APP_NAME}".app/embedded.mobileprovision
## ShareExtension
cp "${SHAREEX_PROVISION_FILE_PATH}" "${OUTPUT}"/Payload/"${APP_NAME}".app/PlugIns/"${SHARE_EXTENSION_NAME}".appex/embedded.mobileprovision

## 先の署名情報削除
## アプリ
rm -rf "${OUTPUT}"/Payload/"${APP_NAME}".app/_CodeSignature
## ShareExtension
rm -rf "${OUTPUT}"/Payload/"${APP_NAME}".app/PlugIns/"${SHARE_EXTENSION_NAME}".appex/_CodeSignature

## 署名
## ShareExtension
codesign -f -s ""${CERTIFICATION_NAME}"" --entitlements entitlements/share_ex_entitlements.plist "${OUTPUT}"/Payload/"${APP_NAME}".app/PlugIns/"${SHARE_EXTENSION_NAME}".appex
## アプリ
codesign -f -s ""${CERTIFICATION_NAME}"" --entitlements entitlements/app_entitlements.plist "${OUTPUT}"/Payload/"${APP_NAME}".app

##ipa 化
zip -ry "${OUTPUT}"/"${NEW_APP}".ipa "${OUTPUT}" > /dev/null

## 削除
rm -rf "${OUTPUT}"/Payload