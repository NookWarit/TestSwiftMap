import Foundation
import SwiftyJSON

class MainWorker {
    // MARK: - Variable
    private let network = TestAPI()
    
    // MARK: - Function
    func getData(success: @escaping (_ station: [Station]) -> Void,
                 fail: @escaping () -> Void) {
        network.getData(completed: { response in
            let items = response["stationBeanList"].arrayValue
            let stations = items.map({ Station(response: $0) })
            success(stations)
            
        })
    }
    
}
