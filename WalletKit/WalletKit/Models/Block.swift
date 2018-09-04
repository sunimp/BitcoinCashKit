import Foundation
import RealmSwift

public class Block: Object {
    @objc public dynamic var reversedHeaderHashHex = ""
    @objc public dynamic var headerHash = Data()
    @objc public dynamic var height: Int = 0
    @objc dynamic var synced = false

    @objc public dynamic var header: BlockHeader!
    @objc dynamic var previousBlock: Block?

    let transactions = LinkingObjects(fromType: Transaction.self, property: "block")

    override public class func primaryKey() -> String? {
        return "reversedHeaderHashHex"
    }

    convenience init(withHeader header: BlockHeader, previousBlock: Block) {
        self.init(withHeader: header)

        height = previousBlock.height + 1
        self.previousBlock = previousBlock
    }

    convenience init(withHeader header: BlockHeader, height: Int) {
        self.init(withHeader: header)

        self.height = height
    }

    convenience init(withHeaderHash headerHash: Data, height: Int) {
        self.init()

        self.headerHash = headerHash
        self.reversedHeaderHashHex = headerHash.reversedHex
        self.height = height
    }

    private convenience init(withHeader header: BlockHeader) {
        self.init()

        self.header = header
        headerHash = Crypto.sha256sha256(BlockHeaderSerializer.serialize(header: header))
        reversedHeaderHashHex = headerHash.reversedHex
    }

}
