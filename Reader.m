faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');
%?????
videoFileReader = vision.VideoFileReader('visionface.avi');
%??????????
videoInfo = info(videoFileReader);
videoPlayer = vision.VideoPlayer('Position',[300 100 videoInfo.VideoSize+30]);
%???????
while ~isDone(videoFileReader)
   videoFrame = step(videoFileReader);
   %?????????
   bbox = step(faceDetector,videoFrame);
   videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
   step(videoPlayer,videoOut);
end
release(videoFileReader);
release(videoPlayer);
%displayEndOfDemoMessage('~/Desktop');