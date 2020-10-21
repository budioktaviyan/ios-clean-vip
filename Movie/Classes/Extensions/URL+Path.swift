import Foundation

extension URL {

    static var base: URL {
        URL(string: "https://api.themoviedb.org/3/movie/")!
    }

    static var image: URL {
        URL(string: "http://image.tmdb.org/")!
    }

    static var nowPlaying: URL {
        URL(string: "now_playing", relativeTo: base)!
    }

    static var upcoming: URL {
        URL(string: "upcoming", relativeTo: base)!
    }
}
