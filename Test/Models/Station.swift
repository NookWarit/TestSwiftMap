import Foundation
import SwiftyJSON

struct Station {
    var name: String
    var lastCommunicationTime: String
    var availableDocks: Int
    var totalDocks: Int
    var availableBikes: Int
    var latitude: String
    var longitude: String
    
    init() {
        name = ""
        lastCommunicationTime = ""
        availableDocks = 0
        totalDocks = 0
        availableBikes = 0
        latitude = ""
        longitude = ""
    }
    
    init(response: JSON) {
        name = response["stationName"].stringValue
        lastCommunicationTime = response["lastCommunicationTime"].stringValue
        availableDocks = response["availableDocks"].intValue
        totalDocks = response["totalDocks"].intValue
        availableBikes = response["totalDocks"].intValue
        latitude = response["latitude"].stringValue
        longitude = response["longitude"].stringValue
    }
}
