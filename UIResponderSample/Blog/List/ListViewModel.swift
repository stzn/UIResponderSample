import Foundation
import UIKit

struct ListViewModel {

    var blogs: [Blog]
    var user: User
    
    init(blogs: [Blog], user: User) {
        self.blogs = blogs
        self.user = user
    }
    
    func item(index: Int) -> Blog? {
        guard index < blogs.count else {
            return nil
        }
        return blogs[index]
    }
}
