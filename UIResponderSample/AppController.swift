import UIKit

final class AppController: UIViewController {
    
    private let apiClient: ApiClient
    
    init() {
        apiClient = ApiClient(repository: Repository())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        showMain()
    }
    
    func showMain() {
        
        let mainVC = MainFlowController(apiClient: apiClient)
        add(childController: mainVC)
    }
}

