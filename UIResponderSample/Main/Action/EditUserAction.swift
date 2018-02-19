import Foundation

struct EditUserAction: Action {
    
    typealias Responder = EditUserResponder
    
    let user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func execute(responder: Responder) {
        responder.editUser(action: self)
    }
}

protocol EditUserResponder {
    func editUser(action: EditUserAction)
}
