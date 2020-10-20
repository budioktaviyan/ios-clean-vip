import Swinject

final class HomeConfigurator: Assembly {

    func assemble(container: Container) {
        container.register(HomeViewController.self) {_ in
            return HomeViewController()
        }
    }
}
