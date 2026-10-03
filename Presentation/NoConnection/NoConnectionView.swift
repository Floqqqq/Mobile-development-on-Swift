import SwiftUI

struct NoConnectionView: View {

    let retryAction: () async -> Void

    @State private var isChecking = false

    var body: some View {

        VStack(spacing: 0) {

            Spacer()

            Image(
                systemName: "wifi.slash"
            )
            .font(.system(size: 64))
            .foregroundStyle(Color.purple)

            Text("Нет подключения\nк интернету")
                .font(.system(
                    size: 24,
                    weight: .bold
                ))
                .multilineTextAlignment(.center)
                .padding(.top, 24)

            Text(
                "Проверьте подключение и повторите попытку"
            )
            .font(.system(size: 14))
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.top, 12)

            Spacer()

            Button {

                Task {

                    isChecking = true

                    await retryAction()

                    isChecking = false
                }

            } label: {

                if isChecking {

                    ProgressView()
                        .tint(.white)
                        .frame(maxWidth: .infinity)

                } else {

                    Text("Повторить попытку")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 52)
            .foregroundStyle(.white)
            .background(Color.purple)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 10
                )
            )
            .disabled(isChecking)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}
