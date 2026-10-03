import Foundation

protocol SessionRepository {
    func hasValidSession() async -> Bool
}
