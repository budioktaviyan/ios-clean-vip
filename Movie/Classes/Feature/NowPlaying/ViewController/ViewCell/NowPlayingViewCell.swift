import UIKit

final class NowPlayingViewCell: UITableViewCell {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!

    static let height: CGFloat = 164.0

    var item: NowPlaying.ViewModel.Data? {
        didSet {
            setupCell()
        }
    }

    override func awakeFromNib() {
        selectionStyle = .none

        imgPoster.layer.cornerRadius = 10
        imgPoster.layer.masksToBounds = true
        imgPoster.clipsToBounds = true
        imgPoster.backgroundColor = .gray
    }

    private func setupCell() {
        guard let content = item else { return }

        imgPoster.load(with: content.posterPath)
        lblTitle.text = content.title
        lblOverview.text = content.overview
    }
}
