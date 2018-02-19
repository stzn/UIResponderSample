import UIKit

public protocol Action {
    associatedtype Responder
    func execute(responder: Responder)
}

public extension UIResponder {
    
    @discardableResult
    public func execute<A: Action>(action: A) -> A.Responder? {
        if let responder = find(action: action) {
            action.execute(responder: responder)
            return responder
        }
        return nil
    }
    
    public func find<A: Action>(action: A) -> A.Responder? {
        var responder:UIResponder? = self
        while responder != nil {
            if let responder = responder as? A.Responder {
                return responder
            }
            responder = responder?.next
        }
        return nil
    }
}
