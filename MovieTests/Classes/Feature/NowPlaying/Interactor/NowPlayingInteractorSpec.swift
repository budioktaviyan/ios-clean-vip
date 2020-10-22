import XCTest
import Quick
import Nimble

@testable import Movie

final class NowPlayingInteractorSpec: QuickSpec {

    override func spec() {
        var spy: NowPlayingPresenterOutputSpy!
        var sut: NowPlayingInteractorInput!

        describe("Test interactor for NowPlayingViewController") {
            context("Test methods") {
                beforeEach {
                    spy = NowPlayingPresenterOutputSpy()
                    sut = Injector.shared.resolve(NowPlayingInteractorInput.self, argument: spy as NowPlayingPresenterOutput)!
                }

                afterEach {
                    spy = nil
                    sut = nil
                }

                it("Should fetch movies with now playing type from API") {
                    sut.fetch(with: .init(apiKey: .apiKey))
                    expect(spy.isShowLoading).toEventually(beTrue())
                    expect(spy.isSuccess).toEventually(beTrue())
                    expect(spy.isShowLoading).toEventually(beFalse())
                }
            }
        }
    }
}
