@testable import Movie

final class ComingSoonPresenterOutputSpy: ComingSoonPresenterOutput {

    var isShowLoading = false
    var isSuccess = false

    func showLoading() {
        isShowLoading = true
    }

    func hideLoading() {
        isShowLoading = false
    }

    func success(with viewModel: ComingSoon.ViewModel) {
        isSuccess = true
    }

    func error(with message: String) {
        isSuccess = false
    }
}
