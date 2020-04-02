import UIKit

extension Scene {
    func viewController() -> UIViewController {
        let SBMain = UIStoryboard(name: "Main", bundle: nil)
        let SBMap = UIStoryboard(name: "Map", bundle: nil)
        
        switch self {
        case .mainNav:
            return SBMain.instantiateViewController(withIdentifier: "MainNav")
        case .map:
            return SBMap.instantiateViewController(withIdentifier: "Map")
        }
    }
}
