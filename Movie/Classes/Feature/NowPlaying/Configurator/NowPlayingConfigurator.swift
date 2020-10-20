import Swinject

final class NowPlayingConfigurator: Assembly {

    func assemble(container: Container) {
        container.register(Network<NowPlaying.Response>.self) {_ in
            return Network<NowPlaying.Response>()
        }

        container.register(NowPlayingWorkerProtocol.self) { (r) in
            let datasource = r.resolve(Network<NowPlaying.Response>.self)!
            let worker = NowPlayingWorker()
            worker.datasource = datasource

            return worker
        }

        container.register(NowPlayingInteractorOutput.self) { (r, output: NowPlayingPresenterOutput) in
            let presenter = NowPlayingPresenter()
            presenter.output = output

            return presenter
        }

        container.register(NowPlayingInteractorInput.self) { (r, output: NowPlayingPresenterOutput) in
            let output = r.resolve(NowPlayingInteractorOutput.self, argument: output)!
            let worker = r.resolve(NowPlayingWorkerProtocol.self)!
            let interactor = NowPlayingInteractor()

            interactor.output = output
            interactor.worker = worker

            return interactor
        }

        container.register(NowPlayingViewController.self) { (r) in
            let controller = NowPlayingViewController()
            let input = r.resolve(NowPlayingInteractorInput.self, argument: controller as NowPlayingPresenterOutput)!
            controller.input = input

            return controller
        }
    }
}
