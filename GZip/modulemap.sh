#!/bin/bash
set -e

echo `xcode-select -print-path`

function modulemap {
	PLATFORM_NAME=$1
	
	SDK=`xcrun --sdk $PLATFORM_NAME --show-sdk-path`
	SDK_VERSION=`xcrun --sdk $PLATFORM_NAME --show-sdk-version`

	TARGET_DIR=modules/$PLATFORM_NAME/$PLATFORM_NAME$SDK_VERSION
	mkdir -p $TARGET_DIR
	cat module.map.template | sed "s#TOKEN#$SDK#g" > tmp; cp tmp $TARGET_DIR/module.map
	TARGET_DIR=modules/$PLATFORM_NAME/$PLATFORM_NAME
	mkdir -p $TARGET_DIR
	mv tmp $TARGET_DIR/module.map
}

modulemap iphonesimulator
modulemap iphoneos