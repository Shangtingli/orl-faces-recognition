%flag: 0 for training set, 1 for testing set
function [f_matrix,realclass] = ReadFace(npersons,flag)
    i = 0;
    global imgrows
    global imgcols
    imgrows = 112;
    imgcols = 92;
    TotalImage = npersons*5;
    f_matrix = zeros(TotalImage,imgrows*imgcols);
    realclass = zeros(TotalImage,1);
    startIndex = 1;
    endIndex = 5;
    increment= 0;
    if (flag ==1)
        increment = 5;
    end
    idxFaces = startIndex+increment;
    while(i<npersons)
        foldername = strcat('orl_faces/','s',int2str(i+1),'/');
        while(idxFaces<=endIndex+increment)
            filename = strcat(int2str(idxFaces),'.pgm');
            fullpath = strcat(foldername,filename);
            img = imread(fullpath);
            f_matrix(i*5+idxFaces-increment,:) = img(:)';
            realclass(i*5+idxFaces-increment) = i+1;
            idxFaces = idxFaces+1;
        end
        i= i+1;
        idxFaces = startIndex+increment;
    end
end