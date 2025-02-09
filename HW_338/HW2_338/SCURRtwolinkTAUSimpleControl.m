function tau = taufunc(t, q, qd)

   
if t<2
    tau=[2*(pi/2-q(1)) 0]
else
    tau=[0 0];
end