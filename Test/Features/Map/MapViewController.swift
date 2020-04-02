import UIKit
import MapKit
protocol MapDisplayLogic: class {
    func displayFetDataSuccess(viewModel: Map.FetchData.ViewModel)
    func displayFetDataFail()
}

class MapViewController: UIViewController, MapDisplayLogic {
    // MARK: - IBOutlet
    @IBOutlet var mapView: MKMapView!
    
    // MARK: - Variable
    var interactor: MapBusinessLogic?
    var router: MapRouter?
    var displayData: Main.FetchData.ViewModel.DisplayStation?
    
    // MARK: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configurator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurator()
    }
    
    deinit {
        print("MapViewController DEINIT")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.fetchData()
    }
    
    // Function
    func configurator() {
        let interactor = MapInteractor()
        let presenter = MapPresenter()
        let router = MapRouter()

        router.dataStore = interactor
        router.viewController = self
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        self.interactor = interactor
    }
    
    func displayFetDataSuccess(viewModel: Map.FetchData.ViewModel) {
        displayData = viewModel.data
        
        let location = CLLocationCoordinate2D(latitude: Double(displayData?.latitude ?? "")!, longitude: Double(displayData?.longitude ?? "")!)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = displayData?.name
        mapView.addAnnotation(annotation)
    }
    
    func displayFetDataFail() {
        print("Fail!")
    }
}
