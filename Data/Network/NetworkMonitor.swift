import Foundation
import Network

final class NetworkMonitor: ObservableObject, NetworkChecking {

    @Published private(set) var isConnected = true

    private let monitor = NWPathMonitor()

    private let queue = DispatchQueue(
        label: "NetworkMonitor"
    )

    init() {
        startMonitoring()
    }

    private func startMonitoring() {

        monitor.pathUpdateHandler = { [weak self] path in

            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }

        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}
