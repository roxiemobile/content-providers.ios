#!/bin/sh

pod trunk push --synchronous ContentProvidersFileSystem.podspec
pod trunk push --synchronous --allow-warnings ContentProvidersSQLite.podspec
pod trunk push --synchronous ContentProvidersUserDefaults.podspec
pod trunk push --allow-warnings ContentProviders.podspec
