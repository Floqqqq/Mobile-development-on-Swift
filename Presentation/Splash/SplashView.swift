import SwiftUI

struct SplashView: View {

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            VStack {

                HStack {

                    VStack(
                        alignment: .leading,
                        spacing: 2
                    ) {

                        Text("DriveNext")
                            .font(.system(
                                size: 18,
                                weight: .semibold
                            ))

                        Text(
                            "Поможем найти твою следующую поездку"
                        )
                        .font(.system(size: 10))
                        .foregroundStyle(.secondary)
                    }

                    Spacer()
                }

                Spacer()

                Image("splash_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: 220,
                        maxHeight: 220
                    )

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
        }
    }
}
