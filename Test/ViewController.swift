



import UIKit
import Firebase
import FirebaseDatabase

struct postStruct {
    var status:Int!
}

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet var tableView: UITableView!

     var posts = [postStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.allowsSelection = false
        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("location").queryOrderedByKey().observe(.childAdded, with: {snapshot in
            guard let firebaseResponse = snapshot.value as? [String:Any] else
            {
                print("Snapshot is nil hence no data returned")
                return
            }
            
            
            let status = firebaseResponse["status"] as! Int

            self.posts.insert(postStruct(status:status), at: 0)
            
            self.tableView.reloadData()

           
        })
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    @IBAction func gets(_ sender: Any) {
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for:indexPath) as! TableViewCell
        cell.gets.tag = indexPath.row
        cell.gets.addTarget(self, action: #selector(self.get), for: .touchDown)

    
            let statusLabel = cell.viewWithTag(3) as! UILabel
            statusLabel.text = String(posts[indexPath.row].status)

        
        return cell
        
    }
    
    //update status function
    func get(_ sender: UIButton){
        
        //This function cannot update existing data when I click the button
        /*
          let statusmessage = FIRDatabase.database().reference()
          let statusdata : [String: AnyObject] = ["status": "I coming" as AnyObject]
          statusmessage.child("location").childByAutoId().setValue(statusdata)
        */

            
    }

   }

