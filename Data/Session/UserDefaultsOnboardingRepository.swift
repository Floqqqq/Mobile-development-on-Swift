import Foundation

final class LocalSessionRepository: SessionRepository {

    func hasValidSession() async -> Bool {
        return false
    }
}
