//1 bit full adder defination
module full_adder(sum, c_out, a, b, cin);
input a,b,cin;
output sum,c_out;

//internal nets 
wire s1,c1,c2;
//logic equations

xor (s1,a,b);
and (c1,a,b);

xor (sum,s1,cin);
and (c2,s1,cin);

xor (c_out,c2,c1);

endmodule


//4 bit full adder

module bit4_full_adder(sum,c_out,a,b,cin);

output [3:0] sum;
output c_out;
input [3:0] a,b;
input cin;

//internal nets
wire c1,c2,c3;

//instantiate full adder
full_adder f0(sum[0],c1,a[0],b[0],cin);
full_adder f1(sum[1],c2,a[1],b[1],c1);
full_adder f2(sum[2],c3,a[2],b[2],c2);
full_adder f3(sum[3],c_out,a[3],b[3],c3);
endmodule

//test bench

module testbench;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire c_out;

//instantiate full adder

bit4_full_adder uut(
    .sum(sum),
    .c_out(c_out),
    .a(a),
    .b(b),
    .cin(cin)
    );

initial begin

    $dumpfile("bit4_full_adder.vcd");
    $dumpvars(0, testbench);
    $monitor($time,"a=%b b=%b cin=%b sum=%b c_out=%b\n",a,b,cin,sum,c_out);

    a = 4'd0; b = 4'd0; cin = 1'b0;
    #5 a = 4'd3; b = 4'd4;
    #5 a = 4'd2; b = 4'd5;
    #5 a = 4'd9; b = 4'd9;
    #5 a = 4'd10; b = 4'd15;

    #5 a = 4'd10; b = 4'd5; cin = 1'b1;
  
end
endmodule

     

