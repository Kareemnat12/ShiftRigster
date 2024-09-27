module slsr (
    input bit sl, 
    input bit sr, 
    input bit reset, 
    input bit clk, 
    input bit din,
    output bit [7:0] Q
);
    reg [7:0] current_data;

    always @(posedge clk or posedge reset) begin 
        if (reset) begin 
            current_data <= 8'b0; // Clear current_data on reset
        end else begin 
            if (sl && !sr) begin 
                current_data <= {din, current_data[7:1]}; // Shift in din at MSB
            end else if (!sl && sr) begin 
                current_data <= {current_data[6:0], din}; // Shift in din at LSB
            end 
            
        end
    end 

    assign Q = current_data; // Assign output
endmodule
