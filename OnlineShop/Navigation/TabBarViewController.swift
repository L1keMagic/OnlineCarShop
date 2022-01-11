import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    internal func setupTabBar() {
        let homeVC = createNavController(
            vc: HomeViewController(),
            title: "Home",
            selected: UIImage(systemName: "house")!,
            unselected: UIImage(systemName: "house.fill")!)
        
        let addNewVC = createNavController(
            vc: AddProductViewController(),
            title: "Add",
            selected: UIImage(systemName: "plus.square")!,
            unselected: UIImage(systemName: "plus.square.fill")!)
        
        let cartVC = createNavController(
            vc: CartViewController(),
            title: "Cart",
            selected: UIImage(systemName: "cart")!,
            unselected: UIImage(systemName: "cart.fill")!)
        
        let settingsVC = createNavController(
            vc: SettingsViewController(),
            title: "Settings",
            selected: UIImage(systemName: "gearshape.2")!,
            unselected: UIImage(systemName:"gearshape.2.fill")!)
        
        viewControllers = [homeVC, addNewVC, cartVC, settingsVC]
    }
}
