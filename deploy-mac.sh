#!/bin/zsh

rm -rf /Applications/gw.app

flutter build macos

cp -r ./build/macos/Build/Products/Release/gw_fast_starter.app /Applications/gw.app
