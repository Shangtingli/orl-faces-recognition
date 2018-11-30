function [f_matrix,realclass] = ReadFace2(npersons,flag)
%????orl_face????????????????????????  
%??????  
%     npersons-??????????????,????????????????????????????????????????????  
%     imgrow-??????????????????????  
%     imgcol-??????????????????????  
%     flag-????????0????????????????????1????????????????  
%??????
%     f_matrix-??????????????????????f_matrix????f_matrix??????????????
%              ??????????????????img(:)'??????????????????????????????,
%              img = imread(face_file); f_matrix(i,:) = img(:)';
%     realclass-????????????f_matrix??????????????????
%??????????????imgrow=112; imgcol=92;  
global imgrow;  
global imgcol;  
realclass=zeros(npersons*5,1);  
f_matrix=zeros(npersons*5,112*92);  
for i=1:npersons  
    facepath='orl_faces/s';  
    facepath=strcat(facepath,num2str(i));  
    facepath=strcat(facepath,'/');  
    cachepath=facepath;  
    for j=1:5  
        facepath=cachepath;  
        if flag==0 %??????????????????????  
            facepath=strcat(facepath,'0'+j);  
            realclass((i-1)*5+j)=i;
        else %????????????????  
            facepath=strcat(facepath,num2str(5+j));  
            realclass((i-1)*5+j)=i;  
        end  
        facepath=strcat(facepath,'.pgm');  
        img=imread(facepath);
        f_matrix((i-1)*5+j,:)=img(:)'; 
    end  
end  
end  
