import Foundation

protocol ComingSoonPresenterOutput: AnyObject {

    func showLoading()
    func hideLoading()
    func success(with viewModel: ComingSoon.ViewModel)
    func error(with message: String)
}

final class ComingSoonPresenter: ComingSoonInteractorOutput {

    var output: ComingSoonPresenterOutput!

    func showLoading() {
        output.showLoading()
    }

    func hideLoading() {
        output.hideLoading()
    }

    func success(with response: ComingSoon.Response) {
        guard let data = response.results else { return }

        let viewModel = ComingSoon.ViewModel(data: data.compactMap { result in
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
