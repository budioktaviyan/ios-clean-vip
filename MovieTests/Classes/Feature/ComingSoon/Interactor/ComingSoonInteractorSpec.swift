import XCTest
import Quick
import Nimble

@testable import Movie

final class ComingSoonInteractorSpec: QuickSpec {

    override func spec() {
        var spy: ComingSoonPresenterOutputSpy!
        var sut: ComingSoonInteractorInput!

        describe("Test interactor for ComingSoonViewController") {
            context("Test methods") {
                beforeEach {
                    spy = ComingSoonPresenterOutputSpy()
                    sut = Injector.shared.resolve(ComingSoonInteractorInput.self, argument: spy as ComingSoonPresenterOutput)!
                }

                afterEach {
                    spy = nil
                    sut = nil
                }

                it("Should fetch movies with upcoming type from API") {
                    sut.fetch(with: .init(apiKey: .apiKey))
                    expect(spy.isShowLoading).toEventually(beTrue())
                    expect(spy.isSuccess).toEventually(beTrue())
                    expect(spy.isShowLoading).toEventually(beFalse())
                }
            }
        }
    }
}
