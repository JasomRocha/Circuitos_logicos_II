`timescale 1ns / 100ps

module circuito_equacao_tb;
  
  logic [3:0] X;
  logic [6:0] Z_expected, Z;
  int counter, errors;
  logic [10:0] vector [10];
  logic clk, rst;
  
  
  
  circuito_equacao dut(.X(X), .Z(Z));

  initial begin
    $display("      Iniciando Testbench");
    $display(" |   X  | Z_expec |    Z    |");
    $display(" ----------------------------");
    $readmemb("circuito_equacao.tv", vector);
    counter = 0;
    errors = 0;
    rst = 1; #10; rst = 0;
  end

  always begin // Sempre
    clk = 1; #10; // clock em 1 dura 10 ns
    clk = 0; #10; // clock em 0 dura 10 ns
  end      

  always @(posedge clk) begin
    if (~rst) begin
      
      {X, Z_expected} = vector[counter];
    end 
  end

  always @(negedge clk) begin // Sempre que o clock descer
    if(~rst) begin
      
      assert (Z === Z_expected)
        $display (" | %b | %b | %b | OK", X, Z_expected, Z); 
    end else begin
      $display (" | %b | %b | %b | ERRO: Z esperado: %b", X, Z_expected, Z, Z_expected);
      errors = errors + 1;  // Incrementa contador de erros
    end 

    counter++; // Incrementa contador de vetores de teste 

    if (counter === 10) begin // Quando os vetores de teste acabarem
      $display("Testes Efetuados = %0d", counter);
      $display("Erros Encontrados = %0d", errors);
      #10;
      $stop;
    end     
  end   
endmodule 
