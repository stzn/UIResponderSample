import Foundation

struct ApiClient {

    var repository: Repository
    init(repository: Repository) {
        self.repository = repository
    }

    func getUser() -> User {
        return repository.loginUser
    }
    
    func editUser(_ user: User) {
        repository.loginUser = user
        AlertManager.shared.showAlert(title: "編集", message: "プロフィールを編集しました。\(user.name)")
    }

    func getBlogs() -> [Blog] {
        return repository.blogs
    }
    
    func editBlog(blog: Blog) {
        
        guard let index = repository.blogs.index(where: { $0.id == blog.id }) else {
            AlertManager.shared.showAlert(title: "エラー", message: "失敗しました。")
            return
        }
        
        repository.blogs[index] = Blog(
            id: blog.id,
            title: blog.title,
            contents: blog.contents,
            postDate: Date(),
            likeCount: blog.likeCount
        )
        
        AlertManager.shared.showAlert(title: "編集", message: "投稿を編集しました。\n\(blog.title)\n\(blog.contents)")
    }
    
    func deleteBlog(id: Int) {
        AlertManager.shared.showAlert(title: "削除", message: "投稿を削除しました。")
    }
    
    func deleteUser(id: Int) {
        AlertManager.shared.showAlert(title: "削除", message: "ユーザーを削除しました。")
    }
}
