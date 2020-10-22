import XCTest
import Quick
import Nimble

@testable import Movie

final class ComingSoonPresenterSpec: QuickSpec {

    override func spec() {
        var spy: ComingSoonPresenterOutputSpy!
        var sut: ComingSoonInteractorOutput!

        describe("Test presenter for ComingSoonViewController") {
            context("Test methods") {
                beforeEach {
                    spy = ComingSoonPresenterOutputSpy()
                    sut = Injector.shared.resolve(ComingSoonInteractorOutput.self, argument: spy as ComingSoonPresenterOutput)!
                }

                afterEach {
                    spy = nil
                    sut = nil
                }

                it("Should show loading while starting fetch movies with upcoming type from API") {
                    sut.showLoading()
                    expect(spy.isShowLoading).to(beTrue())
                }

                it("Should hide loading while finishing fetch movies with upcoming type from API") {
                    sut.hideLoading()
                    expect(spy.isShowLoading).to(beFalse())
                }

                it("Should show movies with upcoming type view model") {
                    let response = ComingSoon.Response(results: [
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
