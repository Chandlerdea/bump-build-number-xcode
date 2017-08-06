#!/bin/bash

# stash whatever we haven't committed
git stash save

buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}")
buildNumber=$(($buildNumber + 1))
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$INFOPLIST_FILE"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" Info.plist

# commit 
git commit -am "Bumping build number to ${buildNumber} for archive"
