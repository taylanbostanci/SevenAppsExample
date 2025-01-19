
# SevenAppsExample
SevenAppsExample is an iOS app that retrieves and lists user information from an API, using the MVVM (Model-View-ViewModel) architecture. This project is designed to showcase modern iOS app development principles and best practices.

    ├── SevenApssExample/
    │   ├── Models/UserResponseModel.swift
    │   ├── ViewModels/UserViewModel.swift             
    │   ├── Views/UserListViewController.swift             
    │   ├── Network/APIClient.swift            
    │   ├── Repositores/UserRepository.swift       
    │   └── Utils/Constants.swift
    │   └── SevenApssExampleTests/SevenApssExampleTests.swift    
    └── ...
    
## Features
- Retrieve user list from API and list on screen.
- Bindable properties for instant updates in UI.
- Error messages are communicated to the user.
- A testable, modular and sustainable architecture:
- **Structure**: Provides a layered and modular application structure.
- **Repository**: Data access and processing layer.
- **APIClient**: Manages network requests.
- **Localization**: The project has a localizable file, TR and EN.
- **Unit Test**: This project includes unit tests for the _UserRepository_ class, which interacts with an API client to fetch user data. The tests aim to ensure the correct functionality of the _fetchUsers_ method, which retrieves a list of users from the API.
 
## Technologies and Tools
- **Alamofire**: It is a popular networking library used to easily make HTTP network requests in the Swift programming language. It is built on Apple's built-in URLSession API, providing a more user-friendly API. Alamofire is widely used in modern iOS and macOS applications to make networking simpler and more readable.
- **SnapKit**: SnapKit allows you to perform Auto Layout operations in a faster, more readable and cleaner way.It provides a more user-friendly and modern approach instead of the NSLayoutConstraint API offered by UIKit.It is especially popular in code-based interface designs.

## Usage
Firstly, you need to download the project to your local storage via github. Then, you need to install the libraries in the existing pod file with the pod install command using the terminal. After doing all this, you can access the project by opening a file with the xcworkspace extension.


