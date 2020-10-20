import RxSwift

protocol NowPlayingInteractorInput: AnyObject {

    var disposeBag: DisposeBag { get }

    func fetch(with request: NowPlaying.Request)
}

protocol NowPlayingInteractorOutput: AnyObject {

    func showLoading()
    func hideLoading()
    func success(with response: NowPlaying.Response)
    func error(with response: Error)
}

final class NowPlayingInteractor: NowPlayingInteractorInput {

    var output: NowPlayingInteractorOutput!
    var worker: NowPlayingWorkerProtocol!

    var disposeBag: DisposeBag = DisposeBag()

    func fetch(with request: NowPlaying.Request) {
        output.showLoading()
        worker.fetch(with: request)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onSuccess: {[weak self] (response) in
                    self?.output.hideLoading()
                    self?.output.success(with: response)
                },
                onError: {[weak self] (error) in
                    self?.output.hideLoading()
                    self?.output.error(with: error)
                }).disposed(by: disposeBag)
    }
}
