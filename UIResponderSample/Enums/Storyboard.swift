import Foundation

enum Storyboard: String  {
    
    case MainViewController = "MainViewController"
    case ListViewController = "ListViewController"
    case DetailViewController = "DetailViewController"
    case ProfileViewController = "ProfileViewController"

    var name: String {
        return self.rawValue
    }
}
