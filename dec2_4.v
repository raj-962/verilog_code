module dec2_4(y,en,a,b);
input a,b,en;
output [0:3]y;
wire abar,bbar;

not g1(abar,a);
not g2(bbar,b);

and g_1(y[0],en,abar,bbar);
and g_2(y[1],en,abar,b);
and g_3(y[2],en,bbar,a);
and g_4(y[3],en,b,a);

endmodule 

module testbench;

reg a,b,en;
wire [0:3]y;

dec2_4 utt(

    .a(a),
    .b(b),
    .en(en),
    .y(y)


);

initial begin
    $dumpfile("dec2_4.vcd");
    $dumpvars(0,testbench);

    $monitor($time,"a=%b | b=%b | en=%b | y =%b",a,b,en,y);

    #5 a=0; b=0; en=1;
    #5 a=0; b=1; en=1;
    #5 a=1; b=0; en=1;
    #5 a=1; b=1; en=1;

end   
endmodule
    
