import Swinject

final class ComingSoonConfigurator: Assembly {

    func assemble(container: Container) {
        container.register(Network<ComingSoon.Response>.self) {_ in
            Network<ComingSoon.Response>()
        }

        container.register(ComingSoonWorkerProtocol.self) { (r) in
            let datasource = r.resolve(Network<ComingSoon.Response>.self)!
            let worker = ComingSoonWorker()
            worker.datasource = datasource

            return worker
        }

        container.register(ComingSoonInteractorOutput.self) { (r, output: ComingSoonPresenterOutput) in
            let presenter = ComingSoonPresenter()
            presenter.output = output

            return presenter
        }

        container.register(ComingSoonInteractorInput.self) { (r, output: ComingSoonPresenterOutput) in
            let output = r.resolve(ComingSoonInteractorOutput.self, argument: output)!
            let worker = r.resolve(ComingSoonWorkerProtocol.self)!
            let interactor = ComingSoonInteractor()

            interactor.output = output
            interactor.worker = worker

            return interactor
        }

        container.register(ComingSoonViewController.self) { (r) in
            let controller = ComingSoonViewController()
            let input = r.resolve(ComingSoonInteractorInput.self, argument: controller as ComingSoonPresenterOutput)!
            controller.input = input

            return controller
        }
    }
}
