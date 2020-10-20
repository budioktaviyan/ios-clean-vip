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
            guard
                let title = result.title,
                let overview = result.overview,
                let posterPath = result.posterPath else { return nil }

            return .init(
                title: title,
                overview: overview,
                posterPath: "\(URL.image)t/p/w154/\(posterPath)"
            )
        })
        output.success(with: viewModel)
    }

    func error(with response: Error) {
        output.error(with: response.localizedDescription)
    }
}
