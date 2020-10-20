import UIKit
import XLPagerTabStrip

final class ComingSoonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ComingSoonViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Coming Soon")
    }
}
