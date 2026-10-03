import SwiftUI

struct OnboardingPageView: View {

    let page: OnboardingPage

    var body: some View {

        VStack(spacing: 20) {

            Spacer()

            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(
                    maxWidth: 320,
                    maxHeight: 320
                )

            VStack(spacing: 10) {

                Text(page.title)
                    .font(.system(
                        size: 24,
                        weight: .bold
                    ))
                    .multilineTextAlignment(.center)

                Text(page.description)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }

            Spacer()
        }
    }
}
