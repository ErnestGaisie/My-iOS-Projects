import UIKit

//articles = ["A", "B", "A", "C", "B", "D"]

//["A", "B", "C", "D"]

final class RateLimiter {
    private let maxRequests: Int
    private let windowSize: TimeInterval
    private var timestamps: [TimeInterval] = []

    init(maxRequests: Int, windowSize: TimeInterval) {
        self.maxRequests = maxRequests
        self.windowSize = windowSize
    }

    func canPerformRequest(at time: TimeInterval) -> Bool {
        // Remove timestamps outside the sliding window
        while let first = timestamps.first,
              time - first >= windowSize {
            timestamps.removeFirst()
        }

        // Check if we can allow this request
        if timestamps.count < maxRequests {
            timestamps.append(time)
            return true
        } else {
            return false
        }
    }
}
