
//
import SwiftUI
struct ContentView: View {
    @State var isComplete = false
    var body: some View {
        VStack (spacing:15){
            Text("Task Manager")
                .font(.title)
            Button{
                isComplete.toggle()
            } label: {
                Label("Buy Groceries", systemImage: isComplete ? "checkmark.square.fill" : "square")
                
            }
            Label("Complete Swift Practice", systemImage: "square")
                Label("Read API notes", systemImage: "checkmark.square.fill")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red.opacity(0.1))
        }
    }

