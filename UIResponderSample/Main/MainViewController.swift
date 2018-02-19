import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    var blogFlowController: BlogFlowController?
    var profileFlowController: ProfileFlowController?
    
    private var activeViewController: UIViewController? {
        didSet {
            removeViewController(oldValue)
            showViewController()
        }
    }
    
    private func removeViewController(_ viewController: UIViewController?) {
        
        if let vc = viewController {
            remove(childController: vc)
        }
    }
    
    private func showViewController() {
        if let vc = activeViewController {
            add(childController: vc, targetView: contentView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeViewController = blogFlowController
    }
    
    @IBAction func listButtonTapped(_ sender: Any) {
        activeViewController = blogFlowController
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        activeViewController = profileFlowController
    }
}

extension MainViewController: StoryboardLoadable {
    static var storyboardName: String {
        return Storyboard.MainViewController.name
    }
}

extension MainViewController: ShowProfileResponder {
    
    func showProfile(action: ShowProfileAction) {
        activeViewController = profileFlowController
    }
}


