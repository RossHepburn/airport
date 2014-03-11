Whilst all the tests pass the solution doesn't work.

The weather_stormy? method has been stubbed out on the Airport class. This is why all your tests pass. However you haven't included the module meaning that when you create a Plane.new and try and aiport.land you will get an undefined method.

Try it yourself in irb

Also try and think about how you compose the solution. How would implement a different weather provider? Try and make weather a seperate class like we did yesturday in the demo.

When you initialize the plane it takes of straight away, are you crazy?


# FAIL
