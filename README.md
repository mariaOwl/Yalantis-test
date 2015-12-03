# Yalantis-test
Yalantis test app

Xcode : Version 7.1 (7B91b)

#How I did it

I used self sized cells in table view. And I set aspect ratio for images. So article looks like on yalantis website. 
I used AFNetworking library for REST connection to "server". I covered it with my own class YalantisAPIManager. It helps make particular requests to server and provides particular type of results (alredy parsed).
I created model for articles and made category for Dictionary, which helps avoid troubles with data from server.
I set OHHTTPStubs in AppDelegate class, but it could be moved to separated class, which could do stubs for all requests. By the way, OHHTTPStubs works just in DEBUG mode. 
For UI I used Xibs more often. I think it's better idea, because you can reuse UI components, if needed, in easier and nicer way.

#How to make it better

Maybe articles are too big, maybe I should change something in design. I'm not a person with good taste :)
In source code I would add class for OHHTTPStubs. Also I would adapt YalantisAPIManager to real server: add errors handler, base method for calls etc.


