import Foundation

enum AppScreen {
    case splash
    case noConnection
    case onboarding
    case auth
    case home
}

@MainActor
final class AppViewModel: ObservableObject {

    @Published private(set) var screen: AppScreen = .splash

    private let networkMonitor: NetworkChecking
    private let onboardingRepository: OnboardingRepository
    private let sessionRepository: SessionRepository

    init(
        networkMonitor: NetworkChecking,
        onboardingRepository: OnboardingRepository,
        sessionRepository: SessionRepository
    ) {
        self.networkMonitor = networkMonitor
        self.onboardingRepository = onboardingRepository
        self.sessionRepository = sessionRepository
    }

    func start() async {

        screen = .splash

        try? await Task.sleep(
            for: .seconds(2)
        )

        await determineNextScreen()
    }

    func retryConnection() async {

        guard networkMonitor.isConnected else {
            screen = .noConnection
            return
        }

        await determineNextScreen()
    }

    func finishOnboarding() {

        onboardingRepository.completeOnboarding()

        screen = .auth
    }

    private func determineNextScreen() async {

        guard networkMonitor.isConnected else {
            screen = .noConnection
            return
        }

        guard onboardingRepository.hasCompletedOnboarding else {
            screen = .onboarding
            return
        }

        let hasValidSession =
            await sessionRepository.hasValidSession()

        screen = hasValidSession
            ? .home
            : .auth
    }
}
