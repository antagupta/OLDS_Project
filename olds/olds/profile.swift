import Foundation
import SwiftUI

struct ProfilePage: View {
    @State private var firstName: String = "" // State variable to hold the first name input
    @State private var lastName: String = "" // State variable to hold the last name input
    @State private var selectedDate: Date = Date() // State variable to hold the selected date

    // DateFormatter to format the selected date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer() // Spacer to push the profile image down

                // HStack for First Name Label and TextField
                HStack {
                    Text("First Name:") // Label
                        .font(.headline)
                    TextField("Enter your first name", text: $firstName) // TextField with binding
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 10)
                }
                .padding()

                // HStack for Last Name Label and TextField
                HStack {
                    Text("Last Name:") // Label
                        .font(.headline)
                    TextField("Enter your last name", text: $lastName) // TextField with binding
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 10)
                }
                .padding()

                Spacer() // Spacer to push the date picker and button up

                // DatePicker for selecting date
                VStack {
                    Text("Select your Birthday:")
                        .font(.headline)
                    DatePicker(
                        "Select Date",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()

                    // Display selected date in a TextField
                    HStack {
                        Text("Birthday:")
                            .font(.headline)
                        TextField("Selected date", text: .constant(dateFormatter.string(from: selectedDate)))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true) // Disable editing
                            .padding(.leading, 10)
                    }
                    .padding()
                }

                Spacer() // Spacer to push the button up

                // NavigationLink to navigate to a new blank page
                NavigationLink(destination: BlankPage()) {
                    Text("Go to Categories")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Spacer() // Spacer to push the button up
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("PROFILE PAGE")
                            .font(.headline)
                            .fontWeight(.bold)
                        Image("profileIcon")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                    }
                }
            }
        }
    }
}

// New blank page view
struct BlankPage: View {
    var body: some View {
        Text("This is supposed to be categories page that Antara didnt provide!!!.")
            .font(.largeTitle)
            .navigationTitle("Categories Page")
    }
}

// Correct PreviewProvider implementation
struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
