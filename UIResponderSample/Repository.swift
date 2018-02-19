import Foundation

final class Repository {
    
    // ログインユーザー
    var loginUser = User(id: 1, name: "わたし", imageUrl: "sample")
    
    // ブログ
    var blogs: [Blog] = [
        Blog(id: 1, title: "初投稿", contents: "初投稿です。", postDate: Date(), likeCount: 1),
        Blog(id: 2, title: "２回目", contents: "２回目。まだまだ", postDate: Date(), likeCount: 2),
        Blog(id: 3, title: "ネタがなくなってきた", contents: "やばい。何書けばいいんだ。", postDate: Date(), likeCount: 3),
        Blog(id: 4, title: "やめます", contents: "もう無理。。。。", postDate: Date(), likeCount: 4)
    ]
}
