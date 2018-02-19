import UIKit

class ProfileFlowController: UIViewController {

    var navigation: UINavigationController!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(user: User) {
        
        let vm = ProfileViewModel(user: user)
        let vc = ProfileViewController.fromStoryboard()
        vc.viewModel = vm
        let nvc = UINavigationController(rootViewController: vc)
        navigation = nvc
        super.init(nibName: nil, bundle: nil)
        add(childController: navigation)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        childViewControllers.first?.view.frame = view.bounds
    }
}
