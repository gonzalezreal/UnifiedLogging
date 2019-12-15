# UnifiedLogHandler
![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS+tvOS+watchOS+macOS-brightgreen.svg?style=flat)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![Twitter: @gonzalezreal](https://img.shields.io/badge/twitter-@gonzalezreal-blue.svg?style=flat)](https://twitter.com/gonzalezreal)

**UnifiedLogHandler** is a [SwiftLog](https://github.com/apple/swift-log) backend that uses Apple's [Unified Logging System](https://developer.apple.com/documentation/os/logging).

You can instruct `SwiftLog` to use the `UnifiedLogHandler` backend as follows:

```Swift
import Logging
import UnifiedLogHandler

LoggingSystem.bootstrap(UnifiedLogHandler.init)
```

The `UnifiedLogHandler` creates an `OSLog` for each `Logger` in your application or its libraries. It uses the application's bundle identifier and the `Logger`'s label as the `OSLog` subsystem and category, respectively.

For example:

```Swift
let logger = Logger(label: "APIClient")
logger.info("Something happened")
```

Prints the following output:

```
2019-12-15 18:22:10.357062+0100 MyApp[63417:16193919] [APIClient] Something happened
```

You can also use metadata when logging. For example:

```Swift
logger.info("Something happened", metadata: ["foo": ["bar": "baz"]])
```

Prints the following output:

```
2019-12-15 18:34:01.424326+0100 MyApp[63587:16235713] [APIClient] Something happened
├─ Metadata
│ foo: ["bar": "baz"]
```

## Installation
**Using the Swift Package Manager**

Add UnifiedLogHandler as a dependency to your `Package.swift` file. For more information, see the [Swift Package Manager documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

```
.package(url: "https://github.com/gonzalezreal/UnifiedLogHandler", from: "1.0.0")
```

## Help & Feedback
- [Open an issue](https://github.com/gonzalezreal/UnifiedLogHandler/issues/new) if you need help, if you found a bug, or if you want to discuss a feature request.
- [Open a PR](https://github.com/gonzalezreal/UnifiedLogHandler/pull/new/master) if you want to make some change to `UnifiedLogHandler`.
- Contact [@gonzalezreal](https://twitter.com/gonzalezreal) on Twitter.
