import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    var blog: Blog?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(blog: Blog) {
        titleLabel.text = blog.title
        postDateLabel.text = blog.postDate.string()
        likeCountLabel.text = String(describing: blog.likeCount)
        
        self.blog = blog
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        guard let blog = blog else {
            return
        }
        // アクション実行
        self.execute(action: ShowDetailAction(blog))
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let sender = sender as? UIView else {
            return
        }
        // アクション実行
        self.execute(action: DeleteBlogAction(sender.tag))
    }
}
