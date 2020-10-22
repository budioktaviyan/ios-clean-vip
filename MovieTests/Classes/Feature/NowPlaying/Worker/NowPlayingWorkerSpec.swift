import XCTest
import Quick
import Nimble
import RxSwift

@testable import Movie

final class NowPlayingWorkerSpec: QuickSpec {

    override func spec() {
        var sut: NowPlayingWorkerProtocol!

        describe("Test worker for NowPlayingViewController") {
            context("Test methods") {
                beforeEach {
                    sut = Injector.shared.resolve(NowPlayingWorkerProtocol.self)!
                }

                afterEach {
                    sut = nil
                }

                it("Should fetch movies with now playing type from API") {
                    let result = sut.fetch(with: .init(apiKey: .apiKey))
                    expect(result).toEventually(beAKindOf(Single<NowPlaying.Response>.self))
                }
            }
        }
    }
}
