# Part one

## Part one task

1) Explain some differences between a modal and push navigation.
2) When is it preferred to use `Keychain Services`, `UserDefaults` or `Core Data`? Please explain some different scenarios or use cases.
3) Given the following function inside a `UIViewController`, what can go wrong here?:
```swift
func fetchData() {
    service.fetchFromAPI { result in
        self.data = result
    }
}
```
4) Give a brief explanation of protocol oriented programming.

## Part one 

1) 
One of the biggest differrence between modal and push navigation is that push navigation is based on navigation controller and it's navigation stack, so new controllers are added to it's stack and navigation controller is responsive for storing this stack. And in the situation with modal navigation, it's relation only between two controllers, parent and child, and parent controller is reponsive for child controller.

2) 
Keychain services - is preferred to use when you have to store any sensitive data such as password, tokens and so on.
User defaults - can be used to store note huge amount of data, it's a simple key-value storing that can be used to store some user settings, like selected app theme, value for chosen language, etc. 
Core Data - is preferred to use to store whole objects that we receive for example from the backend to use it in an offline mode. 

3) There we have retain cycle because VC store strong reference to the service and in completion we have strong reference to data. 

4) First we should start  with the explanation what is protocol. Protocol is an interface that describes some properties and methods. So in POP we take to the base of our code not some classes, but protocols that describe what we from our objects, but not concrect objects. 
The primary aspect of POP over OOP is that it prefers composition over inheritance. Thу main problem of OOP is that in large inheritance hierarchies, base classes end up doing a lot of things.
