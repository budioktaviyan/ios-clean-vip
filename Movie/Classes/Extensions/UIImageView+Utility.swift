import Nuke

extension UIImageView {

    func load(with url: String) {
        Nuke.loadImage(with: URL(string: url)!, into: self)
    }
}
