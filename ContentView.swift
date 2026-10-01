
//
import SwiftUI
struct User : Codable {
    let name: String
    let email : String
}
struct ContentView: View {
    
    @State var name = ""
    @State var email = ""
    @State var isLoading = true
    @State var errorMessage = ""
    var body: some View {
        VStack {
            if isLoading {
                Text("Loading user...")
            } else if !errorMessage.isEmpty {
                Text(errorMessage)
            } else {
                Text(name)
                Text(email)
            }
        }
        .task{
            await getUser()
        }
    }
    func getUser() async {
        isLoading = true
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
        do{
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let (data,_) = try await URLSession.shared.data(for: request)
            let user = try JSONDecoder().decode(User.self, from: data)
            name = user.name
            email = user.email
            isLoading = false
            
        }catch{
            errorMessage = "Something went wrong"
            isLoading = false
        }
    }
}
