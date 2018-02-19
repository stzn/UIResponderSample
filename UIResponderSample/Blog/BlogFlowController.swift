import UIKit

class BlogFlowController: UIViewController {

    var navigation: UINavigationController!
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init (blogs: [Blog], user: User) {
        
        let vc = ListViewController.fromStoryboard()
        vc.viewModel = ListViewModel(blogs: blogs, user: user)

        let nvc = UINavigationController(rootViewController: vc)
        navigation = nvc
        super.init(nibName: nil, bundle: nil)
        add(childController: navigation)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        childViewControllers.first?.view.frame = view.bounds
    }

    func showDetail(_ blog: Blog) {
        let vc = DetailViewController.fromStoryboard()
        let vm = DetailViewModel(blog: blog)
        vc.viewModel = vm
        navigation.pushViewController(vc, animated: true)
    }    
}

extension BlogFlowController: ShowDetailResponder {
    
    func showDetail(action: ShowDetailAction) {
        showDetail(action.blog)
    }
}
