import UIKit

extension UITabBarController {
    
    func createNavController(vc: UIViewController, title: String, selected: UIImage, unselected: UIImage) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.title = title
        //        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        return navController
    }
}
