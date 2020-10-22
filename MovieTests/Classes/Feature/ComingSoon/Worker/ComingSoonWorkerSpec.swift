import XCTest
import Quick
import Nimble
import RxSwift

@testable import Movie

final class ComingSoonWorkerSpec: QuickSpec {

    override func spec() {
        var sut: ComingSoonWorkerProtocol!

        describe("Test worker for ComingSoonViewController") {
            context("Test methods") {
                beforeEach {
                    sut = Injector.shared.resolve(ComingSoonWorkerProtocol.self)!
                }

                afterEach {
                    sut = nil
                }

                it("Should fetch movies with upcoming type from API") {
                    let result = sut.fetch(with: .init(apiKey: .apiKey))
                    expect(result).toEventually(beAKindOf(Single<ComingSoon.Response>.self))
                }
            }
        }
    }
}
