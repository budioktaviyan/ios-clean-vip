import RxSwift

protocol ComingSoonWorkerProtocol: AnyObject {

    func fetch(with request: ComingSoon.Request) -> PrimitiveSequence<SingleTrait, ComingSoon.Response>
}

final class ComingSoonWorker: ComingSoonWorkerProtocol {

    var datasource: Network<ComingSoon.Response>!

    func fetch(with request: ComingSoon.Request) -> PrimitiveSequence<SingleTrait, ComingSoon.Response> {
        datasource.get(.upcoming, request.params)
    }
}
