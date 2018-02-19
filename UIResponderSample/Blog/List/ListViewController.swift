import UIKit

final class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    private var headerViewController: HeaderViewController!
    
    var viewModel: ListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerViewController.user = viewModel.user
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        
        tableView.register(ListTableViewCell.self)
        
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 66
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowHeaderView") {
            let header = segue.destination as! HeaderViewController
            header.user = viewModel.user
            self.headerViewController = header
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        guard let item = viewModel.item(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.tag = indexPath.row
        cell.configure(blog: item)
        return cell
    }
}

extension ListViewController: StoryboardLoadable {
    
    static var storyboardName: String {
        return Storyboard.ListViewController.name
    }
}
