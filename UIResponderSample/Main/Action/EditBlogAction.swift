import Foundation

struct EditBlogAction: Action {
    
    typealias Responder = EditBlogResponder
    
    let blog: Blog
    
    init(blog: Blog) {
        self.blog = blog
    }
    
    func execute(responder: Responder) {
        responder.editBlog(action: self)
    }
    
}

protocol EditBlogResponder {
    func editBlog(action: EditBlogAction)
}
