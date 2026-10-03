import Foundation

@MainActor
final class OnboardingViewModel: ObservableObject {

    @Published var currentPage = 0

    let pages: [OnboardingPage] = [

        OnboardingPage(
            id: 0,
            imageName: "onboarding_1",
            title: "Аренда автомобилей",
            description:
                "Открой для себя большой выбор автомобилей"
        ),

        OnboardingPage(
            id: 1,
            imageName: "onboarding_2",
            title: "Безопасно и удобно",
            description:
                "Арендуй автомобиль быстро и удобно"
        ),

        OnboardingPage(
            id: 2,
            imageName: "onboarding_3",
            title: "Лучшие предложения",
            description:
                "Выбирай подходящий вариант среди доступных автомобилей"
        )
    ]

    var isLastPage: Bool {
        currentPage == pages.count - 1
    }

    func nextPage() {

        guard currentPage < pages.count - 1 else {
            return
        }

        currentPage += 1
    }
}
