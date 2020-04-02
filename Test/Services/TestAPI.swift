import Foundation
import Alamofire
import SwiftyJSON

class TestAPI {
    func getData(completed: @escaping (_ response: JSON) -> Void) {
        Alamofire.request("https://feeds.citibikenyc.com/stations/stations.json",
                          method: .get)
            .responseJSON(completionHandler: { response in
                completed(JSON(response.value ?? [:]))
        })
    }
    
}
