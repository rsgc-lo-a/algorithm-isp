import Foundation
import Darwin

class Sketch : NSObject {

    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    var random = Double(Int(arc4random_uniform(500)))
    var random_1 = Double(Int(arc4random_uniform(500)))
    var random_2 = Double(Int(arc4random_uniform(500)))
    var random_3 = Double(Int(arc4random_uniform(500)))
    
    //variable that is going to increase
    var x = Double(0)
    var y = Double (0 - 500) //delays
    
    //Variable that is going to decrease
    var negx = 0 //leaving this on, else draw.function fails
    var negy = 0 //leaving this on, else draw.function fails
    var maxX = Double(500 + 1000) //delays
    var maxY = Double(500 + 2000) //delays
    
    //Mouse Thingy
    var mouseX = 0
    var mouseY = 0
    
    //Rect
    var rectX = Int(500/2) - 15 //canvas has to be in draw
    var rectY = Int(500/2) - 15
    
    var bulletX = Double(-100) //Double allows decimal and coord of the bulletX
    var bulletY = Double(-100) //Coord of bulletY
    var Xspeed = Double(0) //The thing that makes the bullet move
    var Yspeed = Double(0) // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    var shot = 0 //Verify single bullet, doesn't allow double bullet
    var rainbow = Float(0) //Rainbow effect on bullet
    //control the framerate
    var frameRate = 30
    
    var life = true

    // This runs once, equivalent to setup() in Processing
    
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = frameRate
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        
//bulletX, bulletY Coords reset while outside of the
        rainbow += 50
        
        if (life == true) { //Function cease if life == false
            
        
        if(bulletY<0 || bulletY > Double(canvas.height) || bulletX > Double(canvas.width) || bulletX < 0) {
            bulletX = -100
            bulletY = -100
            Xspeed = 0
            Yspeed = 0
            shot = 0
        }

        bulletX += Double(Xspeed)
        bulletY += Double(Yspeed)
        

        //Self Changing variables
        x = x + 3
        y = y + 3
        
        negx = negx - 3
        negy = negy - 3
        maxX = maxX - 3
        maxY = maxY - 3
        
        
////////////////////////
        // Clear the background
        //Create a rectangle with the given canvas size
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
            
////////////////////////
        //Draw the Rectangle and place it in the centre of the canvas
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 100)
        canvas.drawRectangle(bottomRightX: rectX, bottomRightY: rectY , width: 30, height: 30)
        
////////////////////////
        
        canvas.fillColor = Color(hue: rainbow, saturation: 250, brightness: 250, alpha: 100)
        canvas.drawEllipse(centreX: Int(bulletX), centreY:Int(bulletY), width: 10, height: 10)
        
////////////////////////
        //Going right from the left
        //Draw a circle to represent, random location
        //ball number 1
        canvas.fillColor = Color(hue: 120, saturation: 25, brightness: 255, alpha: 100)
        canvas.drawEllipse(centreX: Int(x), centreY:Int(random), width: 30, height: 30)
        
        //Allows the ball to extend over 15, resets x value and reshoot random value
        if x > 515 {
            x = 0
            random = Double(Int(arc4random_uniform(500)))
        }
        
////////////////////////
        //Going upward from the bottom
        //Draw a circle to represent, random location
        canvas.drawEllipse(centreX:Int(random_1), centreY:Int(y), width: 30, height: 30)
        
        //Reset X value and reshoot random_1 value
        if y > 515 {
            y = 0
            random_1 = Double(Int(arc4random_uniform(500))) //different random
            print (y)
        }
        
////////////////////////
        //Going left from the right
        //Draw a circle to represent, random location if
        
        canvas.drawEllipse(centreX: Int(maxX) , centreY: Int(random_2), width: 30, height: 30)
        
        if maxX < -15 {
            maxX = 500
            random_2 = Double(Int(arc4random_uniform(500))) //DIfferent random
        }
        
////////////////////////
        //        //Going right from the left
        //        //Draw a circle to represent, random location
        
        canvas.drawEllipse(centreX: Int(random_3), centreY: Int(maxY) , width: 30, height: 30)
        
        if maxY < -15 {
            maxY = 500
            random_3 = Double(Int(arc4random_uniform(500)))
        }
            
////////////////////////

            //If body get hits by balls, life == false
            
