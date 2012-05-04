clear
nTrks=16139;
file='association.txt';
fid = fopen(file, 'r');
len = fscanf(fid,'%d');

ass=zeros(nTrks,2);
index=1;low=1;
while index<nTrks
    if ((len(low+1,1)-len(low,1))==1)
        ass(index,1)=len(low);ass(index,2)=0;
        index=index+1;low=low+1;
    else 
        low=low+1;
        ass(index,1)=index;ass(index,2)=len(low);
        index=index+1;low=low+1;
    end
end

trk1=readTraks('filtTrks_20000_1.txt');
trk2=readTraks('filtTrks_20000_2.txt');
trk3=readTraks('filtTrks_20000_3.txt');
trk4=readTraks('filtTrks_20000_4.txt');
trks=[trk1 trk2 trk3 trk4];
figure


for trkId=1:nTrks;

Idsequence=trkId;curId=trkId;
while (1)
    curId=ass(curId,2);
    
    if curId==0
        break
    end
    Idsequence=[Idsequence curId];
    if Idsequence(end)==Idsequence(end-1)
        break
    end

end

bgIm=imread('bggrand.pgm');
display(num2str(Idsequence(1)))
imshow(bgIm);
colors = ['+r'; '+g'; '+b'; '+c'; '+m'; '+y'];
for i=1:length(Idsequence)
    curTrk=trks(1,Idsequence(i));
    hold on
    plot(curTrk.x, curTrk.y, colors(mod(i,6),:));
end
hold off
pause
end
    