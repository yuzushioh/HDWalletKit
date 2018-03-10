public final class HDWallet {

    private let masterPrivateKey: HDPrivateKey
    private let network: Network

    public init(seed: Data, network: Network) {
        self.masterPrivateKey = HDPrivateKey(seed: seed, network: network)
        self.network = network
    }

    // MARK: - Public Methods

    public func generateExternalPrivateKey(at index: UInt32) throws -> HDPrivateKey {
        return try externalPrivateKey().derived(at: index)
    }

    public func generateInteranlPrivateKey(at index: UInt32) throws -> HDPrivateKey {
        return try internalPrivateKey().derived(at: index)
    }

    // MARK: - Private Methods

    private func externalPrivateKey() throws -> HDPrivateKey {
        return try privateKey(change: .external)
    }

    private func internalPrivateKey() throws -> HDPrivateKey {
        return try privateKey(change: .internal)
    }

    private enum Change: UInt32 {
        case external = 0
        case `internal` = 1
    }

    // m/44'/coin_type'/0'/external
    private func privateKey(change: Change) throws -> HDPrivateKey {
        return try masterPrivateKey
            .derived(at: 44, hardens: true)
            .derived(at: network.coinType, hardens: true)
            .derived(at: 0, hardens: true)
            .derived(at: change.rawValue)
    }
}
