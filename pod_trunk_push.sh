#!/bin/sh

# pod trunk push ContentProvidersFileSystem.podspec
pod trunk push --synchronous --allow-warnings ContentProvidersSQLite.podspec
# pod trunk push ContentProvidersUserDefaults.podspec
pod trunk push --allow-warnings ContentProviders.podspec
