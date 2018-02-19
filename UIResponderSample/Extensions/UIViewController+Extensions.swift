import UIKit

extension UIViewController {
    
    func add(childController: UIViewController) {
        add(childController: childController, targetView: view)
    }

    func add(childController: UIViewController, targetView: UIView) {
        addChildViewController(childController)
        targetView.addSubview(childController.view)
        childController.didMove(toParentViewController: self)
    }

    func remove(childController: UIViewController) {
        childController.willMove(toParentViewController: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParentViewController()
    }
}
