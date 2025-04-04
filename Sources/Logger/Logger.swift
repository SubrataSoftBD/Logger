import Foundation

public enum LogLevel: String {
    case debug = "🐛 DEBUG"
    case info = "ℹ️ INFO"
    case warning = "⚠️ WARNING"
    case error = "❌ ERROR"
    case wtf = "🚨 WTF"
}

public struct Logger {
    public static let isEnabled: Bool = true
    
    public static func log(_ level: LogLevel, _ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
        guard isEnabled else { return }
        
        let fileName = (file as NSString).lastPathComponent
        let timestamp = ISO8601DateFormatter().string(from: Date())
        
        print("\(level.rawValue) | \(timestamp) | \(fileName):\(line) | \(function) -> \(message)")
    }
    
    public static func debug(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
        log(.debug, message, file: file, function: function, line: line)
    }
    
    public static func info(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
        log(.info, message, file: file, function: function, line: line)
    }
    
    public static func warning(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
        log(.warning, message, file: file, function: function, line: line)
    }
    
    public static func error(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
        log(.error, message, file: file, function: function, line: line)
    }
    
    public static func wtf(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
        log(.wtf, message, file: file, function: function, line: line)
    }
}
