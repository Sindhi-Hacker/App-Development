FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 🔹 Base tools
RUN apt update && apt install -y \
    curl wget unzip git zip \
    openjdk-17-jdk \
    nodejs npm \
    python3 \
    build-essential \
    cmake \
    clang \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# 🔹 Install .NET
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && bash dotnet-install.sh --channel 8.0 \
    && rm dotnet-install.sh

ENV PATH="$PATH:/root/.dotnet"

# 🔹 Install Flutter
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
ENV PATH="$PATH:/opt/flutter/bin"

# 🔹 Android SDK
ENV ANDROID_HOME=/opt/android-sdk

RUN mkdir -p $ANDROID_HOME/cmdline-tools

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O sdk.zip \
    && unzip sdk.zip -d $ANDROID_HOME/cmdline-tools \
    && mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest \
    && rm sdk.zip

ENV PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"

# Accept licenses
RUN yes | sdkmanager --licenses || true

# Install SDK components
RUN sdkmanager \
    "platform-tools" \
    "platforms;android-34" \
    "build-tools;34.0.0"

# 🔹 React Native + Expo
RUN npm install -g expo-cli react-native-cli

WORKDIR /workspace
