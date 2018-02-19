import Foundation

struct DeleteUserAction: Action {
    
    typealias Responder = DeleteUserResponder
    
    let id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    func execute(responder: Responder) {
        responder.deleteUser(action: self)
    }
    
}

protocol DeleteUserResponder {
    func deleteUser(action: DeleteUserAction)
}
