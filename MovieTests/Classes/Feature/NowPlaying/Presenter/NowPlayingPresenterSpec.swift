import XCTest
import Quick
import Nimble

@testable import Movie

final class NowPlayingPresenterSpec: QuickSpec {

    override func spec() {
        var spy: NowPlayingPresenterOutputSpy!
        var sut: NowPlayingInteractorOutput!

        describe("Test presenter for NowPlayingViewController") {
            context("Test methods") {
                beforeEach {
                    spy = NowPlayingPresenterOutputSpy()
                    sut = Injector.shared.resolve(NowPlayingInteractorOutput.self, argument: spy as NowPlayingPresenterOutput)!
                }

                afterEach {
                    spy = nil
                    sut = nil
                }

                it("Should show loading while starting fetch movies with now playing type from API") {
                    sut.showLoading()
                    expect(spy.isShowLoading).to(beTrue())
                }

                it("Should hide loading while finishing fetch movies with now playing type from API") {
                    sut.hideLoading()
                    expect(spy.isShowLoading).to(beFalse())
                }

                it("Should show movies with now playing type view model") {
                    let response = NowPlaying.Response(results: [
                        .init(
                            title: "Title",
                            overview: "Overview of a movie",
                            posterPath: "https://image.api.com/image.jpg"
                        )
                    ])

                    sut.success(with: response)
                    expect(spy.isSuccess).to(beTrue())
                }
            }
        }
    }
}
