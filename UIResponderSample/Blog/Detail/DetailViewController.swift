import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = viewModel.blog.title
        contentsTextView.text = viewModel.blog.contents
        contentsTextView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        view.endEditing(true)

        let old = viewModel.blog
        let title = titleTextField.text ?? ""
        let contents = contentsTextView.text ?? ""
        
        let new = Blog(id: old.id, title: title, contents: contents, postDate: Date(), likeCount: old.likeCount)
        
        self.execute(action: EditBlogAction(blog: new))
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {

        view.endEditing(true)

        self.execute(action: DeleteBlogAction(viewModel.blog.id))
    }
}

extension DetailViewController: StoryboardLoadable {
    
    static var storyboardName: String {
        return Storyboard.DetailViewController.name
    }
}

extension DetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        view.layoutIfNeeded()
    }
    
}
