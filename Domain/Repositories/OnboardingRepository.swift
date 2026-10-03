import Foundation

protocol OnboardingRepository {
    var hasCompletedOnboarding: Bool { get }

    func completeOnboarding()
}
