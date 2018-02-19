import UIKit

final class HeaderViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = user.name
        imageView.image = #imageLiteral(resourceName: "sample")
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        self.execute(action: ShowProfileAction())
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        self.execute(action: DeleteUserAction(user.id))
    }
}
