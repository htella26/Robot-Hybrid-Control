function tau = taufunc(t, q, qd)

   
if t<.25
    tau=[10 0]
else
    tau=[0 0];
end