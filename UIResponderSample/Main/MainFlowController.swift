import UIKit

final class MainFlowController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        
        self.apiClient = apiClient
        let blogs = apiClient.getBlogs()
        let user = apiClient.getUser()
        
        let vc = MainViewController.fromStoryboard()
        
        let blogVC = BlogFlowController(blogs: blogs, user: user)
        let profileVC = ProfileFlowController(user: user)
        vc.blogFlowController = blogVC
        vc.profileFlowController = profileVC

        super.init(nibName: nil, bundle: nil)
        add(childController: vc)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        childViewControllers.first?.view.frame = view.bounds
    }
}

extension MainFlowController {

    func update() {
        
        guard let main = childViewControllers[0] as? MainViewController,
            let blogFC = main.blogFlowController,
            let profileFC = main.profileFlowController,
            let listVC = blogFC.navigation.viewControllers[0] as? ListViewController,
            let profileVC = profileFC.navigation.viewControllers[0] as? ProfileViewController else {
            return
        }
        let user = apiClient.getUser()
        let blogs = apiClient.getBlogs()
        listVC.viewModel = ListViewModel(blogs: blogs, user: user)
        profileVC.viewModel = ProfileViewModel(user: user)
    }
}


extension MainFlowController: EditUserResponder {
    
    func editUser(action: EditUserAction) {
        apiClient.editUser(action.user)
        update()
    }
}

extension MainFlowController: DeleteUserResponder {
    func deleteUser(action: DeleteUserAction) {
        apiClient.deleteUser(id: action.id)
        update()
    }
}
extension MainFlowController: EditBlogResponder {
    func editBlog(action: EditBlogAction) {
        apiClient.editBlog(blog: action.blog)
        update()
    }
}

extension MainFlowController: DeleteBlogResponder {
    func deleteBlog(action: DeleteBlogAction) {
        apiClient.deleteBlog(id: action.id)
        update()
    }
}
