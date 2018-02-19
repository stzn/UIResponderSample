import Foundation

struct Blog: Codable {
    let id: Int
    let title: String
    let contents: String
    let postDate: Date
    let likeCount: Int
}

extension Blog: Equatable {
    static func ==(lhs: Blog, rhs: Blog) -> Bool {
        return lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.contents == rhs.contents
        && lhs.likeCount == rhs.likeCount
        && lhs.postDate == rhs.postDate
    }
}

