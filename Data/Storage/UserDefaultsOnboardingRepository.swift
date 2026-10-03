import Foundation

final class UserDefaultsOnboardingRepository: OnboardingRepository {

    private let defaults: UserDefaults

    private let onboardingKey = "hasCompletedOnboarding"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    var hasCompletedOnboarding: Bool {
        defaults.bool(forKey: onboardingKey)
    }

    func completeOnboarding() {
        defaults.set(true, forKey: onboardingKey)
    }
}
