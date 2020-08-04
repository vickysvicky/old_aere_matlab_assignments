function angle = angleCorrector(angles)
e = .1;
if abs(angles(1) - angles(3)) < e
   angle  = (angles(1) + angles(3)) / 2.0;
elseif abs(angles(1) - angles(2)) < e
   angle = (angles(1) + angles(2)) / 2.0;
elseif abs(angles(2) - angles(3)) < e
    angle  = (angles(2) + angles(3)) / 2.0;
else 
    angle = 0;
end

end