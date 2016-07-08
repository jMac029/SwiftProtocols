protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable {
    func prettyDescription() -> String
}

struct User: PrettyPrintable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    
    func prettyDescription() -> String {
        return "name: \(name)\nage: \(age)\naddress: \(address)"
    }
}

let user = User(name: "James", age: 33, address: "an Address")
    
print (user.prettyDescription())

/*****************************************/
//Protocol Oriented Programming (POP)

struct Point {
    var x: Int
    var y: Int
    
    func pointsAroundMe(withRange range: Int) -> [Point] {
        var results: [Point] = []
        
        for x in (self.x - range)...(self.x + range) {
            for y in (self.y - 1)...(self.y + 1) {
                let point = Point(x: x, y: y)
                results.append(point)
            }
        }
        
        return results
    }
}

enum Direction {
    case Up, Down, Right, Left
}

protocol Movable {
    func move(direction: Direction, distance: Int)
}

protocol Destructable {
    func decreaseLife(factor: Int)
}

protocol Attackable {
    var strength: Int { get }
    var range: Int { get }
    
    func attack(player: PlayerType)
}

protocol PlayerType {
    var position: Point { get set }
    var life: Int { get set }
    
    init(point: Point)
}

class Enemy: PlayerType, Destructable , Attackable, Movable {
    
    var position: Point
    var life: Int = 10
    var strength: Int = 5
    var range: Int = 2
    
    required init(point: Point) {
        self.position = point
    }
    
    func decreaseLife(factor: Int) {
        self.life -= factor
    }
    
    func attack(var player: PlayerType) {
        player.life = player.life - strength
    }
    
    func move(direction: Direction, distance: Int) {
        switch direction {
        case .Up: position.y += 1
        case .Down: position.y -= 1
        case .Left: position.x -= 1
        case .Right: position.x += 1
        }
    }
}



