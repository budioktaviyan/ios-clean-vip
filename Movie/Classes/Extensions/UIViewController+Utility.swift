import UIKit

extension UIViewController {

    func showAlert(with message: String) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        controller.addAction(action)

        present(controller, animated: true)
    }
}
