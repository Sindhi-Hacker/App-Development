#!/bin/bash

echo "🚀 Running first-time setup..."

# Fix SDK path
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Update SDK
sdkmanager --update || true

# Flutter setup
flutter doctor || true

echo "✅ Setup complete!"
