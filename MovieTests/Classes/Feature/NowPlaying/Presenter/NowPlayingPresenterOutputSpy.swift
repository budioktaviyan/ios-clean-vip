@testable import Movie

final class NowPlayingPresenterOutputSpy: NowPlayingPresenterOutput {

    var isShowLoading = false
    var isSuccess = false

    func showLoading() {
        isShowLoading = true
    }

    func hideLoading() {
        isShowLoading = false
    }

    func success(with viewModel: NowPlaying.ViewModel) {
        isSuccess = true
    }

    func error(with message: String) {
        isSuccess = false
    }
}
