import Foundation
import SQLite3

class DBManager {
    
    static let shared = DBManager()
    
    var db : OpaquePointer?
    var path : String = "client_details.sqlite"
    
    init(){
        self.db = createDB()
        self.createTable()
    }
    
    func createDB() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        print(filePath)
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print ("There was an error creating the database")
            return nil
        } else {
            print("Database has been created with path \(path)")
            return db
        }
    }
    
    func createTable() {
        let query = "CREATE TABLE IF NOT EXISTS details(id INTEGER PRIMARY KEY AUTOINCREMENT, clientid TEXT, clientsecret TEXT);"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print ("Table was created successfully")
            } else {
                print ("Table creation has failed")
            }
        } else {
            print ("Preparation failure")
        }
    }
    
    func insert(clientid : String, clientsecret : String){
        
        let i = canCreateNewUser()
        
        let query = "INSERT INTO details (id, clientid, clientsecret) VALUES (?,?,?)"
        //let query2 = "INSERT INTO details (id, clientid, clientsecret) VALUES (\(i+1),\(clientid),\(clientsecret))"

        var statement : OpaquePointer? = nil
        
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)

//        sqlite3_prepare_v2(db, query2, -1, &statement, nil)
//        sqlite3_step(statement)
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, Int32(i+1))
            sqlite3_bind_text(statement, 2, clientid.cString(using: .utf8), -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(statement, 3, clientsecret.cString(using: .utf8), -1, SQLITE_TRANSIENT)
           // sleep(3)

            if sqlite3_step(statement) == SQLITE_DONE {
                print ("Data inserted successfully")
            } else {
                print ("Data not inserted")
            }

        } else {
            print ("Query incorect")
        }
        
    }
    
    public func canCreateNewUser() -> Int{
        var count = 0
           var queryStatement :OpaquePointer? = nil
            let query = "select count(*) from details;"
           
        if sqlite3_prepare(self.db, query, -1, &queryStatement, nil) == SQLITE_OK{
                 while(sqlite3_step(queryStatement) == SQLITE_ROW){
                     count = Int(sqlite3_column_int(queryStatement, 0))
                     // print("\(count)")
                 }

           }
        
        return count
       }
    
    
    func selectID(x : Int32) -> String? {
        let query = "SELECT clientid FROM details WHERE id = \(x);"

        var statement : OpaquePointer? = nil

        var selectedID = ""

        //sqlite3_bind_int(statement, 1, Int32(x))

        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            selectedID += String(cString: sqlite3_column_text(statement, Int32(x)))
        }

        return selectedID
    }
    
    func selectSecret(x : Int32) -> String{
        let query = "SELECT clientsecret FROM details WHERE id = \(x);"
        
        var statement : OpaquePointer? = nil
        
        var selectedID : String!
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            selectedID = String(cString: sqlite3_column_text(statement, 0))
        }
        
        return selectedID
    }
    
}
