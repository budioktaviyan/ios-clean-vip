import Foundation

extension URL {

    static var base: URL {
        return URL(string: "https://api.themoviedb.org/3/movie/")!
    }

    static var image: URL {
        return URL(string: "http://image.tmdb.org/")!
    }

    static var nowPlaying: URL {
        return URL(string: "now_playing", relativeTo: base)!
    }

    static var upcoming: URL {
        return URL(string: "upcoming", relativeTo: base)!
    }
}
