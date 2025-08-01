### 🔄 Project Awareness & Context
- **Always read `PLANNING.md`** at the start of a new conversation to understand the project's architecture, goals, style, and constraints.
- **Check `TASK.md`** before starting a new task. If the task isn’t listed, add it with a brief description and today's date.
- **Use consistent naming conventions, file structure, and architecture patterns** as described in `PLANNING.md`.

### 🧱 Code Structure & Modularity
- **Never create a file longer than 500 lines of code.** If a file approaches this limit, refactor by splitting it into modules or helper files.
- **Organize code into clearly separated modules**, grouped by feature or responsibility.
- **Use clear, consistent imports** (prefer relative imports within packages).

### 🧪 Testing & Reliability

### ✅ Task Completion
- **Mark completed tasks in `TASK.md`** immediately after finishing them.
- Add new sub-tasks or TODOs discovered during development to `TASK.md` under a “Discovered During Work” section.

### 📎 Style & Conventions
- use SwiftUI instead of Appkit
- use the Best pratice and standard library
- UI style should follow Apple use native component. not rewrite component style


### 📚 Documentation & Explainability
- **Update `README.md`** when new features are added, dependencies change, or setup steps are modified.
- **Comment non-obvious code** and ensure everything is understandable to a mid-level developer.
- When writing complex logic, **add an inline `# Reason:` comment** explaining the why, not just the what.

### 🧠 AI Behavior Rules
- **Never assume missing context. Ask questions if uncertain.**
- **Never hallucinate libraries or functions** – only use known, verified Python packages.
- **Always confirm file paths and module names** exist before referencing them in code or tests.
- **Never delete or overwrite existing code** unless explicitly instructed to or if part of a task from `TASK.md`.

### 📁 Project Structure & File Tree Format

#### Standard SwiftUI Project Structure (MVC Pattern)
```
ProjectName/
├── App/
│   ├── ProjectNameApp.swift          # App entry point
│   └── AppDelegate.swift             # App delegate (if needed)
├── Models/
│   ├── DataModel.swift               # Core data models
│   ├── UserModel.swift               # User-related models
│   └── APIModel.swift                # API response models
├── Views/
│   ├── ContentView.swift             # Main content view
│   ├── Components/                   # Reusable UI components
│   │   ├── CustomButton.swift
│   │   ├── CustomTextField.swift
│   │   └── LoadingView.swift
│   ├── Screens/                      # Screen-specific views
│   │   ├── HomeView.swift
│   │   ├── DetailView.swift
│   │   └── SettingsView.swift
│   └── Modifiers/                    # Custom view modifiers
│       └── CustomModifiers.swift
├── ViewModels/
│   ├── MainViewModel.swift           # Main view model
│   ├── HomeViewModel.swift           # Screen-specific view models
│   └── DetailViewModel.swift
├── Controllers/
│   ├── NetworkController.swift       # API/Network handling
│   ├── DataController.swift          # Data management
│   └── UserController.swift          # User-related logic
├── Services/
│   ├── APIService.swift             # API service layer
│   ├── StorageService.swift          # Local storage service
│   └── NotificationService.swift     # Push notification service
├── Utils/
│   ├── Constants.swift               # App constants
│   ├── Extensions/                   # Swift extensions
│   │   ├── View+Extensions.swift
│   │   ├── String+Extensions.swift
│   │   └── Date+Extensions.swift
│   └── Helpers/
│       ├── ValidationHelper.swift
│       └── FormatHelper.swift
├── Resources/
│   ├── Assets.xcassets/             # Images and assets
│   ├── Localizable.strings          # Localization
│   └── Info.plist                   # App configuration
├── Tests/
│   ├── UnitTests/                   # Unit tests
│   ├── UITests/                     # UI tests
│   └── MockData/                    # Test mock data
└── Supporting Files/
    ├── README.md
    ├── .gitignore
    └── Package.swift                 # Swift Package Manager (if used)
```

#### File Tree Display Format
When showing project structure, use this format:
```
📁 ProjectName/
├── 📁 App/
│   ├── 📄 ProjectNameApp.swift
│   └── 📄 AppDelegate.swift
├── 📁 Models/
│   ├── 📄 DataModel.swift
│   └── 📄 UserModel.swift
├── 📁 Views/
│   ├── 📄 ContentView.swift
│   ├── 📁 Components/
│   │   ├── 📄 CustomButton.swift
│   │   └── 📄 CustomTextField.swift
│   └── 📁 Screens/
│       ├── 📄 HomeView.swift
│       └── 📄 DetailView.swift
├── 📁 ViewModels/
│   └── 📄 MainViewModel.swift
├── 📁 Controllers/
│   └── 📄 NetworkController.swift
├── 📁 Services/
│   └── 📄 APIService.swift
└── 📁 Utils/
    └── 📄 Constants.swift
```

#### SwiftUI MVC Architecture Guidelines

**Models (Data Models)**
- Define application data structures
- Use `Codable` protocol for serialization
- Keep models simple, containing only data properties
- Example:
```swift
struct User: Codable, Identifiable {
    let id: UUID
    var name: String
    var email: String
    var profileImage: String?
}
```

**Views (View Layer)**
- Use SwiftUI declarative syntax
- Keep views simple, focused on UI presentation
- Bind data through `@ObservedObject` or `@StateObject`
- Example:
```swift
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                UserRowView(user: user)
            }
            .navigationTitle("User List")
        }
    }
}
```

**ViewModels (View Models)**
- Handle business logic and data transformation
- Use `@Published` property wrapper to notify view updates
- Handle user interactions and state management
- Example:
```swift
class HomeViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    
    func fetchUsers() {
        isLoading = true
        // API call logic
    }
}
```

**Controllers (Controllers)**
- Handle network requests and data persistence
- Manage application state and configuration
- Coordinate interactions between different services
- Example:
```swift
class NetworkController: ObservableObject {
    func fetchData<T: Codable>(from endpoint: String) async throws -> T {
        // Network request implementation
    }
}
```

#### File Naming Conventions
- **Views**: `ViewNameView.swift` (e.g., `HomeView.swift`)
- **ViewModels**: `ViewNameViewModel.swift` (e.g., `HomeViewModel.swift`)
- **Models**: `ModelName.swift` (e.g., `User.swift`)
- **Controllers**: `ControllerNameController.swift` (e.g., `NetworkController.swift`)
- **Services**: `ServiceNameService.swift` (e.g., `APIService.swift`)
- **Extensions**: `Type+ExtensionName.swift` (e.g., `View+Extensions.swift`)
