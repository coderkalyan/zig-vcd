module dummy();
    reg clk, rst_n;
    reg [7:0] addr, data;
    reg wen;

    initial begin
        $dumpfile("dummy.vcd");
        $dumpvars(0, dummy);

        clk = 0;
        rst_n = 0;
        wen = 0;

        // deassert reset synchronously
        @(posedge clk);
        rst_n = 1;

        addr = 8'hca;
        data = 8'hfe;
        wen = 1;
        @(posedge clk);

        addr = 8'hb0;
        data = 8'hba;
        @(posedge clk);

        addr = 8'hde;
        data = 8'had;
        wen = 0;
        @(posedge clk);

        $finish;
    end

    always
        #5 clk <= ~clk;
endmodule
