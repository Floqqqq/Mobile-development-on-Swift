import SwiftUI

struct OnboardingView: View {

    @StateObject private var viewModel =
        OnboardingViewModel()

    let finishAction: () -> Void

    var body: some View {

        VStack(spacing: 0) {

            HStack {

                Spacer()

                Button("Пропустить") {
                    finishAction()
                }
                .foregroundStyle(.primary)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)

            TabView(
                selection: $viewModel.currentPage
            ) {

                ForEach(viewModel.pages) { page in

                    OnboardingPageView(
                        page: page
                    )
                    .tag(page.id)
                }
            }
            .tabViewStyle(
                .page(indexDisplayMode: .never)
            )

            pageIndicator

            Button {

                if viewModel.isLastPage {

                    finishAction()

                } else {

                    withAnimation {
                        viewModel.nextPage()
                    }
                }

            } label: {

                Text(
                    viewModel.isLastPage
                        ? "Поехали"
                        : "Далее"
                )
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
            }
            .frame(height: 52)
            .foregroundStyle(.white)
            .background(Color.purple)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 10
                )
            )
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }

    private var pageIndicator: some View {

        HStack(spacing: 8) {

            ForEach(
                0..<viewModel.pages.count,
                id: \.self
            ) { index in

                Capsule()
                    .fill(
                        index == viewModel.currentPage
                            ? Color.purple
                            : Color.gray.opacity(0.25)
                    )
                    .frame(
                        width:
                            index == viewModel.currentPage
                            ? 24
                            : 8,
                        height: 8
                    )
            }
        }
        .padding(.bottom, 20)
        .animation(
            .easeInOut,
            value: viewModel.currentPage
        )
    }
}
