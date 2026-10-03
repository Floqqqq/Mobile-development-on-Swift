import SwiftUI

struct AuthPlaceholderView: View {

    var body: some View {

        VStack(spacing: 16) {

            Image(systemName: "person.crop.circle")
                .font(.system(size: 64))
                .foregroundStyle(.purple)

            Text("Вход / регистрация")
                .font(.title2)
                .fontWeight(.bold)

            Text(
                "Экран будет реализован в следующей лабораторной работе"
            )
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
        .padding()
    }
}
