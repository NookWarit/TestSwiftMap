import Foundation

protocol MapBusinessLogic {
    func fetchData()
}

protocol MapDataStore {
    var request: Map.FetchData.Request? { get set }
}

class MapInteractor: MapBusinessLogic, MapDataStore {
    
    // MARK: - Variable
    var presenter: MapPresentationLogic?
    var request: Map.FetchData.Request?
    
    // MARK: - Life Cycle
    deinit {
        print("MapInteractor DEINIT")
    }
    
    // MARK: - Business Logic
    func fetchData() {
        guard let requestData = request?.data else { return }
        let response = Map.FetchData.Response(data: requestData)
        presenter?.presentFetchDataSuccess(response: response)
    }
    
}
