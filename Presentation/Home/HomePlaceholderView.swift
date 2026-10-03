import SwiftUI

struct HomePlaceholderView: View {

    var body: some View {

        VStack(spacing: 16) {

            Image(systemName: "car.fill")
                .font(.system(size: 64))
                .foregroundStyle(.purple)

            Text("Главный экран")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}
