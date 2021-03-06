import RxSwift

extension PrimitiveSequenceType where Trait == SingleTrait, Element == Data {

    func map<T>(_ type: T.Type, using decoder: JSONDecoder? = nil) -> PrimitiveSequence<Trait, T> where T: Decodable {
        self.map { data -> T in
            let decoder: JSONDecoder = decoder ?? JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode(type, from: data)
        }
    }
}

extension PrimitiveSequenceType where Trait == SingleTrait, Element == String {

    func map<T>(_ type: T.Type, using decoder: JSONDecoder? = nil) -> PrimitiveSequence<Trait, T> where T: Decodable {
        self.map { string in string.data(using: .utf8) ?? Data() }
            .map(type, using: decoder)
    }
}
