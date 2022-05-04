# Music Player Thing
 
| Name | Student Number |
| ----------- | ----------- |
| Elunga Mkunde | C21359403 |
| Erik Watchorn | C21449374 |
| Adam Crossan | C21505593 |
| Eoghan O’Reilly | C21430996 |
 
## What does our project do?
Our project is a music player. It contains many visualisers (such as a rotating cube and a dance floor), an audio scrubber and the ability to pause and unpause the music track at any time.

## What are the controls?
The player can be paused and unpaused at any time by pressing space. It also contains a scrubber, which allows for the movement of the audio track to specific points in the song.

## How does the project run?
The project immediately plays the music whenever the Processing sketch is run.

## What are we most proud of?
| Team Member | Source of Pride |
| Elunga |  What I am most proud of during the development of our music project is the confidence we developed, as well as the confidence demonstrated by our team. Despite the fact that complications constantly recurring, we were able to overcome them. In addition, I am pleased with the concepts we developed, which performed better than planned. |
| Erik W | I'm most proud of the kind of framework that I set up for the project (i.e. variable to sync stuff to music, queueing classes, getting minim to work in classes). Given this is more boring than a fancy effect it was the most challenging at the time I made it and was a good bit of fun to figure out using classes in procesing. |
| Adam | I'm most proud of the way I used arrays with shapes to create the heart patterns and healthbar, which both react to music. A small amount of interactivity was involved with this visualiser, as a directional light changes the background brightness within the visualiser, determined by the mouse's X/Y values.  | 
| Eoghan | I was most proud of the rotating CDs as getting them to work properly was a lot harder than I thought it would be. It was satisfying seeing them finally work. | 

## What each team member did?
| Team Member | What They Did |
| Elunga | Originally, I proposed a selection of songs alongside the length that the music ought to be. I created a several animations (in Photoshop) that were intended to be featured, unfortunately due to unforeseen circumstances, they were not. I combined 3D fundamentals and generative image rasterization to construct an abstract 3D portrait from an image file. |
| Erik W | Set up a variable (musicAvg) for calculations that want to sync to the music. For this, I had to clone the array of audioBuffer.size() to abClone() and sending them into classes. A simple system for queueing classes (each class holds a separate visual effect) that runs at specific set times. Progress bar/ scrubber that allows you to change the position of the audio. Also pressing space to pause and unpause. There is also a timer that required calculating seconds/minutes from milliseconds and adding a 0 if the second was a single digit to prevent '4:9' instead of '4:09' being displayed. Simple bar visualiser, can be set to have smallest -> biggest music value graphs. Cube visualiser that rotates, changes size and colour based on the musicAvg variable. Some work with Eoghan on the dance floor class, making it work with the music. |
| Adam | Produced the HeartVisualiser pde and resources involved. This also involved SVGs used for shapes within the pde, and an image texture used on the disco ball. |
| Eoghan | I helped with the dance floor and disco ball. I also made the rotating CDs. |
