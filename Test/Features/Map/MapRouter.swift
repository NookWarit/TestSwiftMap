import Foundation
protocol MapDataPassing {
    
}

class MapRouter: MapDataPassing {
    // MARK: - Variable
    weak var viewController: MapViewController?
    var dataStore: MapDataStore?
    
    // MARK: - Life Cycle
    deinit {
        print("MapRouter DEINIT")
    }
}
