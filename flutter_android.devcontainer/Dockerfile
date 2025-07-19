FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl unzip git xz-utils zip libglu1-mesa openjdk-17-jdk wget

# Set environment variables
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH=$PATH:/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /opt/flutter --branch stable

# Install Android SDK Command Line Tools
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && \
  cd $ANDROID_SDK_ROOT/cmdline-tools && \
  wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip && \
  unzip cmdline-tools.zip && \
  mv cmdline-tools latest && \
  rm cmdline-tools.zip

# Accept licenses and install Android components
RUN yes | sdkmanager --licenses && \
  sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Pre-cache Flutter
RUN flutter doctor
