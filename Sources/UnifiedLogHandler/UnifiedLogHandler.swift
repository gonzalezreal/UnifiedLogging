import Foundation
import Logging
import os.log

public struct UnifiedLogHandler: LogHandler {
    public var metadata: Logger.Metadata {
        get { formatter.metadata }
        set { formatter.metadata = newValue }
    }

    public var logLevel: Logger.Level = .info

    private let log: OSLog
    private var formatter = LogFormatter()

    public init(label: String) {
        log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: label)
    }

    public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get { formatter.metadata[key] }
        set { formatter.metadata[key] = newValue }
    }

    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file _: String, function _: String, line _: UInt) {
        os_log("%{PUBLIC}@", log: log, type: OSLogType(logLevel: level), formatter.format(message: message, metadata: metadata))
    }
}

private extension OSLogType {
    init(logLevel: Logger.Level) {
        switch logLevel {
        case .trace, .debug:
            self = .debug
        case .info, .notice, .warning:
            self = .info
        case .error:
            self = .error
        case .critical:
            self = .fault
        }
    }
}
