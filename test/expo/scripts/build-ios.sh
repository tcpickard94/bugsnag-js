#!


# Lets make sure the build folder was cleared out correctly
echo rm
rm -rf $BUILDKITE_BUILD_CHECKOUT_PATH/build/*
echo cd
cd test/expo/features/fixtures/test-app
echo "npm i turtle"
npm i turtle-cli@0.14 bunyan
echo Perl
perl -0777 -i.original -pe "s/entitlements\\['aps-environment'\\] =[^;]+;//gs" node_modules/\@expo/xdl/build/detach/IosNSBundle.js
perl -0777 -i.original -pe "s/entitlements\\['aps-environment'\\] =[^;]+;//gs" node_modules/turtle-cli/node_modules/\@expo/xdl/build/detach/IosNSBundle.js
echo Team Id=$APPLE_TEAM_ID 
echo EXPO_P12_PATH=$EXPO_P12_PATH
echo EXPO_PROVISIONING_PROFILE_PATH=$EXPO_PROVISIONING_PROFILE_PATH
echo EXPO_RELEASE_CHANNEL=$EXPO_RELEASE_CHANNEL
echo BUILDKITE_BUILD_CHECKOUT_PATH=$BUILDKITE_BUILD_CHECKOUT_PATH

node_modules/.bin/turtle build:ios \
  -c ./app.json \
  --team-id $APPLE_TEAM_ID \
  --dist-p12-path $EXPO_P12_PATH \
  --provisioning-profile-path $EXPO_PROVISIONING_PROFILE_PATH \
  --release-channel $EXPO_RELEASE_CHANNEL \
  -o $BUILDKITE_BUILD_CHECKOUT_PATH/build/output.ipa
