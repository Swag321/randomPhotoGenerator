# randomPhotoGenerator
Generates random pictures upon click of the button.
Employes a color array with system colors as elements which are randomly picked as background color values for view and button.

The constant imageView acts as a container of type UIImageView and the constant button is a UIButton with the Title "Show Image" and the background color black (which is actually redundant since getRandomPhoto() will change it's color randomly anyway).

This is where things get more interesting.

We override the methods viewDidLoad() and ViewDidLayoutSubviews() from the parent class. Within the overriden methond, we call the original method from the superclass and add our UI design to it.

We also have the getRandomPhoto method prefixed with @objc which through my research is kind of a pipeline between the worlds of objective C and Swift. Without @objc, Swift is not able to communicate to the legacy remains of Objective C which is the input required for #selector. 
In this getRandomPhoto method, we cast our website link from a string data type to a URL. 
The way that I've found guard to work is that if the expression is false the statement within the else bracket is executed (which in this case is simply an empty return to avoid error) otherwise it's not. "try?" attempts to extract data from the URL and store in the constant variable data. 
This data is converted to a UIIMage and gets put into the imageView container with the .image attribute. 
