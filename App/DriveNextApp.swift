import SwiftUI

@main
struct DriveNextApp: App {

    private let networkMonitor =
        NetworkMonitor()

    private let onboardingRepository =
        UserDefaultsOnboardingRepository()

    private let sessionRepository =
        LocalSessionRepository()

    var body: some Scene {

        WindowGroup {

            RootView(
                networkMonitor: networkMonitor,
                onboardingRepository:
                    onboardingRepository,
                sessionRepository:
                    sessionRepository
            )
        }
    }
}

