
import Foundation

class LocalServices : NetworkService {
    var type: String = "LocalServices"
    
    func download(_ resource : String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("This is demo project..:)")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
        
    }
}
