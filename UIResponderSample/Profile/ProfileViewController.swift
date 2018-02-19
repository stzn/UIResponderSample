import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageViewX!
    @IBOutlet weak var nameTextField: UITextField!
    
    var viewModel: ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = viewModel.user
        nameTextField.text = user.name
        imageView.image = #imageLiteral(resourceName: "sample")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        view.endEditing(true)

        self.execute(action: DeleteUserAction(viewModel.user.id))
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {

        view.endEditing(true)

        let user = viewModel.user
        let name = nameTextField.text ?? ""
        let new = User(id: user.id, name: name, imageUrl: user.imageUrl)
        viewModel.user = new
        self.execute(action: EditUserAction(new))
    }
}

extension ProfileViewController: StoryboardLoadable {
    
    static var storyboardName: String {
        return Storyboard.ProfileViewController.name
    }
}
