import Foundation

struct ShowDetailAction: Action {
    
    typealias Responder = ShowDetailResponder
    
    let blog: Blog
    
    init(_ blog: Blog) {
        self.blog = blog
    }
    
    func execute(responder: Responder) {
        responder.showDetail(action: self)
    }
}

protocol ShowDetailResponder {
    func showDetail(action: ShowDetailAction)
}
