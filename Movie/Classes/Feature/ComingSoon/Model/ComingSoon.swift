struct ComingSoon {

    struct Request {

        let apiKey: String

        var params: [String: Any] {
            get {
                ["api_key": apiKey]
            }
        }
    }

    struct Response: Codable {

        let results: [Result]?

        struct Result: Codable {

            let title: String?
            let overview: String?
            let posterPath: String?
        }
    }

    struct ViewModel {

        var data: [Data]

        struct Data {

            let title: String
            let overview: String
            let posterPath: String
        }
    }
}
