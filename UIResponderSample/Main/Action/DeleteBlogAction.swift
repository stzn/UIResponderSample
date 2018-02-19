import Foundation

struct DeleteBlogAction: Action {
    
    typealias Responder = DeleteBlogResponder
    
    let id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    func execute(responder: Responder) {
        responder.deleteBlog(action: self)
    }
    
}

protocol DeleteBlogResponder {
    func deleteBlog(action: DeleteBlogAction)
}
