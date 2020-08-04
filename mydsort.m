%function outv=mydsort(vec)
vec=[8 1 0 -3 -1 8]
outv=[]; outv(1)=vec(1); v=vec(2:end);
for i=2:length(vec)
    outv(i)=vec(i); j=i; v(i)=[];
    while j~=1
        if outv(j)>outv(j-1)
            outv([j-1 j])=outv([j j-1]);
        else
            break
        end
        j=j-1;
    end
end
disp(outv)
%end