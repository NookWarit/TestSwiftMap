import Foundation
protocol MainDataPassing {
    
}

class MainRouter: MainDataPassing {
    // MARK: - Valiable
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    // MARK: - Life Cycle
    deinit {
        print("MainRouter DEINIT")
    }
    
    // MARK: - Navigation
    func routeToMap(data: Main.FetchData.ViewModel.DisplayStation) {
        guard let mapVC = Scene.map.viewController() as? MapViewController else { return }
        mapVC.router?.dataStore?.request = Map.FetchData.Request(data: data)
        viewController?.navigationController?.pushViewController(mapVC, animated: true)
    }
}
