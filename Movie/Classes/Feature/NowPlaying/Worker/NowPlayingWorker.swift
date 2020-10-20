import RxSwift

protocol NowPlayingWorkerProtocol: AnyObject {

    func fetch(with request: NowPlaying.Request) -> PrimitiveSequence<SingleTrait, NowPlaying.Response>
}

final class NowPlayingWorker: NowPlayingWorkerProtocol {

    var datasource: Network<NowPlaying.Response>!

    func fetch(with request: NowPlaying.Request) -> PrimitiveSequence<SingleTrait, NowPlaying.Response> {
        datasource.get(.nowPlaying, request.params)
    }
}
