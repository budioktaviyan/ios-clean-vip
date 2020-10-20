import UIKit
import XLPagerTabStrip

final class NowPlayingViewController: UIViewController {

    @IBOutlet weak var npTable: UITableView!
    @IBOutlet weak var npLoading: UIActivityIndicatorView!

    var viewModel: NowPlaying.ViewModel?

    var input: NowPlayingInteractorInput!

    override func viewDidLoad() {
        npTable.register(UINib(nibName: "NowPlayingViewCell", bundle: nil), forCellReuseIdentifier: "NowPlayingCell")
        npTable.separatorStyle = .none
        npTable.estimatedRowHeight = NowPlayingViewCell.height
        npTable.dataSource = self
        npTable.delegate = self

        input.fetch(with: .init(apiKey: .apiKey))
    }
}

extension NowPlayingViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingCell", for: indexPath) as? NowPlayingViewCell
        let item = viewModel?.data[indexPath.row]
        cell?.item = item

        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NowPlayingViewCell.height
    }
}

extension NowPlayingViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Now Playing")
    }
}

extension NowPlayingViewController: NowPlayingPresenterOutput {

    func showLoading() {
        npLoading.isHidden = false
    }

    func hideLoading() {
        npLoading.isHidden = true
    }

    func success(with viewModel: NowPlaying.ViewModel) {
        self.viewModel = viewModel

        npTable.reloadData()
    }

    func error(with message: String) {
        showAlert(with: message)
    }
}
