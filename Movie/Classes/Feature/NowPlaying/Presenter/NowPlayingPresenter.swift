import Foundation

protocol NowPlayingPresenterOutput: AnyObject {

    func showLoading()
    func hideLoading()
    func success(with viewModel: NowPlaying.ViewModel)
    func error(with message: String)
}

final class NowPlayingPresenter: NowPlayingInteractorOutput {

    var output: NowPlayingPresenterOutput!

    func showLoading() {
        output.showLoading()
    }

    func hideLoading() {
        output.hideLoading()
    }

    func success(with response: NowPlaying.Response) {
        guard let data = response.results else { return }

        let viewModel = NowPlaying.ViewModel(data: data.compactMap { result in
            .init(
                title: result.title ?? "-",
                overview: result.overview ?? "-",
                posterPath: "\(URL.image)t/p/w154/\(result.posterPath ?? "")"
            )
        })
        output.success(with: viewModel)
    }

    func error(with response: Error) {
        output.error(with: response.localizedDescription)
    }
}
