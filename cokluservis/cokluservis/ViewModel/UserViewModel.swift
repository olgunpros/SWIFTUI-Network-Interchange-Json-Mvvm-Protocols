
import Foundation

class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    //let webservice = WebService()
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        var resource = ""
        if service.type == "Webservice" {
            resource = Constants.Urls.userExtension
            
        }else {
            resource = Constants.Paths.baseUrl
        }
        do {
            let users = try await service.download(Constants.Urls.userExtension)
            DispatchQueue.main.async {
                self.userList =  users.map(UserViewModel.init)
                
                
            }
        } catch {
            
        }
        
        
    }
    
    
}

struct UserViewModel {
    let user : User
    var id : Int {
        user.id
    }
    var name: String {
        user.name
    }
    var username: String {
        user.username
    }
    var email : String {
        user.email
    }
}



