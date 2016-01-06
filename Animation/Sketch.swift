import Foundation

class Sketch {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    //Random number generator with a variable (repeated)
    var random = Int(arc4random_uniform(500) - 30)
    //variable that is going to increase
    var x = 0
    var y = 0
    
    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
    
     }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        
        //Self increasing variables
        x = x + 5
        y = y + 5
        // Clear the background
        //Create a rectangle with the given canvas size
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        //Draw the Rectangle and place it in the centre of the canvas
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 100, saturation: 100, brightness: 100, alpha: 100)
        canvas.drawRectangle(bottomRightX: canvas.width / 2, bottomRightY: canvas.height / 2, width: 25, height: 25)
        
        
        //New colour planned for the circle
        
        //Draw a circle to represent, random location if possible
        canvas.drawEllipse(centreX:random + x, centreY:random + y, width: 30, height: 30)
        
    }
    
}
