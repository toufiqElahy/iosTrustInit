// Copyright DApps Platform Inc. All rights reserved.

import UIKit

class CurrTypeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var myTableView: UITableView!
    
    private let fruit: NSArray = ["apple", "orange", "banana", "strawberry", "lemon"]
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: self.searchResultsController)
//        searchController.delegate = self
//        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search tokens"
        searchController.searchBar.sizeToFit()
//        searchController.searchBar.delegate = self
        definesPresentationContext = true
        return searchController
    }()

    lazy var searchResultsController: SearchTokenResultsController = {
        let resultsController = SearchTokenResultsController()
//        resultsController.delegate = self
        return resultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get width and height of View
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - (barHeight+navigationBarHeight)))
        myTableView.register(CurrTypeTableViewCell.self, forCellReuseIdentifier: "cell")         // register cell name
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //Auto-set the UITableViewCells height (requires iOS8+)
        myTableView.rowHeight = 70
        myTableView.estimatedRowHeight = 70
        
        myTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = Colors.blue
        searchController.searchBar.tintColor = .white
        
        self.view.addSubview(myTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // called when the cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Value: \(fruit[indexPath.row])")
    }
    
    // return the number of cells each section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return fruit.count
    }
    
    // return cells
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrTypeTableViewCell
        
        cell.labCurrTypeName.text = "\(fruit[indexPath.row])"

        
        cell.imgCurrType.roundedImage()
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.isActive = true
    }
    
    func didPresentSearchController(searchController: UISearchController) {
        searchController.searchBar.becomeFirstResponder()
    }
}



extension UIImageView {
    
    func roundedImage() {
       
        print(self.frame.size.width)
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
