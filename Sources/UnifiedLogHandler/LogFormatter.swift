import Foundation
import Logging

public struct LogFormatter {
    public var metadata = Logger.Metadata() {
        didSet { prettyMetadata = metadata.formatted }
    }

    private var prettyMetadata: String?

    public init() {}

    public func format(message: Logger.Message, metadata: Logger.Metadata?) -> String {
        guard let formattedMetadata = metadata?.isEmpty ?? true
            ? self.prettyMetadata
            : self.metadata.merging(metadata!, uniquingKeysWith: { _, new in new }).formatted else {
            return "\(message)"
        }

        return "\(message)\n ├─ Metadata\n\(formattedMetadata)"
    }
}

private extension Logger.Metadata {
    var formatted: String {
        sorted { $0.key < $1.key }.map {
            " │ \($0.key): \($0.value)"
        }.joined(separator: "\n")
    }
}
