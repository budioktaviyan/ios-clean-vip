import RxSwift

protocol ComingSoonInteractorInput: AnyObject {

    var disposeBag: DisposeBag { get }

    func fetch(with request: ComingSoon.Request)
}

protocol ComingSoonInteractorOutput: AnyObject {

    func showLoading()
    func hideLoading()
    func success(with response: ComingSoon.Response)
    func error(with response: Error)
}

final class ComingSoonInteractor: ComingSoonInteractorInput {

    var output: ComingSoonInteractorOutput!
    var worker: ComingSoonWorkerProtocol!

    var disposeBag: DisposeBag = DisposeBag()

    func fetch(with request: ComingSoon.Request) {
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
