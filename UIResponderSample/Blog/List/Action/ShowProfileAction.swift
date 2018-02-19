import Foundation

struct ShowProfileAction: Action {
    
    typealias Responder = ShowProfileResponder
    
    func execute(responder: Responder) {
        responder.showProfile(action: self)
    }
}

protocol ShowProfileResponder {
    func showProfile(action: ShowProfileAction)
}
