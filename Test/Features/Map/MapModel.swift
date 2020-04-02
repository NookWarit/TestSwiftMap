import Foundation
import MapKit

enum Map {
    enum FetchData {
        struct Request {
            var data: Main.FetchData.ViewModel.DisplayStation
        }
        
        struct Response {
            var data: Main.FetchData.ViewModel.DisplayStation
        }
        
        struct ViewModel {
            var data: Main.FetchData.ViewModel.DisplayStation
        }
    }
}


