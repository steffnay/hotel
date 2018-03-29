What classes does each implementation include? Are the lists the same?
  -Implementation A: CartEntry, ShoppingCart, Order
  -Implementation B: CartEntry, ShoppingCart, Order
  -Yes, both implementations have the same list of classes
Write down a sentence to describe each class.
  -CartEntry is each object that has a price and quantity.
  -ShoppingCart holds an array of CartEntry objects.
  -Order creates a new ShoppingCart and has a method to calculate the total  price of all the objects in the cart.
How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  -Order is an instance of ShoppingCart, which contains an array of CartEntry objects
What data does each class store? How (if at all) does this differ between the two implementations?
  -The two implementations store the same data.
  -CartEntry holds the unit price and quantity of each CartEntry instance.
  -ShoppingCart holds an array of all CartEntry objects
  -Order holds a new ShoppingCart instance
What methods does each class have? How (if at all) does this differ between the two implementations?
  -In Implementation A, the only class that has methods other than initialize is Order, which has a total_price method.
  -In Implementation B, each class has a price method in addition to initialize.
Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  -The Order#total price logic in Implementation A is all contained in the Order class.
  -For Implementation B, the logic for Order#total is delegated to the "lower level" CartEntry and ShoppingCart classes that have price methods.
Does total_price directly manipulate the instance variables of other classes?
  -Implementation A has total_price manipulating the instance variables for CartEntry instances, while the total_price Implementation B does not manipulate other classes' instance variables.
If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  -We would have to change the price if the quantity is over a certain number. It would be easier to modify Implementation B because you could just modify ShoppingCart#price.
Which implementation better adheres to the single responsibility principle?
  -Implementation B because it doesn't accumulate logic into one "high level" class, which is what happens in Implementation A.
Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
  -Implementation B
