import Swinject

final class ComingSoonConfigurator: Assembly {

    func assemble(container: Container) {
        container.register(ComingSoonViewController.self) {_ in
            return ComingSoonViewController()
        }
    }
}
