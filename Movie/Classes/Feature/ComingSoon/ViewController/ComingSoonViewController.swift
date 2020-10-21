import UIKit
import XLPagerTabStrip

final class ComingSoonViewController: UIViewController {

    @IBOutlet weak var csTable: UITableView!
    @IBOutlet weak var csLoading: UIActivityIndicatorView!

    var viewModel: ComingSoon.ViewModel?

    var input: ComingSoonInteractorInput!

    override func viewDidLoad() {
        csTable.register(UINib(nibName: "ComingSoonViewCell", bundle: nil), forCellReuseIdentifier: "ComingSoonCell")
        csTable.separatorStyle = .none
        csTable.estimatedRowHeight = ComingSoonViewCell.height
        csTable.dataSource = self
        csTable.delegate = self

        input.fetch(with: .init(apiKey: .apiKey))
    }
}

extension ComingSoonViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComingSoonCell", for: indexPath) as? ComingSoonViewCell
        let item = viewModel?.data[indexPath.row]
        cell?.item = item

        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ComingSoonViewCell.height
    }
}

extension ComingSoonViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "Coming Soon")
    }
}

extension ComingSoonViewController: ComingSoonPresenterOutput {

    func showLoading() {
        csLoading.isHidden = false
    }

    func hideLoading() {
        csLoading.isHidden = true
    }

    func success(with viewModel: ComingSoon.ViewModel) {
        self.viewModel = viewModel

        csTable.reloadData()
    }

    func error(with message: String) {
        showAlert(with: message)
    }
}
