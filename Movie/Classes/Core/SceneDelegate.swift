import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let controller = Injector.shared.resolve(HomeViewController.self)!
        let navigation = UINavigationController(rootViewController: controller)
        navigation.navigationBar.barTintColor = .white

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.rootViewController = navigation
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}