            var firstVar_1 = x - Double(rectX)
            var secondVar_1 = random - Double(rectY)
            var distance_1 = sqrt((firstVar_1)*(firstVar_1) + (secondVar_1)*(secondVar_1))
            if distance_1 < 30{
                life = false
            }
            
            firstVar_1 = random_1 - Double(rectX)
            secondVar_1 = y - Double(rectY)
            distance_1 = sqrt((firstVar_1)*(firstVar_1) + (secondVar_1)*(secondVar_1))
            if distance_1 < 30{
                life = false
            }
            
            firstVar_1 = maxX - Double(rectX)
            secondVar_1 = random_2 - Double(rectY)
            distance_1 = sqrt((firstVar_1)*(firstVar_1) + (secondVar_1)*(secondVar_1))
            if distance_1 < 30{
                life = false
            }
            
            firstVar_1 = random_3 - Double(rectX)
            secondVar_1 = maxY - Double(rectY)
            distance_1 = sqrt((firstVar_1)*(firstVar_1) + (secondVar_1)*(secondVar_1))
            if distance_1 < 30{
                life = false
            }
            
////////////////////////
        // Draw some more text on the screen
        canvas.textColor = Color(hue: 60, saturation: 80, brightness: 90, alpha: 100) // yellow
        canvas.drawText(message: "Current frame: \(canvas.frameCount)", size: 12, x: canvas.width / 16, y: canvas.height - canvas.height / 8)
        
////////////////////////
        
        //Reaction to bulletX and bulletY
        //Create a boundry of the ball when reacting with the bullet
        //Boundry for the ball#1 (x, random)

        var firstVar = bulletX-Double(x)
        var secondVar = bulletY-Double(random)
        var distance = sqrt((firstVar)*(firstVar) + (secondVar)*(secondVar)) //Too complex, made two variables
        
        if (distance < 15) {
        
            random = Double(Int(arc4random_uniform(500)))
            x = 0
        }
        
        //Boundary for ball#2
        
        firstVar = bulletX-Double(random_1)
        secondVar = bulletY-Double(y)
        distance = sqrt((firstVar)*(firstVar) + (secondVar)*(secondVar))
        
        if (distance < 15) {
            
            random_1 = Double(Int(arc4random_uniform(500)))
            y = 0
        }
        
        //Boundary for ball#3
        
        firstVar = bulletX-Double(maxX)
        secondVar = bulletY-Double(random_2)
        distance = sqrt((firstVar)*(firstVar) + (secondVar)*(secondVar))
        
        if (distance < 15) {
            
            random_2 = Double(Int(arc4random_uniform(500)))
            maxX = 500
        }
        
        //Boundary for ball#4
        
        firstVar = bulletX-Double(random_3)
        secondVar = bulletY-Double(maxY)
        distance = sqrt((firstVar)*(firstVar) + (secondVar)*(secondVar))
        
        if (distance < 15) {
            
            random_3 = Double(Int(arc4random_uniform(500)))
            maxY = 500
        }
            
        } else {
            //You lose screen
            frameRate = 0
            
            canvas.textColor = Color(hue: 60, saturation: 80, brightness: 90, alpha: 100) // yellow
            canvas.drawText(message: "Game Over", size: 12, x: (canvas.width/2) + 30, y: canvas.height - canvas.height/2)
        }


        
////////////////////////crying blood
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {

        if(shot == 0) {
            bulletX = Double(canvas.width)/2
            bulletY = Double(canvas.height)/2
            shot = 1
           Xspeed = Double((Int((canvas.mouseX)) - ((canvas.width)/2)))
            Yspeed = Double((Int((canvas.mouseY)) - ((canvas.height)/2)))
            
            print(Xspeed + Yspeed)
            print("Change:")
            var change = 1.00001
            if(Xspeed < 0) {
                Xspeed *= -1
            }
            if(Yspeed < 0) {
                Yspeed *= -1
            }
            
            change = 10/(Xspeed+Yspeed)
            print(change)
            print("||")
            Xspeed = Double((Int((canvas.mouseX)) - ((canvas.width)/2)))
            Yspeed = Double((Int((canvas.mouseY)) - ((canvas.height)/2)))
            Xspeed *= change // (Xspeed *=) is the same as (Xspeed = Xspeed *)
            print("XSPEED")
            print(Xspeed)
            Yspeed *= change
        }
    }
}