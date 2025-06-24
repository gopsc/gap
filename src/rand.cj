package urlr
import std.random.*

// 随机生成URL
class rand {
    public init (max: UInt8) {
        this.max = max
    }
    public func genUrl() {
        let cur = genNumber(max) //实际长度
        let idx_prox = 0//genNumber(UInt8(PROX.size))
        let idx_tlds  =genNumber(UInt8(TLDS.size))
        let mid = genMid(cur)
        return '${PROX[Int64(idx_prox)]}://${mid}${TLDS[Int64(idx_tlds)]}'
    }
    private var max: UInt8 // 最大长度
    static private let PROX = ['http', 'https']
    static private let TLDS = ['.com', '.org', '.net', '.io', '.edu', '.gov', '.info', '.biz']
    static private let VALID: UInt8 = 10 + 26 + 26
    static private func toRune(int: UInt32) : Rune {
        return Rune(int)
    }
    private func genNumber(max: UInt8) {
        return Random().nextUInt8(max)
    }
    private func genMid(len: UInt8) {
        let str = Array<UInt8>(Int64(len), { _ =>
            let cur = Random().nextUInt8(VALID)
            if (cur < 10) {
                return (cur + 48)
            } else if (cur < 36) {
                return (cur - 10 + 65)
            } else {
                return (cur - 36 + 97)
            }
        })
        return String.fromUtf8(str)
    }
}