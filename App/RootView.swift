import SwiftUI

struct RootView: View {

    @StateObject private var viewModel: AppViewModel

    init(
        networkMonitor: NetworkChecking,
        onboardingRepository: OnboardingRepository,
        sessionRepository: SessionRepository
    ) {

        _viewModel = StateObject(
            wrappedValue: AppViewModel(
                networkMonitor: networkMonitor,
                onboardingRepository:
                    onboardingRepository,
                sessionRepository:
                    sessionRepository
            )
        )
    }

    var body: some View {

        Group {

            switch viewModel.screen {

            case .splash:

                SplashView()

            case .noConnection:

                NoConnectionView {

                    await viewModel.retryConnection()
                }

            case .onboarding:

                OnboardingView {

                    viewModel.finishOnboarding()
                }

            case .auth:

                AuthPlaceholderView()

            case .home:

                HomePlaceholderView()
            }
        }
        .task {
            await viewModel.start()
        }
    }
}
